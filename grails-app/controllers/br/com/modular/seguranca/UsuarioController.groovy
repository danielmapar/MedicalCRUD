package br.com.modular.seguranca

import org.springframework.dao.DataIntegrityViolationException;

import br.com.modular.cliente.Cliente;
import br.com.modular.cliente.PlanoDeSaudeContratado;
import br.com.modular.formatacao.DomainService.UsuarioType;
import br.com.modular.instituicao.Consulta;
import br.com.modular.usuario.Endereco;
import grails.plugins.springsecurity.Secured

class UsuarioController {
	
	def springSecurityService
	
    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def index() {
        redirect(action: "listagem", params: params)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def cadastrar() {
        [usuarioInstance: new Usuario(params),
		 clienteInstance: new Cliente(params),
		 planoDeSaudeContratadoInstance: new PlanoDeSaudeContratado(params),
		 enderecoInstance: new Endereco(params)]
    }

    def salvar() {
		
        Usuario usuarioInstance = new Usuario(params)
	    usuarioInstance.tipoUsuario = UsuarioType.C
		usuarioInstance.enabled = true
        Cliente clienteInstance = new Cliente(params)
		PlanoDeSaudeContratado planoDeSaudeContratadoInstance = new PlanoDeSaudeContratado(params)
		Endereco enderecoInstance = new Endereco(params)
		
		clienteInstance.setPlanosDeSaudeContratados(planoDeSaudeContratadoInstance)
		clienteInstance.setEndereco(enderecoInstance)
		usuarioInstance.setCliente(clienteInstance)
		
		Regra regra = Regra.findByAuthority('ROLE_CLIENTE')
		
		if (!usuarioInstance.save(flush: true)) {
            render(view: "cadastrar", model: [usuarioInstance: usuarioInstance,
											  clienteInstance: clienteInstance,
											  planoDeSaudeContratadoInstance: planoDeSaudeContratadoInstance,
											  enderecoInstance: enderecoInstance])
            return
        }
		
		UsuarioRegra.create(usuarioInstance,regra, true)

        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(action: "visualizar", id: usuarioInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def visualizar(Long id) {
		
		def detalhesUsuario = springSecurityService.principal
		Usuario usuarioInstance = Usuario.get(detalhesUsuario.id)
		
		if(usuarioInstance.tipoUsuario == UsuarioType.A){
			usuarioInstance = Usuario.get(id)
		}
	
		Cliente clienteInstance
		PlanoDeSaudeContratado planoDeSaudeContratadoInstance
		Endereco enderecoInstance
		def listaConsultasInstance
		
		if(usuarioInstance){
			clienteInstance = usuarioInstance.cliente
			if(clienteInstance){
				listaConsultasInstance = Consulta.findAllByCliente(clienteInstance)
				planoDeSaudeContratadoInstance = clienteInstance.planosDeSaudeContratados
				enderecoInstance = clienteInstance.endereco
			}
		}
		
		
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "listagem")
            return
        }

        [usuarioInstance: usuarioInstance,
		 clienteInstance: clienteInstance,
		 planoDeSaudeContratadoInstance: planoDeSaudeContratadoInstance,
		 enderecoInstance: enderecoInstance,
		 listaConsultasInstance: listaConsultasInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def editar(Long id) {
        Usuario usuarioInstance = Usuario.get(id)
		Cliente clienteInstance
		PlanoDeSaudeContratado planoDeSaudeContratadoInstance
		Endereco enderecoInstance
		Date dataInstance
		
		if(usuarioInstance){
		clienteInstance = usuarioInstance.cliente
			if(clienteInstance){
				planoDeSaudeContratadoInstance = clienteInstance.planosDeSaudeContratados
				enderecoInstance = clienteInstance.endereco
				dataInstance = planoDeSaudeContratadoInstance.dataVencimentoBoleto
			}
		}
		
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "listagem")
            return
        }

        [usuarioInstance: usuarioInstance,
		 clienteInstance: clienteInstance,
		 planoDeSaudeContratadoInstance: planoDeSaudeContratadoInstance,
		 enderecoInstance: enderecoInstance,
		 dataInstance:dataInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def atualizar(Long id, Long version) {
		
        Usuario usuarioInstance = Usuario.get(id)
		Cliente clienteInstance
		PlanoDeSaudeContratado planoDeSaudeContratadoInstance
		Endereco enderecoInstance
		
		if(usuarioInstance){
		clienteInstance = usuarioInstance.cliente
			if(clienteInstance){
				planoDeSaudeContratadoInstance = clienteInstance.planosDeSaudeContratados
				enderecoInstance = clienteInstance.endereco
			}
		}
		
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (usuarioInstance.version > version) {
                usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                render(view: "editar", model: [usuarioInstance: usuarioInstance])
                return
            }
        }
		
        usuarioInstance.properties = params
		clienteInstance.properties = params
		enderecoInstance.properties = params
		planoDeSaudeContratadoInstance.properties = params
		
		clienteInstance.setPlanosDeSaudeContratados(planoDeSaudeContratadoInstance)
		clienteInstance.setEndereco(enderecoInstance)
		usuarioInstance.setCliente(clienteInstance)

        if (!usuarioInstance.save(flush: true)) {
            render(view: "editar", model: [usuarioInstance: usuarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(action: "visualizar", id: usuarioInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def usuarioInstance = Usuario.get(id)
		
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "listagem")
            return
        }

        try {
			
			UsuarioRegra.remove(usuarioInstance, Regra.findByAuthority('ROLE_CLIENTE'))
            usuarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

package br.com.modular.instituicao

import org.springframework.dao.DataIntegrityViolationException
import br.com.modular.cliente.Cliente;
import br.com.modular.seguranca.Usuario;
import grails.plugins.springsecurity.Secured


class ConsultaController {
	
	def springSecurityService
	
    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def index() {
        redirect(action: "listagem", params: params)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [consultaInstanceList: Consulta.list(params), consultaInstanceTotal: Consulta.count()]
    }
	
	@Secured(['ROLE_ADMINISTRADOR', 'ROLE_CLIENTE'])
    def cadastrar() {
        [consultaInstance: new Consulta(params),
		 instituicaoMedicaId: params.instituicaoMedica.id]
    }
	
	@Secured(['ROLE_ADMINISTRADOR', 'ROLE_CLIENTE'])
    def salvar() {
		InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(params.instituicaoMedicaId)
        Consulta consultaInstance = new Consulta(params)
		
		def detalhesUsuario = springSecurityService.principal
		Usuario usuario = Usuario.get(detalhesUsuario.id)
		if(usuario && usuario.cliente){
			consultaInstance.cliente = usuario.cliente
			instituicaoMedicaInstance.addToConsultas(consultaInstance)
		}
		
        if (!instituicaoMedicaInstance.save(flush: true) && !consultaInstance.save(flush: true)) {
            render(view: "cadastrar", model: [consultaInstance: consultaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'consulta.label', default: 'Consulta'), consultaInstance.id])
        redirect(action: "visualizar", id: consultaInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR', 'ROLE_CLIENTE'])
    def visualizar(Long id) {
        def consultaInstance = Consulta.get(id)
        if (!consultaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), id])
            redirect(action: "listagem")
            return
        }

        [consultaInstance: consultaInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
        def consultaInstance = Consulta.get(id)
        if (!consultaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), id])
            redirect(action: "listagem")
            return
        }

        [consultaInstance: consultaInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
        def consultaInstance = Consulta.get(id)
        if (!consultaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (consultaInstance.version > version) {
                consultaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'consulta.label', default: 'Consulta')] as Object[],
                          "Outro usuário atualizou a Consulta enquanto você edita")
                render(view: "editar", model: [consultaInstance: consultaInstance])
                return
            }
        }

        consultaInstance.properties = params

        if (!consultaInstance.save(flush: true)) {
            render(view: "editar", model: [consultaInstance: consultaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'consulta.label', default: 'Consulta'), consultaInstance.id])
        redirect(action: "visualizar", id: consultaInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def consultaInstance = Consulta.get(id)
        if (!consultaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), id])
            redirect(action: "listagem")
            return
        }

        try {
            consultaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'consulta.label', default: 'Consulta'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'consulta.label', default: 'Consulta'), id])
            redirect(action: "listagem", id: id)
        }
    }
}

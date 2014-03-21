package br.com.modular.instituicao

import org.springframework.dao.DataIntegrityViolationException

import br.com.modular.formatacao.DomainService.InstituicaoType;
import br.com.modular.usuario.Endereco;
import grails.plugins.springsecurity.Secured

class LaboratorioController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]
	
    def index() {
        redirect(action: "listagem", params: params)
    }

    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [instituicaoMedicaInstanceList: InstituicaoMedica.findAllByTipoInstituicao(InstituicaoType.L, [max: params.max]), instituicaoMedicaInstanceTotal: InstituicaoMedica.countByTipoInstituicao(InstituicaoType.L)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def cadastrar() {
        [instituicaoMedicaInstance: new InstituicaoMedica(params),
		 laboratorioInstance: new Laboratorio(params),
		 enderecoInstance: new Endereco(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
		InstituicaoMedica instituicaoMedicaInstance = new InstituicaoMedica(params)
		Laboratorio laboratorioInstance = new Laboratorio(params)
		Endereco enderecoInstance = new Endereco(params)
		
		instituicaoMedicaInstance.tipoInstituicao = InstituicaoType.L
		instituicaoMedicaInstance.laboratorio  = laboratorioInstance 
		instituicaoMedicaInstance.endereco = enderecoInstance
				
        if (!instituicaoMedicaInstance.save(flush: true)) {
            render(view: "cadastrar", model: [instituicaoMedicaInstance: instituicaoMedicaInstance,
											  laboratorioInstance: laboratorioInstance,
											  enderecoInstance: enderecoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), laboratorioInstance.id])
        redirect(action: "visualizar", id: instituicaoMedicaInstance.id)
    }

    def visualizar(Long id) {
        InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Laboratorio laboratorioInstance = instituicaoMedicaInstance.laboratorio
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), id])
            redirect(action: "listagem")
            return
        }

        [instituicaoMedicaInstance: instituicaoMedicaInstance,
		 laboratorioInstance: laboratorioInstance,
		 enderecoInstance: enderecoInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
		
        InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Laboratorio laboratorioInstance = instituicaoMedicaInstance.laboratorio
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), id])
            redirect(action: "listagem")
            return
        }

        [instituicaoMedicaInstance: instituicaoMedicaInstance,
		 laboratorioInstance: laboratorioInstance,
		 enderecoInstance: enderecoInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
		
        InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Laboratorio laboratorioInstance = instituicaoMedicaInstance.laboratorio
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (laboratorioInstance.version > version) {
                laboratorioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'laboratorio.label', default: 'Laboratorio')] as Object[],
                          "Outro usuário atualizou esse Laboratorio enquanto você edita")
                render(view: "editar", model: [laboratorioInstance: laboratorioInstance])
                return
            }
        }

        instituicaoMedicaInstance.properties = params
        laboratorioInstance.properties = params
		enderecoInstance.properties
		
		instituicaoMedicaInstance.setLaboratorio(laboratorioInstance)
		instituicaoMedicaInstance.setEndereco(enderecoInstance)
		
        if (!instituicaoMedicaInstance.save(flush: true)) {
            render(view: "editar", model: [laboratorioInstance: laboratorioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), laboratorioInstance.id])
        redirect(action: "visualizar", id: instituicaoMedicaInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def instituicaoMedicaInstance = InstituicaoMedica.get(id)
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), id])
            redirect(action: "listagem")
            return
        }

        try {
            instituicaoMedicaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

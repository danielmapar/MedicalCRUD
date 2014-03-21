package br.com.modular.instituicao

import org.springframework.dao.DataIntegrityViolationException

import br.com.modular.formatacao.DomainService.InstituicaoType;
import br.com.modular.usuario.Endereco;
import grails.plugins.springsecurity.Secured

class HospitalController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

    def index() {
        redirect(action: "listagem", params: params)
    }

    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [instituicaoMedicaInstanceList: InstituicaoMedica.findAllByTipoInstituicao(InstituicaoType.H, [max: params.max]), instituicaoMedicaInstanceTotal: InstituicaoMedica.countByTipoInstituicao(InstituicaoType.H)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def cadastrar() {
        [instituicaoMedicaInstance: new InstituicaoMedica(params),
		 hospitalInstance: new Hospital(params),
		 enderecoInstance: new Endereco(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
		InstituicaoMedica instituicaoMedicaInstance = new InstituicaoMedica(params)
		Hospital hospitalInstance = new Hospital(params)
		Endereco enderecoInstance = new Endereco(params)
		
		instituicaoMedicaInstance.tipoInstituicao = InstituicaoType.H
		instituicaoMedicaInstance.hospital  = hospitalInstance 
		instituicaoMedicaInstance.endereco = enderecoInstance
		
        if (!instituicaoMedicaInstance.save(flush: true)) {
            render(view: "cadastrar", model: [instituicaoMedicaInstance: instituicaoMedicaInstance,
											  hospitalInstance: hospitalInstance,
											  enderecoInstance: enderecoInstance])
            return
        }
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'hospital.label', default: 'Hospital'), instituicaoMedicaInstance.nome])
        redirect(action: "visualizar", id: instituicaoMedicaInstance.id)
    }

    def visualizar(Long id) {
        InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Hospital hospitalInstance = instituicaoMedicaInstance.hospital
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "listagem")
            return
        }

        [instituicaoMedicaInstance: instituicaoMedicaInstance,
		 hospitalInstance: hospitalInstance,
		 enderecoInstance: enderecoInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
		
        InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Hospital hospitalInstance = instituicaoMedicaInstance.hospital
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "listagem")
            return
        }

        [instituicaoMedicaInstance: instituicaoMedicaInstance,
		 hospitalInstance: hospitalInstance,
		 enderecoInstance: enderecoInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
		
        InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Hospital hospitalInstance = instituicaoMedicaInstance.hospital
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (hospitalInstance.version > version) {
                hospitalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hospital.label', default: 'Hospital')] as Object[],
                          "Outro usu‡rio atualizou esse Hospital enquanto você estava editando")
                render(view: "editar", model: [hospitalInstance: hospitalInstance])
                return
            }
        }
		
		instituicaoMedicaInstance.properties = params
        hospitalInstance.properties = params
		enderecoInstance.properties
		
		instituicaoMedicaInstance.setHospital(hospitalInstance)
		instituicaoMedicaInstance.setEndereco(enderecoInstance)

        if (!instituicaoMedicaInstance.save(flush: true)) {
            render(view: "editar", model: [hospitalInstance: hospitalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hospital.label', default: 'Hospital'), instituicaoMedicaInstance.nome])
        redirect(action: "visualizar", id: instituicaoMedicaInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def instituicaoMedicaInstance = InstituicaoMedica.get(id)
        if (!instituicaoMedicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "listagem")
            return
        }

        try {
            instituicaoMedicaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

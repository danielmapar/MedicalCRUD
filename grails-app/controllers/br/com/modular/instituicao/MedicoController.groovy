package br.com.modular.instituicao

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class MedicoController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

    def index() {
        redirect(action: "listagem", params: params)
    }
	
    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [medicoInstanceList: Medico.list(params), medicoInstanceTotal: Medico.count()]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def cadastrar() {
        [medicoInstance: new Medico(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
		Medico medicoInstance = new Medico(params)
		if (!medicoInstance.save(flush: true)) {
			render(view: "cadastrar", model: [medicoInstance: medicoInstance])
			return
		}
		
		Hospital hospitalInstance
		Clinica clinicaInstance
		
		if(medicoInstance.hospitalId != '' && medicoInstance.hospitalId != null){
			hospitalInstance = Hospital.get(medicoInstance.hospitalId)
			hospitalInstance.addToMedicos_hospital(medicoInstance)
			if (!hospitalInstance.save(flush: true)) {
				render(view: "cadastrar", model: [medicoInstance: medicoInstance])
				return
			}
		}

		if(medicoInstance.clinicaId != '' && medicoInstance.clinicaId != null){
			clinicaInstance = Clinica.get(medicoInstance.clinicaId)
			clinicaInstance.addToMedicos_clinica(medicoInstance)
			if (!clinicaInstance.save(flush: true)) {
				render(view: "cadastrar", model: [medicoInstance: medicoInstance])
				return
			}
		}

        flash.message = message(code: 'default.created.message', args: [message(code: 'medico.label', default: 'Medico'), medicoInstance.id])
        redirect(action: "visualizar", id: medicoInstance.id)
    }
	
    def visualizar(Long id) {

        Medico medicoInstance = Medico.get(id)
		
		Hospital hospitalInstance
		Clinica clinicaInstance
		InstituicaoMedica instituicaoMedicaInstance

		if(medicoInstance.hospitalId != '' && medicoInstance.hospitalId != null){
			println medicoInstance.hospitalId 
			hospitalInstance = Hospital.get(medicoInstance.hospitalId)
			instituicaoMedicaInstance = hospitalInstance.instituicaoMedicaHospital
		}

		if(medicoInstance.clinicaId != '' && medicoInstance.clinicaId != null){
			clinicaInstance = Clinica.get(medicoInstance.clinicaId)
			instituicaoMedicaInstance = clinicaInstance.instituicaoMedicaClinica
		}
		

					
        if (!medicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), id])
            redirect(action: "listagem")
            return
        }

        [medicoInstance: medicoInstance,
		 instituicaoMedicaInstance: instituicaoMedicaInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
        def medicoInstance = Medico.get(id)
        if (!medicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), id])
            redirect(action: "listagem")
            return
        }

        [medicoInstance: medicoInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
        def medicoInstance = Medico.get(id)
        if (!medicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (medicoInstance.version > version) {
                medicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'medico.label', default: 'Medico')] as Object[],
                          "Another user has updated this Medico while you were editing")
                render(view: "editar", model: [medicoInstance: medicoInstance])
                return
            }
        }

        medicoInstance.properties = params

        if (!medicoInstance.save(flush: true)) {
            render(view: "editar", model: [medicoInstance: medicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'medico.label', default: 'Medico'), medicoInstance.id])
        redirect(action: "visualizar", id: medicoInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def medicoInstance = Medico.get(id)
        if (!medicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), id])
            redirect(action: "listagem")
            return
        }

        try {
            medicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'medico.label', default: 'Medico'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medico.label', default: 'Medico'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

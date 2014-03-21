package br.com.modular.instituicao

import org.springframework.dao.DataIntegrityViolationException

import br.com.modular.formatacao.DomainService.InstituicaoType;
import br.com.modular.usuario.Endereco;
import grails.plugins.springsecurity.Secured

class ClinicaController {

	static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

	def index() {
		redirect(action: "listagem", params: params)
	}

	def listagem(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[instituicaoMedicaInstanceList: InstituicaoMedica.findAllByTipoInstituicao(InstituicaoType.C, [max: params.max]), instituicaoMedicaInstanceTotal: InstituicaoMedica.countByTipoInstituicao(InstituicaoType.C)]
	}
	
	@Secured(['ROLE_ADMINISTRADOR'])
	def cadastrar() {
		[instituicaoMedicaInstance: new InstituicaoMedica(params),
		 clinicaInstance: new Clinica(params),
		 enderecoInstance: new Endereco(params)]
	}
	
	@Secured(['ROLE_ADMINISTRADOR'])
	def salvar() {
		InstituicaoMedica instituicaoMedicaInstance = new InstituicaoMedica(params)
		Clinica clinicaInstance = new Clinica(params)
		Endereco enderecoInstance = new Endereco(params)
		
		instituicaoMedicaInstance.tipoInstituicao = InstituicaoType.C
		instituicaoMedicaInstance.clinica  = clinicaInstance
		instituicaoMedicaInstance.endereco = enderecoInstance
		
		if (!instituicaoMedicaInstance.save(flush: true)) {
			render(view: "cadastrar", model: [instituicaoMedicaInstance: instituicaoMedicaInstance,
											  clinicaInstance: clinicaInstance,
											  enderecoInstance: enderecoInstance])
			return
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'clinica.label', default: 'Clinica'), instituicaoMedicaInstance.nome])
		redirect(action: "visualizar", id: instituicaoMedicaInstance.id)
	}

	def visualizar(Long id) {
		InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Clinica clinicaInstance = instituicaoMedicaInstance.clinica
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
		if (!instituicaoMedicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinica.label', default: 'Clinica'), id])
			redirect(action: "listagem")
			return
		}

		[instituicaoMedicaInstance: instituicaoMedicaInstance,
		 clinicaInstance: clinicaInstance,
		 enderecoInstance: enderecoInstance]
	}
	
	@Secured(['ROLE_ADMINISTRADOR'])
	def editar(Long id) {
		
		InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Clinica clinicaInstance = instituicaoMedicaInstance.clinica
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
		if (!instituicaoMedicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinica.label', default: 'Clinica'), id])
			redirect(action: "listagem")
			return
		}

		[instituicaoMedicaInstance: instituicaoMedicaInstance,
		 clinicaInstance: clinicaInstance,
		 enderecoInstance: enderecoInstance]
	}
	
	@Secured(['ROLE_ADMINISTRADOR'])
	def atualizar(Long id, Long version) {
		
		InstituicaoMedica instituicaoMedicaInstance = InstituicaoMedica.get(id)
		Clinica clinicaInstance = instituicaoMedicaInstance.clinica
		Endereco enderecoInstance = instituicaoMedicaInstance.endereco
		
		if (!instituicaoMedicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinica.label', default: 'Clinica'), id])
			redirect(action: "listagem")
			return
		}

		if (version != null) {
			if (clinicaInstance.version > version) {
				clinicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'clinica.label', default: 'Clinica')] as Object[],
						  "Outro usu‡rio atualizou esse Clinica enquanto você estava editando")
				render(view: "editar", model: [clinicaInstance: clinicaInstance])
				return
			}
		}
		
		instituicaoMedicaInstance.properties = params
		clinicaInstance.properties = params
		enderecoInstance.properties
		
		instituicaoMedicaInstance.setClinica(clinicaInstance)
		instituicaoMedicaInstance.setEndereco(enderecoInstance)

		if (!instituicaoMedicaInstance.save(flush: true)) {
			render(view: "editar", model: [clinicaInstance: clinicaInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'clinica.label', default: 'Clinica'), instituicaoMedicaInstance.nome])
		redirect(action: "visualizar", id: instituicaoMedicaInstance.id)
	}
	
	@Secured(['ROLE_ADMINISTRADOR'])
	def deletar(Long id) {
		def instituicaoMedicaInstance = InstituicaoMedica.get(id)
		if (!instituicaoMedicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinica.label', default: 'Clinica'), id])
			redirect(action: "listagem")
			return
		}

		try {
			instituicaoMedicaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'clinica.label', default: 'Clinica'), id])
			redirect(action: "listagem")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'clinica.label', default: 'Clinica'), id])
			redirect(action: "visualizar", id: id)
		}
	}
}

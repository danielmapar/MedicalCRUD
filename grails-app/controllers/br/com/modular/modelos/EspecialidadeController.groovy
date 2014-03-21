package br.com.modular.modelos

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class EspecialidadeController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

    def index() {
        redirect(action: "listagem", params: params)
    }

    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [especialidadeInstanceList: Especialidade.list(params), especialidadeInstanceTotal: Especialidade.count()]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def cadastrar() {
        [especialidadeInstance: new Especialidade(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
        def especialidadeInstance = new Especialidade(params)
        if (!especialidadeInstance.save(flush: true)) {
            render(view: "cadastrar", model: [especialidadeInstance: especialidadeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), especialidadeInstance.id])
        redirect(action: "visualizar", id: especialidadeInstance.id)
    }

    def visualizar(Long id) {
        def especialidadeInstance = Especialidade.get(id)
        if (!especialidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), id])
            redirect(action: "listagem")
            return
        }

        [especialidadeInstance: especialidadeInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
        def especialidadeInstance = Especialidade.get(id)
        if (!especialidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), id])
            redirect(action: "listagem")
            return
        }

        [especialidadeInstance: especialidadeInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
        def especialidadeInstance = Especialidade.get(id)
        if (!especialidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (especialidadeInstance.version > version) {
                especialidadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'especialidade.label', default: 'Especialidade')] as Object[],
                          "Outro usuário atualizou essa Especialidade enquanto você edita")
                render(view: "editar", model: [especialidadeInstance: especialidadeInstance])
                return
            }
        }

        especialidadeInstance.properties = params

        if (!especialidadeInstance.save(flush: true)) {
            render(view: "editar", model: [especialidadeInstance: especialidadeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), especialidadeInstance.id])
        redirect(action: "visualizar", id: especialidadeInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def especialidadeInstance = Especialidade.get(id)
        if (!especialidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), id])
            redirect(action: "listagem")
            return
        }

        try {
            especialidadeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'especialidade.label', default: 'Especialidade'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

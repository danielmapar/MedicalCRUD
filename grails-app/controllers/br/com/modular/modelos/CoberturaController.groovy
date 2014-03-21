package br.com.modular.modelos

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class CoberturaController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

    def index() {
        redirect(action: "listagem", params: params)
    }

    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [coberturaInstanceList: Cobertura.list(params), coberturaInstanceTotal: Cobertura.count()]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def cadastrar() {
        [coberturaInstance: new Cobertura(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
        def coberturaInstance = new Cobertura(params)
        if (!coberturaInstance.save(flush: true)) {
            render(view: "cadastrar", model: [coberturaInstance: coberturaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), coberturaInstance.nome])
        redirect(action: "visualizar", id: coberturaInstance.id)
    }

    def visualizar(Long id) {
        def coberturaInstance = Cobertura.get(id)
        if (!coberturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), id])
            redirect(action: "listagem")
            return
        }

        [coberturaInstance: coberturaInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
        def coberturaInstance = Cobertura.get(id)
        if (!coberturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), id])
            redirect(action: "listagem")
            return
        }

        [coberturaInstance: coberturaInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
        def coberturaInstance = Cobertura.get(id)
        if (!coberturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (coberturaInstance.version > version) {
                coberturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cobertura.label', default: 'Cobertura')] as Object[],
                          "Outro usuário esta atualizando essa Cobertura enquanto você edita")
                render(view: "editar", model: [coberturaInstance: coberturaInstance])
                return
            }
        }

        coberturaInstance.properties = params

        if (!coberturaInstance.save(flush: true)) {
            render(view: "editar", model: [coberturaInstance: coberturaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), coberturaInstance.nome])
        redirect(action: "visualizar", id: coberturaInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def coberturaInstance = Cobertura.get(id)
        if (!coberturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), id])
            redirect(action: "listagem")
            return
        }

        try {
            coberturaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cobertura.label', default: 'Cobertura'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

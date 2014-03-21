package br.com.modular.modelos

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class CarenciaController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

    def index() {
        redirect(action: "listagem", params: params)
    }

    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [carenciaInstanceList: Carencia.list(params), carenciaInstanceTotal: Carencia.count()]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def cadastrar() {
        [carenciaInstance: new Carencia(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
        def carenciaInstance = new Carencia(params)
        if (!carenciaInstance.save(flush: true)) {
            render(view: "cadastrar", model: [carenciaInstance: carenciaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'carencia.label', default: 'Carencia'), carenciaInstance.id])
        redirect(action: "visualizar", id: carenciaInstance.id)
    }

    def visualizar(Long id) {
        def carenciaInstance = Carencia.get(id)
        if (!carenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carencia.label', default: 'Carencia'), id])
            redirect(action: "listagem")
            return
        }

        [carenciaInstance: carenciaInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
        def carenciaInstance = Carencia.get(id)
        if (!carenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carencia.label', default: 'Carencia'), id])
            redirect(action: "listagem")
            return
        }

        [carenciaInstance: carenciaInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
        def carenciaInstance = Carencia.get(id)
        if (!carenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carencia.label', default: 'Carencia'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (carenciaInstance.version > version) {
                carenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'carencia.label', default: 'Carencia')] as Object[],
                          "Outro usuário esta atualizando essa Carencia enquanto você edita")
                render(view: "editar", model: [carenciaInstance: carenciaInstance])
                return
            }
        }

        carenciaInstance.properties = params

        if (!carenciaInstance.save(flush: true)) {
            render(view: "editar", model: [carenciaInstance: carenciaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'carencia.label', default: 'Carencia'), carenciaInstance.id])
        redirect(action: "visualizar", id: carenciaInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def carenciaInstance = Carencia.get(id)
        if (!carenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carencia.label', default: 'Carencia'), id])
            redirect(action: "listagem")
            return
        }

        try {
            carenciaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'carencia.label', default: 'Carencia'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'carencia.label', default: 'Carencia'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

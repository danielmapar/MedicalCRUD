package br.com.modular.instituicao

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ExameController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

    def index() {
        redirect(action: "listagem", params: params)
    }
	
    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [exameInstanceList: Exame.list(params), exameInstanceTotal: Exame.count()]
    }
	@Secured(['ROLE_ADMINISTRADOR'])
    def cadastrar() {
        [laboratorioInstanceId: params.laboratorio.id,
		 exameInstance: new Exame(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
		Laboratorio laboratorioInstance = Laboratorio.get(params.laboratorioInstanceId)
        Exame exameInstance = new Exame(params)
		laboratorioInstance.addToExames(exameInstance)
		
        if (!laboratorioInstance.save(flush: true)) {
            render(view: "cadastrar", model: [exameInstance: exameInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'exame.label', default: 'Exame'), exameInstance.id])
        redirect(action: "visualizar", id: exameInstance.id)
    }

    def visualizar(Long id) {
        def exameInstance = Exame.get(id)
        if (!exameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exame.label', default: 'Exame'), id])
            redirect(action: "listagem")
            return
        }

        [exameInstance: exameInstance]
    }
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
        def exameInstance = Exame.get(id)
        if (!exameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exame.label', default: 'Exame'), id])
            redirect(action: "listagem")
            return
        }

        [exameInstance: exameInstance]
    }
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
        def exameInstance = Exame.get(id)
        if (!exameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exame.label', default: 'Exame'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (exameInstance.version > version) {
                exameInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'exame.label', default: 'Exame')] as Object[],
                          "Outro usu�rio atualizou o Exame enquanto voc� edita")
                render(view: "editar", model: [exameInstance: exameInstance])
                return
            }
        }

        exameInstance.properties = params

        if (!exameInstance.save(flush: true)) {
            render(view: "editar", model: [exameInstance: exameInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'exame.label', default: 'Exame'), exameInstance.id])
        redirect(action: "visualizar", id: exameInstance.id)
    }
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def exameInstance = Exame.get(id)
        if (!exameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exame.label', default: 'Exame'), id])
            redirect(action: "listagem")
            return
        }

        try {
            exameInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'exame.label', default: 'Exame'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exame.label', default: 'Exame'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

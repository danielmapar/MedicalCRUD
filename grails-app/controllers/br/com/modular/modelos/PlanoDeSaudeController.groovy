package br.com.modular.modelos

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class PlanoDeSaudeController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]

    def index() {
        redirect(action: "listagem", params: params)
    }

    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [planoDeSaudeInstanceList: PlanoDeSaude.list(params), planoDeSaudeInstanceTotal: PlanoDeSaude.count()]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])	
    def cadastrar() {
        [planoDeSaudeInstance: new PlanoDeSaude(params)]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def salvar() {
        def planoDeSaudeInstance = new PlanoDeSaude(params)
        if (!planoDeSaudeInstance.save(flush: true)) {
            render(view: "cadastrar", model: [planoDeSaudeInstance: planoDeSaudeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'planoDeSaude.label', default: 'Plano de Saude'), planoDeSaudeInstance.nome])
        redirect(action: "visualizar", id: planoDeSaudeInstance.id)
    }
	
    def visualizar(Long id) {
        def planoDeSaudeInstance = PlanoDeSaude.get(id)
        if (!planoDeSaudeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planoDeSaude.label', default: 'PlanoDeSaude'), id])
            redirect(action: "listagem")
            return
        }

        [planoDeSaudeInstance: planoDeSaudeInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def editar(Long id) {
        def planoDeSaudeInstance = PlanoDeSaude.get(id)
        if (!planoDeSaudeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planoDeSaude.label', default: 'PlanoDeSaude'), id])
            redirect(action: "listagem")
            return
        }

        [planoDeSaudeInstance: planoDeSaudeInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def atualizar(Long id, Long version) {
        def planoDeSaudeInstance = PlanoDeSaude.get(id)
        if (!planoDeSaudeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planoDeSaude.label', default: 'PlanoDeSaude'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (planoDeSaudeInstance.version > version) {
                planoDeSaudeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'planoDeSaude.label', default: 'PlanoDeSaude')] as Object[],
                          "Outro usuário esta atualizando esse Plano de Saúde enquanto você edita")
                render(view: "editar", model: [planoDeSaudeInstance: planoDeSaudeInstance])
                return
            }
        }

        planoDeSaudeInstance.properties = params

        if (!planoDeSaudeInstance.save(flush: true)) {
            render(view: "editar", model: [planoDeSaudeInstance: planoDeSaudeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'planoDeSaude.label', default: 'Plano de Saude'), planoDeSaudeInstance.nome])
        redirect(action: "visualizar", id: planoDeSaudeInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def deletar(Long id) {
        def planoDeSaudeInstance = PlanoDeSaude.get(id)
        if (!planoDeSaudeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planoDeSaude.label', default: 'PlanoDeSaude'), id])
            redirect(action: "listagem")
            return
        }

        try {
            planoDeSaudeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'planoDeSaude.label', default: 'Plano de Saude'), planoDeSaudeInstance.nome])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'planoDeSaude.label', default: 'PlanoDeSaude'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

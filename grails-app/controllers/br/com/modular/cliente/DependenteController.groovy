package br.com.modular.cliente

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class DependenteController {

    static allowedMethods = [salvar: "POST", atualizar: "POST", deletar: "POST"]
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def index() {
        redirect(action: "listagem", params: params)
    }
	
	@Secured(['ROLE_ADMINISTRADOR'])
    def listagem(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dependenteInstanceList: Dependente.list(params), dependenteInstanceTotal: Dependente.count()]
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def cadastrar() {
        [dependenteInstance: new Dependente(params),
		 planoDeSaudeContratadoId: params.planoDeSaudeContratado.id]
    }
	
	@Secured(['ROLE_CLIENTE'])
    def salvar() {
		
		PlanoDeSaudeContratado planoDeSaudeContratado = PlanoDeSaudeContratado.get(params.planoDeSaudeContratadoId)
        def dependenteInstance = new Dependente(params)
		
		if(planoDeSaudeContratado){
			planoDeSaudeContratado.addToDependentes(dependenteInstance)
		}
		
		
        if (!planoDeSaudeContratado.save(flush: true)) {
            render(view: "cadastrar", model: [dependenteInstance: dependenteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dependente.label', default: 'Dependente'), dependenteInstance.id])
        redirect(action: "visualizar", id: dependenteInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def visualizar(Long id) {
        def dependenteInstance = Dependente.get(id)
        if (!dependenteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependente.label', default: 'Dependente'), id])
            redirect(action: "listagem")
            return
        }

        [dependenteInstance: dependenteInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def editar(Long id) {
        def dependenteInstance = Dependente.get(id)
        if (!dependenteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependente.label', default: 'Dependente'), id])
            redirect(action: "listagem")
            return
        }

        [dependenteInstance: dependenteInstance]
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def atualizar(Long id, Long version) {
        def dependenteInstance = Dependente.get(id)
        if (!dependenteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependente.label', default: 'Dependente'), id])
            redirect(action: "listagem")
            return
        }

        if (version != null) {
            if (dependenteInstance.version > version) {
                dependenteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dependente.label', default: 'Dependente')] as Object[],
                          "Outro usu‡rio atualizou esse Dependente enquanto voc edita")
                render(view: "editar", model: [dependenteInstance: dependenteInstance])
                return
            }
        }

        dependenteInstance.properties = params

        if (!dependenteInstance.save(flush: true)) {
            render(view: "editar", model: [dependenteInstance: dependenteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dependente.label', default: 'Dependente'), dependenteInstance.id])
        redirect(action: "visualizar", id: dependenteInstance.id)
    }
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def deletar(Long id) {
        def dependenteInstance = Dependente.get(id)
        if (!dependenteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependente.label', default: 'Dependente'), id])
            redirect(action: "listagem")
            return
        }

        try {
            dependenteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dependente.label', default: 'Dependente'), id])
            redirect(action: "listagem")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dependente.label', default: 'Dependente'), id])
            redirect(action: "visualizar", id: id)
        }
    }
}

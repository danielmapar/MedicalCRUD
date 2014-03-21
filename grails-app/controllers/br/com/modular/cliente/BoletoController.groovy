package br.com.modular.cliente

import br.com.modular.seguranca.Usuario;
import grails.plugins.springsecurity.Secured

class BoletoController {
	
	def springSecurityService
	
	@Secured(['ROLE_ADMINISTRADOR','ROLE_CLIENTE'])
    def index() { 
		boolean boletoNaoExiste = false
		
		def detalhesUsuario = springSecurityService.principal
		Usuario usuarioInstance = Usuario.get(detalhesUsuario.id)
		
		Cliente clienteInstance = usuarioInstance.cliente
		def planoDeSaudeContratadoInstance
		if(clienteInstance.planosDeSaudeContratados){
			planoDeSaudeContratadoInstance = clienteInstance.planosDeSaudeContratados
		}else{
			boletoNaoExiste = true
		}
		
		[usuarioInstance: usuarioInstance,
		 clienteInstance: clienteInstance,
		 planoDeSaudeContratadoInstance: planoDeSaudeContratadoInstance,
		 boletoNaoExiste: boletoNaoExiste]
	}
}

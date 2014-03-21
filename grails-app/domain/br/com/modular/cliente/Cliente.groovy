package br.com.modular.cliente

import br.com.modular.formatacao.DomainService.SexoType;
import br.com.modular.seguranca.Usuario;
import br.com.modular.usuario.Endereco;

class Cliente {

	String 		 				   nome
	String 		 				   sobrenome
	int          				   idade
	SexoType     				   sexo
	Endereco     				   endereco
	PlanoDeSaudeContratado         planosDeSaudeContratados
	
	static belongsTo = [usuario: Usuario]
	
	static hasMany = [planosDeSaudeContratados: PlanoDeSaudeContratado]
		
	static constraints = {
		nome(blank: false, nullable: false,  size: 2..20)
		sobrenome (blank: false, nullable: false, size: 2..20)
		idade(blank: false, nullable: false, size: 1..3)
		sexo(blank: false, nullable: false, inList:SexoType.list(), minSize:1, maxSize:1)
		planosDeSaudeContratados (blank:true, nullable: true)
	}

	static mapping = {
		
		table 'cliente'
		nome       column: 'Nome'
		sobrenome  column: 'Sobrenome'
		idade      column: 'Idade'
		sexo       column: 'Sexo'
		endereco   column: 'Endereco'
	}

}

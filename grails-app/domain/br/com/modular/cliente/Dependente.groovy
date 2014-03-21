package br.com.modular.cliente

class Dependente {

	String  nome
	String  sobrenome
	int     idade
	
	static belongsTo = [planoDeSaudeContratado: PlanoDeSaudeContratado]
	
	static constraints = {
		nome(blank: false, nullable: false)
		sobrenome(blank: false, nullable: false)
		idade(blank: false, nullable: false)
	}
	
	static mapping = {
		table 'dependente'
		nome column: 'Nome'
		sobrenome column: 'Sobrenome'
		idade column: 'Idade'
	}
	
}

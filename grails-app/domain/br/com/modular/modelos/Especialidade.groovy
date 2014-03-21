package br.com.modular.modelos

class Especialidade {
	
	static searchable = true
	
	String    nome
	String    detalhamento
		
	static constraints = {
		nome(blank: false, nullable: false)
		detalhamento(blank: false, nullable: false)
	}

	static mapping = {
		table 'especialidade'
		nome  column: 'Nome'
		detalhamento column: 'Detalhamento'
	}
}

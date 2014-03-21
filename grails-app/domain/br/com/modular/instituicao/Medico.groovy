package br.com.modular.instituicao

import br.com.modular.modelos.Especialidade;

class Medico {
	
	String        nome
	Especialidade especialidade
	
	static belongsTo = [hospital: Hospital, clinica: Clinica]
		
	static constraints = {
		nome(blank: false, nullable: false)
		especialidade(blank: false, nullable: false)
		hospital(nullable: true)
		clinica(nullable: true)
	}

	static mapping = {
		table 'medico'
		nome  column: 'Nome'
		especialidade column: 'Especialidade'
	}
}

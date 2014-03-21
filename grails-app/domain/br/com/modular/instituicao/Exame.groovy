package br.com.modular.instituicao

import java.util.List;

class Exame {
	
	String   nome
	int      duracaoMinutos     
	
	static belongsTo = [laboratorio: Laboratorio]
	
	static constraints = {
		nome(blank: false, nullable: false,  size: 2..20)
		duracaoMinutos (blank: false, nullable: false)	
	}

	static mapping = {
		table 'exame'
		nome  column: 'Nome'
		duracaoMinutos column: 'Duracao_Minutos'
	}
}

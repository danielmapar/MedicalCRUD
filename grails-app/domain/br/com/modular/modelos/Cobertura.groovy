package br.com.modular.modelos

class Cobertura {

	String nome
	
	static belongsTo = [planoDeSaude: PlanoDeSaude]
	
    static constraints = {		
		nome(blank: false, nullable: false)
    }
	
	static mapping = {
		table 'cobertura'
		nome column: 'Nome'
	}
}

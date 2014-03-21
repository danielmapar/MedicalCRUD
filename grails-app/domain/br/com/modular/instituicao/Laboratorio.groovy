package br.com.modular.instituicao

import java.util.List;


class Laboratorio {
	
	
	int      		limiteExames
	List<Exame>     exames     
	
	static belongsTo = [instituicaoMedicaLaboratorio: InstituicaoMedica]
	
	static hasMany = [exames: Exame]
	
	static constraints = {
		limiteExames(blank:false, nullable: false)	
		exames(blank:true, nullable: true)	
		instituicaoMedicaLaboratorio(blank: true, nullable: true)
	}

	static mapping = {
		table 'laboratorio'
		limiteExames column: 'Limite_Exames'
	}
}

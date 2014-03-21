package br.com.modular.modelos

import java.util.List;

class Carencia {
	
	String    nome
	int       tempoDeEsperaHoras
	
	static belongsTo = [planoDeSaude: PlanoDeSaude]
	
    static constraints = {		
		nome(blank: false, nullable: false)
		tempoDeEsperaHoras(blank: false, nullable: false)
    }
	
	static mapping = {
		table 'carencia'
		nome column: 'Nome'
		tempoDeEsperaHoras column: 'Tempo_De_Espera_Horas'
	}
}

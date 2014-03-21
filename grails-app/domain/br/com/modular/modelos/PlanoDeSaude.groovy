package br.com.modular.modelos

import br.com.modular.cliente.Cliente;

class PlanoDeSaude {
	
	String             nome
	List<Cobertura>    cobertura
	List<Carencia>     carencia
	Double             valorMensalidade
	
	static hasMany = [carencia: Carencia, cobertura: Cobertura]
	
    static constraints = {		
		nome(blank: false, nullable: false)
		cobertura(blank: true, nullable: true)
		carencia(blank: true, nullable: true)
		valorMensalidade(blank: false, nullable: false)
    }
	
	static mapping = {		
		table 'plano_de_saude'
		nome column: 'Plano_De_Saude'
		cobertura column: 'Cobertura'
		carencia column: 'Carencia'
		valorMensalidade column: 'Valor_Mensalidade'
	}
	
}

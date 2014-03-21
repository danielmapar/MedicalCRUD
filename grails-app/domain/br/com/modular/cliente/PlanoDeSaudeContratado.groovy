package br.com.modular.cliente

import java.util.List;

import br.com.modular.modelos.Cobertura;
import br.com.modular.modelos.PlanoDeSaude;
import br.com.modular.seguranca.Usuario;

class PlanoDeSaudeContratado {
	
	PlanoDeSaude     planoDeSaude
	Date     	     dataVencimentoBoleto
	List<Dependente> dependetes
	
	static belongsTo = Cliente
	
	static hasMany = [dependentes: Dependente]
	
    static constraints = {		
		planoDeSaude(blank: false, nullable: false)
		dataVencimentoBoleto(blank: false, nullable: false)
    }
	
	static mapping = {		
		table 'plano_de_saude_contratado'
		planoDeSaude column: 'Plano_De_Saude'
		dataVencimentoBoleto column: 'Data_Vencimento_Boleto'
	}
}

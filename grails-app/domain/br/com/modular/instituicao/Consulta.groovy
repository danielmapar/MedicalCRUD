package br.com.modular.instituicao

import java.util.List;

import br.com.modular.cliente.Cliente;
import br.com.modular.modelos.Especialidade;

class Consulta {
	
	Cliente       cliente
	Medico        medico
	Exame         exame
	int      	  duracaoMinutos
	
	static belongsTo = [instituicao: InstituicaoMedica]
	
	static constraints = {
		cliente(blank: false, nullable: false)
		medico(blank: false, nullable: false)
		duracaoMinutos(blank: false, nullable: false)
		exame(blank: true, nullable: true)
	}

	static mapping = {
		table 'consulta'
		duracaoMinutos column: 'Duracao_Minutos'
	}
}

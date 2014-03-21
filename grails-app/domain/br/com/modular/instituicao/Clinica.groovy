package br.com.modular.instituicao

import java.util.List;
import br.com.modular.modelos.Especialidade;

class Clinica {
	
	int     		 		limiteConsultas
	List<Medico>     		medicos_clinica
	List<Especialidade>     especialidades_clinica
	
	static belongsTo = [instituicaoMedicaClinica: InstituicaoMedica]
	
	static hasMany = [medicos_clinica: Medico, especialidades_clinica: Especialidade]
	
	static constraints = {
		limiteConsultas(blank: false, nullable: false)
		medicos_clinica (blank: true, nullable: true)
		especialidades_clinica(blank:true, nullable: true)
		instituicaoMedicaClinica(blank:true, nullable: true)
	}

	static mapping = {		
		table 'clinica'
		limiteConsultas column: 'Limite_Consultas'
	}
}

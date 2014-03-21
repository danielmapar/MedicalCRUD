package br.com.modular.instituicao

import java.util.List;

import br.com.modular.modelos.Especialidade;


class Hospital {
	
	int                  limiteConsultas
	List<Medico>         medicos_hospital     
	List<Especialidade>  especialidades_hospital
	
	static belongsTo = [instituicaoMedicaHospital: InstituicaoMedica]
	
	static hasMany = [medicos_hospital: Medico, especialidades_hospital: Especialidade]
	
	static constraints = {
		limiteConsultas(blank: false, nullable: false)
		medicos_hospital (blank: true, nullable: true)	
		especialidades_hospital(blank:true, nullable: true)
		instituicaoMedicaHospital(blank:true, nullable: true)
	}

	static mapping = {
		table 'hospital'
		limiteConsultas column: 'Limite_Consultas'
	}
}

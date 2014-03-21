package br.com.modular.instituicao

import java.util.List;

import br.com.modular.formatacao.DomainService.InstituicaoType;
import br.com.modular.modelos.PlanoDeSaude;
import br.com.modular.usuario.Endereco;

class InstituicaoMedica implements Serializable{
	
	
	String 		 		nome
	Endereco     		endereco
	List<PlanoDeSaude>  planosDeSaude
	List<Consulta>      consultas
	InstituicaoType     tipoInstituicao
	Clinica      		clinica
	Hospital     		hospital
	Laboratorio  		laboratorio
		
	static hasMany = [planosDeSaude: PlanoDeSaude, consultas: Consulta]
	
	static constraints = {
		nome(blank: false, nullable: false,  size: 2..20)
		planosDeSaude (blank:false, nullable: false)
		consultas (blank:true, nullable: true)
		tipoInstituicao(blank: false, nullable: false)
		clinica(blank: true, nullable: true)
		hospital(blank: true, nullable: true)
		laboratorio(blank: true, nullable: true)
		endereco(blank: true, nullable: true)
	}

	static mapping = {
		table 'instituicao_medica'
		nome       column: 'Nome'
		endereco   column: 'Endereco'
	}
}

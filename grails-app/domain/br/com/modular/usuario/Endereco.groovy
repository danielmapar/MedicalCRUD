package br.com.modular.usuario

import br.com.modular.cliente.Cliente;
import br.com.modular.instituicao.InstituicaoMedica;

class Endereco {
	
	static searchable = true
	
	String     cep
	String     logradouro
	String     complemento
	String     bairro
	String     cidade
	String     estado
	
	static belongsTo = [InstituicaoMedica,Cliente]
	
	static constraints = {
		cep(blank: false, nullable: false, minSize: 9, maxSize: 9)
		logradouro(blank: false, nullable: false, size: 3..100)
		complemento(blank: false, nullable: false, size: 3..50)
		bairro(blank: false, nullable: false, size: 3..30)
		cidade(blank: false, nullable: false, maxSize: 50)
		estado(blank: false, nullable: false, maxSize: 50)
	}
	
	static mapping = {
		table 'endereco'
		cep column: 'Cep'
		estado column: 'Estado'
		cidade column: 'Cidade'
		bairro column: 'Bairro'
		logradouro column: 'Logradouro'
		complemento column: 'Complemento'
	}
	
}

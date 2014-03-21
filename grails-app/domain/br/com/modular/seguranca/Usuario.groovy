package br.com.modular.seguranca

import java.util.List;

import br.com.modular.formatacao.DomainService.UsuarioType;
import br.com.modular.cliente.Cliente;

class Usuario {
		
	transient springSecurityService

	Date 	     dataCriacao = new Date()
	UsuarioType  tipoUsuario
	Cliente      cliente
	String 		 email
	String 		 senha
	boolean 	 enabled
	boolean 	 accountExpired
	boolean 	 accountLocked
	boolean 	 passwordExpired
	
	static constraints = {
		dataCriacao()
		tipoUsuario(blank: false, nullable: false, inList:UsuarioType.list(), minSize:1, maxSize:1)
		cliente(blank: true, nullable: true)
		email (email: true, blank: false, unique: true, size: 7..128)
		senha (blank: false, nullable: false)	
	}

	static mapping = {
		dataCriacao     column: 'Data_Criacao'
		tipoUsuario     column: 'Tipo_Usuario'
		cliente         column: 'Id_Cliente'
		email           column: 'Email'
		senha           column: 'Senha'
		//password column: '`password`'
		
		cliente (lazy:true)
	}


	Set<Regra> getAuthorities() {
		UsuarioRegra.findAllByUsuario(this).collect { it.regra } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('senha')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		senha = springSecurityService.encodePassword(senha)
	}
	
}

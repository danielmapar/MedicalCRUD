package br.com.modular.seguranca

import org.apache.commons.lang.builder.HashCodeBuilder

class UsuarioRegra implements Serializable {

	Usuario usuario
	Regra regra

	boolean equals(other) {
		if (!(other instanceof UsuarioRegra)) {
			return false
		}

		other.usuario?.id == usuario?.id &&
			other.regra?.id == regra?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (usuario) builder.append(usuario.id)
		if (regra) builder.append(regra.id)
		builder.toHashCode()
	}

	static UsuarioRegra get(long usuarioId, long regraId) {
		find 'from UsuarioRegra where usuario.id=:usuarioId and regra.id=:regraId',
			[usuarioId: usuarioId, regraId: regraId]
	}

	static UsuarioRegra create(Usuario usuario, Regra regra, boolean flush = false) {
		new UsuarioRegra(usuario: usuario, regra: regra).save(flush: flush, insert: true)
	}

	static boolean remove(Usuario usuario, Regra regra, boolean flush = false) {
		UsuarioRegra instance = UsuarioRegra.findByUsuarioAndRegra(usuario, regra)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Usuario usuario) {
		executeUpdate 'DELETE FROM UsuarioRegra WHERE usuario=:usuario', [usuario: usuario]
	}

	static void removeAll(Regra regra) {
		executeUpdate 'DELETE FROM UsuarioRegra WHERE regra=:regra', [regra: regra]
	}

	static mapping = {
		id composite: ['regra', 'usuario']
		version false
	}
}

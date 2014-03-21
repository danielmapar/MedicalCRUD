import br.com.modular.seguranca.Regra;

class BootStrap {

	def init = { servletContext ->
		Regra.findByAuthority("ROLE_CLIENTE") ?: new Regra(authority: "ROLE_CLIENTE").save()
		Regra.findByAuthority("ROLE_ADMINISTRADOR") ?: new Regra(authority: "ROLE_ADMINISTRADOR").save()
	}
	def destroy = {
	}
}

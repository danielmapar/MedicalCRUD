package br.com.udoctor.redireciona

class RedirecionaTagLib {

		def redirecionaPaginaPrincipal = {
		  response.sendRedirect("${request.contextPath}/homePage")
		}
	
}

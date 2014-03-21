<%@ page import="br.com.modular.formatacao.DomainService.UsuarioType"%>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<div style="float: left; margin: 0.7em;">
		<a href="${createLink(uri: '/')}"><img
			src="${resource(dir: 'images', file: 'modular_logo.png')}"
			alt="Grails" /></a>
	</div>
	<sec:ifNotLoggedIn>
		<g:if test='${!flash.message}'>
		<div style="float: right; margin: 1em;">
			<form action='/modular/j_spring_security_check' method='POST'
				autocomplete='off'>
				<g:hiddenField name='spring-security-redirect'
					value="${request.forwardURI.substring(8)}" />
				<g:textField name='j_username' placeholder="E-mail" />
				<g:passwordField name='j_password' placeholder="Senha" />
				<br /> <label> <g:checkBox
						name='_spring_security_remember_me' /> Mantenha-me conectado
				</label>
				<button type="submit" name="Login">Entrar</button>
			</form>
		</div>
		</g:if>
	</sec:ifNotLoggedIn>
	<div style="float: right; margin: 1.8em;">
		<sec:ifLoggedIn>

			<sec:access expression="hasRole('ROLE_CLIENTE')">
				<g:set var="tipoUsuario" value="${UsuarioType.C}" />
			</sec:access>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<g:set var="tipoUsuario" value="${UsuarioType.A}" />
			</sec:access>
			
			<g:if test="${tipoUsuario == UsuarioType.C}">
		Bem vindo cliente: <b> <sec:username />	</b>
			</g:if>
			<g:if test="${tipoUsuario == UsuarioType.A}">
		Bem vindo administrador: <b> <sec:username />
				</b>
			</g:if>
			<br/>
			<g:link controller='logout'>Logout</g:link>
		</sec:ifLoggedIn>
	</div>
	<br />	<br />	<br />	<br />	<br />
	<g:layoutBody />
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<g:javascript library="application" />
	<r:layoutResources />
</body>
</html>

<%@ page import="br.com.modular.seguranca.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Editar Cliente</title>
	</head>
	<body>
		<a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="list" action="listagem">Lista de Clientes</g:link></li>
				<li><g:link class="create" action="cadastrar">Cadastrar Cliente</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="edit-usuario" class="content scaffold-edit" role="main">
			<h1>Editar Cliente</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${usuarioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${usuarioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${usuarioInstance?.id}" />
				<g:hiddenField name="version" value="${usuarioInstance?.version}" />
				<fieldset class="form">
					<g:render template="formulario" model="['cadastro': false]"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="atualizar" value="Atualizar" />
					<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
					<g:actionSubmit class="delete" action="deletar" value="Deletar" formnovalidate="" onclick="return confirm('Você tem certeza?');" />
					</sec:access>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

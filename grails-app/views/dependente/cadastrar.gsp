<%@ page import="br.com.modular.cliente.Dependente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Cadastrar Dependente</title>
	</head>
	<body>
		<a href="#create-dependente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Cadastrar Dependente</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="list" action="listagem">Lista de Dependentes</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="create-dependente" class="content scaffold-create" role="main">
			<h1>Cadastrar Dependente</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${dependenteInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${dependenteInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="salvar" >
				<fieldset class="form">
					<g:hiddenField name="planoDeSaudeContratadoId" value="${planoDeSaudeContratadoId}" />
					<g:render template="formulario"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Cadastrar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

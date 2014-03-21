<%@ page import="br.com.modular.instituicao.Consulta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Agendar Consulta</title>
	</head>
	<body>
		<a href="#create-consulta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Consultas</g:link></li>
			</ul>
		</div>
		<div id="create-consulta" class="content scaffold-create" role="main">
			<h1>Agendar Consulta</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${consultaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${consultaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="salvar" >
				<fieldset class="form">
					<g:hiddenField name="instituicaoMedicaId" value="${instituicaoMedicaId}" />
					<g:render template="formulario"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Agendar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

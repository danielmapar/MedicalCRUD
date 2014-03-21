<%@ page import="br.com.modular.modelos.Carencia" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Editar Carência</title>
	</head>
	<body>
		<a href="#edit-carencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Carências</g:link></li>
				<li><g:link class="create" action="cadastrar">Cadastrar Carência</g:link></li>
			</ul>
		</div>
		<div id="edit-carencia" class="content scaffold-edit" role="main">
			<h1>Editar Carência</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${carenciaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${carenciaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${carenciaInstance?.id}" />
				<g:hiddenField name="version" value="${carenciaInstance?.version}" />
				<fieldset class="form">
					<g:render template="formulario"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="atualizar" value="Atualizar" />
					<g:actionSubmit class="delete" action="deletar" value="Deletar" formnovalidate="" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="br.com.modular.modelos.PlanoDeSaude" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Editar Plano de Saúde</title>
	</head>
	<body>
		<a href="#edit-planoDeSaude" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Planos de Saúde</g:link></li>
				<li><g:link class="create" action="cadastrar">Cadastrar Plano de Saúde</g:link></li>
			</ul>
		</div>
		<div id="edit-planoDeSaude" class="content scaffold-edit" role="main">
			<h1>Editar Plano de Saúde</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${planoDeSaudeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${planoDeSaudeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${planoDeSaudeInstance?.id}" />
				<g:hiddenField name="version" value="${planoDeSaudeInstance?.version}" />
				<fieldset class="form">
					<g:render template="formulario" model="['cadastro':false]"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="atualizar" value="Atualizar" />
					<g:actionSubmit class="delete" action="deletar" value="Deletar" formnovalidate="" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

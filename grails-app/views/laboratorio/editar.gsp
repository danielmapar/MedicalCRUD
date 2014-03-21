<%@ page import="br.com.modular.instituicao.Laboratorio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Editar Laboratório</title>
	</head>
	<body>
		<a href="#edit-laboratorio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Laboratórios</g:link></li>
				<li><g:link class="create" action="cadastrar">Cadastrar Laboratório</g:link></li>
			</ul>
		</div>
		<div id="edit-laboratorio" class="content scaffold-edit" role="main">
			<h1>Editar Laboratório</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${laboratorioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${laboratorioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${instituicaoMedicaInstance?.id}" />
				<g:hiddenField name="version" value="${instituicaoMedicaInstance?.version}" />
				<fieldset class="form">
					<g:render template="formulario" model="['cadastro': false]"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="atualizar" value="Atualizar" />
					<g:actionSubmit class="delete" action="deletar" value="Deletar" formnovalidate="" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

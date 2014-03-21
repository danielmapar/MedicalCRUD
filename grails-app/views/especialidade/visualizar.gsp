
<%@ page import="br.com.modular.modelos.Especialidade" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Especialidade</title>
	</head>
	<body>
		<a href="#show-especialidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Especialidades</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Especialidade</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-especialidade" class="content scaffold-show" role="main">
			<h1>Visualizar Especialidade</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list especialidade">
			
				<g:if test="${especialidadeInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="especialidade.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${especialidadeInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${especialidadeInstance?.detalhamento}">
				<li class="fieldcontain">
					<span id="detalhamento-label" class="property-label"><g:message code="especialidade.detalhamento.label" default="Detalhamento" /></span>
					
						<span class="property-value" aria-labelledby="detalhamento-label"><g:fieldValue bean="${especialidadeInstance}" field="detalhamento"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${especialidadeInstance?.id}" />
					<g:link class="edit" action="editar" id="${especialidadeInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
			</sec:access>
		</div>
	</body>
</html>

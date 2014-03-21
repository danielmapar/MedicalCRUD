
<%@ page import="br.com.modular.modelos.Cobertura" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Cobertura</title>
	</head>
	<body>
		<a href="#show-cobertura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Coberturas</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Cobertura</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-cobertura" class="content scaffold-show" role="main">
			<h1>Visualizar Cobertura</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cobertura">
			
				<g:if test="${coberturaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="cobertura.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${coberturaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coberturaInstance?.planoDeSaude}">
				<li class="fieldcontain">
					<span id="planoDeSaude-label" class="property-label"><g:message code="cobertura.planoDeSaude.label" default="Plano de Saúde" /></span>
					
						<span class="property-value" aria-labelledby="planoDeSaude-label"><g:link controller="planoDeSaude" action="visualizar" id="${coberturaInstance?.planoDeSaude?.id}">${coberturaInstance?.planoDeSaude?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${coberturaInstance?.id}" />
					<g:link class="edit" action="editar" id="${coberturaInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
			</sec:access>
		</div>
	</body>
</html>

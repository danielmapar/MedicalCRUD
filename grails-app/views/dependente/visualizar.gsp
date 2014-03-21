
<%@ page import="br.com.modular.cliente.Dependente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Dependente</title>
	</head>
	<body>
		<a href="#show-dependente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="list" action="listagem">Lista de Dependentes</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-dependente" class="content scaffold-show" role="main">
			<h1>Visualizar Dependente</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dependente">
			
				<g:if test="${dependenteInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="dependente.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${dependenteInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenteInstance?.sobrenome}">
				<li class="fieldcontain">
					<span id="sobrenome-label" class="property-label"><g:message code="dependente.sobrenome.label" default="Sobrenome" /></span>
					
						<span class="property-value" aria-labelledby="sobrenome-label"><g:fieldValue bean="${dependenteInstance}" field="sobrenome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenteInstance?.idade}">
				<li class="fieldcontain">
					<span id="idade-label" class="property-label"><g:message code="dependente.idade.label" default="Idade" /></span>
					
						<span class="property-value" aria-labelledby="idade-label"><g:fieldValue bean="${dependenteInstance}" field="idade"/></span>
					
				</li>
				</g:if>
			
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dependenteInstance?.id}" />
					<g:link class="edit" action="editar" id="${dependenteInstance?.id}">Atualizar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

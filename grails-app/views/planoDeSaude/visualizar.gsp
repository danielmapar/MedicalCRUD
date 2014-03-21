
<%@ page import="br.com.modular.modelos.PlanoDeSaude" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Plano de Saúde</title>
	</head>
	<body>
		<a href="#show-planoDeSaude" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Planos de Saúde</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Plano de Saúde</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-planoDeSaude" class="content scaffold-show" role="main">
			<h1>Visualizar Plano de Saúde</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list planoDeSaude">
			
				<g:if test="${planoDeSaudeInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="planoDeSaude.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${planoDeSaudeInstance}" field="nome"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${planoDeSaudeInstance?.valorMensalidade}">
				<li class="fieldcontain">
					<span id="valorMensalidade-label" class="property-label"><g:message code="planoDeSaude.valorMensalidade.label" default="Valor Mensalidade" /></span>
					
						<span class="property-value" aria-labelledby="valorMensalidade-label"><g:fieldValue bean="${planoDeSaudeInstance}" field="valorMensalidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planoDeSaudeInstance?.cobertura}">
				<li class="fieldcontain">
					<span id="cobertura-label" class="property-label"><g:message code="planoDeSaude.cobertura.label" default="Cobertura" /></span>
					
						<g:each in="${planoDeSaudeInstance.cobertura}" var="c">
						<span class="property-value" aria-labelledby="cobertura-label"><g:link controller="cobertura" action="visualizar" id="${c.id}">${c?.nome?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${planoDeSaudeInstance?.carencia}">
				<li class="fieldcontain">
					<span id="carencia-label" class="property-label"><g:message code="planoDeSaude.carencia.label" default="Carência" /></span>
					
						<g:each in="${planoDeSaudeInstance.carencia}" var="c">
						<span class="property-value" aria-labelledby="carencia-label"><g:link controller="carencia" action="visualizar" id="${c.id}">${c?.nome?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${planoDeSaudeInstance?.id}" />
					<g:link class="edit" action="editar" id="${planoDeSaudeInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
			</sec:access>
		</div>
	</body>
</html>

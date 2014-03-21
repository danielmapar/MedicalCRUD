
<%@ page import="br.com.modular.modelos.Carencia" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Carência</title>
	</head>
	<body>
		<a href="#show-carencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Carências</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Carência</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-carencia" class="content scaffold-show" role="main">
			<h1>Visualizar Carência</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carencia">
			
				<g:if test="${carenciaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="carencia.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${carenciaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carenciaInstance?.tempoDeEsperaHoras}">
				<li class="fieldcontain">
					<span id="tempoDeEsperaHoras-label" class="property-label"><g:message code="carencia.tempoDeEsperaHoras.label" default="Tempo de Espera em Horas" /></span>
					
						<span class="property-value" aria-labelledby="tempoDeEsperaHoras-label"><g:fieldValue bean="${carenciaInstance}" field="tempoDeEsperaHoras"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carenciaInstance?.planoDeSaude}">
				<li class="fieldcontain">
					<span id="planoDeSaude-label" class="property-label"><g:message code="carencia.planoDeSaude.label" default="Plano de Saúde" /></span>
					
						<span class="property-value" aria-labelledby="planoDeSaude-label"><g:link controller="planoDeSaude" action="visualizar" id="${carenciaInstance?.planoDeSaude?.id}">${carenciaInstance?.planoDeSaude?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${carenciaInstance?.id}" />
					<g:link class="edit" action="editar" id="${carenciaInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
			</sec:access>
		</div>
	</body>
</html>

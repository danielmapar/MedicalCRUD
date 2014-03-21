
<%@ page import="br.com.modular.instituicao.Consulta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Consulta</title>
	</head>
	<body>
		<a href="#show-consulta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="list" action="listagem">Lista de Consultas</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-consulta" class="content scaffold-show" role="main">
			<h1>Visualizar Consulta</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list consulta">
			
				<g:if test="${consultaInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="consulta.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="usuario" action="visualizar" id="${consultaInstance?.cliente?.usuario?.id}">${consultaInstance?.cliente?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${consultaInstance?.medico}">
				<li class="fieldcontain">
					<span id="medico-label" class="property-label"><g:message code="consulta.medico.label" default="Médico" /></span>
					
						<span class="property-value" aria-labelledby="medico-label"><g:link controller="medico" action="visualizar" id="${consultaInstance?.medico?.id}">${consultaInstance?.medico?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${consultaInstance?.duracaoMinutos}">
				<li class="fieldcontain">
					<span id="duracaoMinutos-label" class="property-label"><g:message code="consulta.duracaoMinutos.label" default="Duração em Minutos" /></span>
					
						<span class="property-value" aria-labelledby="duracaoMinutos-label"><g:fieldValue bean="${consultaInstance}" field="duracaoMinutos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${consultaInstance?.exame}">
				<li class="fieldcontain">
					<span id="exame-label" class="property-label"><g:message code="consulta.exame.label" default="Exame" /></span>
					
						<span class="property-value" aria-labelledby="exame-label"><g:link controller="exame" action="visualizar" id="${consultaInstance?.exame?.id}">${consultaInstance?.exame?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${consultaInstance?.instituicao}">
				<li class="fieldcontain">
					<span id="instituicao-label" class="property-label"><g:message code="consulta.instituicao.label" default="Instituição" /></span>
					
						<span class="property-value" aria-labelledby="instituicao-label">${consultaInstance?.instituicao?.nome?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${consultaInstance?.id}" />
					<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
					<g:link class="edit" action="editar" id="${consultaInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
					</sec:access>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

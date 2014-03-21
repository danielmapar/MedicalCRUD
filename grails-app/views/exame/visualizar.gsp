
<%@ page import="br.com.modular.instituicao.Exame" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Exame</title>
	</head>
	<body>
		<a href="#show-exame" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Exames</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Exame</g:link></li>
				</sec:access>
				
			</ul>
		</div>
		<div id="show-exame" class="content scaffold-show" role="main">
			<h1>Visualizar Exame</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list exame">
			
				<g:if test="${exameInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="exame.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${exameInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exameInstance?.duracaoMinutos}">
				<li class="fieldcontain">
					<span id="duracaoMinutos-label" class="property-label"><g:message code="exame.duracaoMinutos.label" default="Duração em Minutos" /></span>
					
						<span class="property-value" aria-labelledby="duracaoMinutos-label"><g:fieldValue bean="${exameInstance}" field="duracaoMinutos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exameInstance?.laboratorio}">
				<li class="fieldcontain">
					<span id="laboratorio-label" class="property-label"><g:message code="exame.laboratorio.label" default="Laboratório" /></span>
					
						<span class="property-value" aria-labelledby="laboratorio-label"><g:link controller="laboratorio" action="visualizar" id="${exameInstance?.laboratorio?.instituicaoMedicaLaboratorio?.id}">${exameInstance?.laboratorio?.instituicaoMedicaLaboratorio?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${exameInstance?.id}" />
					<g:link class="edit" action="editar" id="${exameInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
			</sec:access>
		</div>
	</body>
</html>

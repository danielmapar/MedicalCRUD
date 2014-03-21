
<%@ page import="br.com.modular.instituicao.Medico" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Médico</title>
	</head>
	<body>
		<a href="#show-medico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Médicos</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Médico</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-medico" class="content scaffold-show" role="main">
			<h1>Visualizar Médico</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medico">
			
				<g:if test="${medicoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="medico.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${medicoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicoInstance?.especialidade}">
				<li class="fieldcontain">
					<span id="especialidade-label" class="property-label"><g:message code="medico.especialidade.label" default="Especialidade" /></span>
					
						<span class="property-value" aria-labelledby="especialidade-label"><g:link controller="especialidade" action="visualizar" id="${medicoInstance?.especialidade?.id}">${medicoInstance?.especialidade?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${instituicaoMedicaInstance?.nome}">
				<li class="fieldcontain">
					<span id="hospital-label" class="property-label"><g:message code="medico.hospital.label" default="Nome da Instituição Médica" /></span>
					
						<span class="property-value" aria-labelledby="hospital-label"><g:link controller="hospital" action="visualizar" id="${instituicaoMedicaInstance?.id}">${instituicaoMedicaInstance?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

			
			</ol>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${medicoInstance?.id}" />
					<g:link class="edit" action="editar" id="${medicoInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
			</sec:access>
		</div>
	</body>
</html>

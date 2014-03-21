
<%@ page import="br.com.modular.instituicao.Medico" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Médicos</title>
	</head>
	<body>
		<a href="#list-medico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Médico</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="list-medico" class="content scaffold-list" role="main">
			<h1>Lista de Médicos</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'medico.nome.label', default: 'Nome')}" />
					
						<th><g:message code="medico.especialidade.label" default="Especialidade" /></th>
						
						<th><g:message code="medico.intituicao.label" default="Instituição Médica" /></th>
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medicoInstanceList}" status="i" var="medicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${medicoInstance.id}">${fieldValue(bean: medicoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: medicoInstance, field: "especialidade.nome")}</td>
						
						<g:if test="${medicoInstance?.hospital}">
						<td>${fieldValue(bean: medicoInstance, field: "hospital.instituicaoMedicaHospital.nome")}</td>
						</g:if>
						<g:else>
						<td>${fieldValue(bean: medicoInstance, field: "clinica.instituicaoMedicaHospital.nome")}</td>
						</g:else>
						
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medicoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

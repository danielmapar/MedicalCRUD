<%@ page import="br.com.modular.instituicao.InstituicaoMedica" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Clínicas</title>
	</head>
	<body>
		<a href="#list-clinica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar clinica</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="list-clinica" class="content scaffold-list" role="main">
			<h1>Lista de Clínicas</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'instituicaoMedica.nome.label', default: 'Nome')}" />
					
						<th><g:message code="instituicaoMedica.endereco.label" default="Estado" /></th>
						
						<th><g:message code="instituicaoMedica.endereco.label" default="Cidade" /></th>
										
					</tr>
				</thead>
				<tbody>
				<g:each in="${instituicaoMedicaInstanceList}" status="i" var="instituicaoMedicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${instituicaoMedicaInstance.id}">${fieldValue(bean: instituicaoMedicaInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: instituicaoMedicaInstance, field: "endereco.estado")}</td>
						
						<td>${fieldValue(bean: instituicaoMedicaInstance, field: "endereco.cidade")}</td>
										
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${instituicaoMedicaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
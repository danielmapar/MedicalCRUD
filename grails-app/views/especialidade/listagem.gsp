
<%@ page import="br.com.modular.modelos.Especialidade" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Especialidades</title>
	</head>
	<body>
		<a href="#list-especialidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Especialidade</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="list-especialidade" class="content scaffold-list" role="main">
			<h1>Lista de Especialidades</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'especialidade.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="detalhamento" title="${message(code: 'especialidade.detalhamento.label', default: 'Detalhamento')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${especialidadeInstanceList}" status="i" var="especialidadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${especialidadeInstance.id}">${fieldValue(bean: especialidadeInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: especialidadeInstance, field: "detalhamento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${especialidadeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

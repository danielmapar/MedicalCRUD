
<%@ page import="br.com.modular.modelos.Cobertura" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Coberturas</title>
	</head>
	<body>
		<a href="#list-cobertura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Cobertura</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="list-cobertura" class="content scaffold-list" role="main">
			<h1>Lista de Coberturas</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'cobertura.nome.label', default: 'Nome')}" />
						
						<th><g:message code="cobertura.planoDeSaude.label" default="Plano de Saúde" /></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${coberturaInstanceList}" status="i" var="coberturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${coberturaInstance.id}">${fieldValue(bean: coberturaInstance, field: "nome")}</g:link></td>
						
						<td>${fieldValue(bean: coberturaInstance, field: "planoDeSaude.nome")}</td>
						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${coberturaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

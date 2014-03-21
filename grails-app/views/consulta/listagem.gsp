
<%@ page import="br.com.modular.instituicao.Consulta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Consultas</title>
	</head>
	<body>
		<a href="#list-consulta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
			</ul>
		</div>
		<div id="list-consulta" class="content scaffold-list" role="main">
			<h1>Lista de Consultas</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="consulta.cliente.label" default="Cliente" /></th>
					
						<th><g:message code="consulta.medico.label" default="Médico" /></th>
					
						<g:sortableColumn property="duracaoMinutos" title="${message(code: 'consulta.duracaoMinutos.label', default: 'Duração em Minutos')}" />
					
						<th><g:message code="consulta.exame.label" default="Exame" /></th>
					
						<th><g:message code="consulta.instituicao.label" default="Instituição" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${consultaInstanceList}" status="i" var="consultaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${consultaInstance.id}">${fieldValue(bean: consultaInstance, field: "cliente.nome")}</g:link></td>
					
						<td>${fieldValue(bean: consultaInstance, field: "medico.nome")}</td>
					
						<td>${fieldValue(bean: consultaInstance, field: "duracaoMinutos")}</td>
					
						<td>${fieldValue(bean: consultaInstance, field: "exame.nome")}</td>
					
						<td>${fieldValue(bean: consultaInstance, field: "instituicao.nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${consultaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

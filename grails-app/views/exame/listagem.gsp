
<%@ page import="br.com.modular.instituicao.Exame" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Exames</title>
	</head>
	<body>
		<a href="#list-exame" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
			</ul>
		</div>
		<div id="list-exame" class="content scaffold-list" role="main">
			<h1>Cadastrar Exame</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'exame.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="duracaoMinutos" title="${message(code: 'exame.duracaoMinutos.label', default: 'Duração em Minutos')}" />
					
						<th><g:message code="exame.laboratorio.label" default="Laboratório" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${exameInstanceList}" status="i" var="exameInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${exameInstance.id}">${fieldValue(bean: exameInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: exameInstance, field: "duracaoMinutos")}</td>
					
						<td>${fieldValue(bean: exameInstance, field: "laboratorio.instituicaoMedicaLaboratorio.nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${exameInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

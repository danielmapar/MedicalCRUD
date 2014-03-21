
<%@ page import="br.com.modular.modelos.Carencia" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Carências</title>
	</head>
	<body>
		<a href="#list-carencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Carência</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="list-carencia" class="content scaffold-list" role="main">
			<h1>Lista Carências</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'carencia.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="tempoDeEsperaHoras" title="${message(code: 'carencia.tempoDeEsperaHoras.label', default: 'Tempo de Espera em Horas')}" />
					
						<th><g:message code="carencia.planoDeSaude.label" default="Plano de Saúde" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carenciaInstanceList}" status="i" var="carenciaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${carenciaInstance.id}">${fieldValue(bean: carenciaInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: carenciaInstance, field: "tempoDeEsperaHoras")}</td>
					
						<td>${fieldValue(bean: carenciaInstance, field: "planoDeSaude.nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carenciaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

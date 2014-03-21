
<%@ page import="br.com.modular.modelos.PlanoDeSaude" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Planos de Saúde</title>
	</head>
	<body>
		<a href="#list-planoDeSaude" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Plano de Saúde</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="list-planoDeSaude" class="content scaffold-list" role="main">
			<h1>Lista de Planos de Saúde</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'planoDeSaude.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="valorMensalidade" title="${message(code: 'planoDeSaude.valorMensalidade.label', default: 'Valor Mensalidade')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planoDeSaudeInstanceList}" status="i" var="planoDeSaudeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${planoDeSaudeInstance.id}">${fieldValue(bean: planoDeSaudeInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: planoDeSaudeInstance, field: "valorMensalidade")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planoDeSaudeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

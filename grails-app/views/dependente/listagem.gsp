
<%@ page import="br.com.modular.cliente.Dependente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Dependentes</title>
	</head>
	<body>
		<a href="#list-dependente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
			</ul>
		</div>
		<div id="list-dependente" class="content scaffold-list" role="main">
			<h1>Lista de Dependentes</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'dependente.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="sobrenome" title="${message(code: 'dependente.sobrenome.label', default: 'Sobrenome')}" />
					
						<g:sortableColumn property="idade" title="${message(code: 'dependente.idade.label', default: 'Idade')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dependenteInstanceList}" status="i" var="dependenteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${dependenteInstance.id}">${fieldValue(bean: dependenteInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: dependenteInstance, field: "sobrenome")}</td>
					
						<td>${fieldValue(bean: dependenteInstance, field: "idade")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dependenteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

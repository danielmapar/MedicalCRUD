
<%@ page import="br.com.modular.seguranca.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Lista de Clientes</title>
	</head>
	<body>
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Cliente</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1>Listagem de Clientes</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dataCriacao" title="Data Criação" />
					
						<g:sortableColumn property="email" title="Email" />
					
						<g:sortableColumn property="senha" title="Senha" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="visualizar" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "dataCriacao")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "senha")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

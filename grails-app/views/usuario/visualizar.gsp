<%@ page import="br.com.modular.seguranca.Usuario" %>
<%@ page import="br.com.modular.cliente.Cliente" %>
<%@ page import="br.com.modular.cliente.PlanoDeSaudeContratado" %>
<%@ page import="br.com.modular.usuario.Endereco" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Cliente</title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="list" action="listagem">Lista de Clientes</g:link></li>
				<li><g:link class="create" action="cadastrar">Cadastrar Cliente</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1>Visualizar Cliente</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.tipoUsuario}">
				<li class="fieldcontain">
					<span id="tipoUsuario-label" class="property-label">Tipo de Usuário</span>
					
						<span class="property-value" aria-labelledby="tipoUsuario-label"><g:fieldValue bean="${usuarioInstance}" field="tipoUsuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.senha}">
				<li class="fieldcontain">
					<span id="senha-label" class="property-label"><g:message code="usuario.senha.label" default="Senha" /></span>
					
						<span class="property-value" aria-labelledby="senha-label"><g:fieldValue bean="${usuarioInstance}" field="senha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="cliente.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${clienteInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.sobrenome}">
				<li class="fieldcontain">
					<span id="sobrenome-label" class="property-label"><g:message code="cliente.sobrenome.label" default="Sobrenome" /></span>
					
						<span class="property-value" aria-labelledby="sobrenome-label"><g:fieldValue bean="${clienteInstance}" field="sobrenome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.idade}">
				<li class="fieldcontain">
					<span id="idade-label" class="property-label"><g:message code="cliente.idade.label" default="Idade" /></span>
					
						<span class="property-value" aria-labelledby="idade-label"><g:fieldValue bean="${clienteInstance}" field="idade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="cliente.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${clienteInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.cep}">
				<li class="fieldcontain">
					<span id="cep-label" class="property-label"><g:message code="endereco.cep.label" default="Cep" /></span>
					
						<span class="property-value" aria-labelledby="cep-label"><g:fieldValue bean="${enderecoInstance}" field="cep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.logradouro}">
				<li class="fieldcontain">
					<span id="logradouro-label" class="property-label"><g:message code="endereco.logradouro.label" default="Logradouro" /></span>
					
						<span class="property-value" aria-labelledby="logradouro-label"><g:fieldValue bean="${enderecoInstance}" field="logradouro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.complemento}">
				<li class="fieldcontain">
					<span id="complemento-label" class="property-label"><g:message code="endereco.complemento.label" default="Complemento" /></span>
					
						<span class="property-value" aria-labelledby="complemento-label"><g:fieldValue bean="${enderecoInstance}" field="complemento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.bairro}">
				<li class="fieldcontain">
					<span id="bairro-label" class="property-label"><g:message code="endereco.bairro.label" default="Bairro" /></span>
					
						<span class="property-value" aria-labelledby="bairro-label"><g:fieldValue bean="${enderecoInstance}" field="bairro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.cidade}">
				<li class="fieldcontain">
					<span id="cidade-label" class="property-label"><g:message code="endereco.cidade.label" default="Cidade" /></span>
					
						<span class="property-value" aria-labelledby="cidade-label"><g:fieldValue bean="${enderecoInstance}" field="cidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="endereco.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${enderecoInstance}" field="estado"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${planoDeSaudeContratadoInstance?.planoDeSaude}">
				<li class="fieldcontain">
					<span id="planoDeSaude-label" class="property-label"><g:message code="planoDeSaudeContratado.planoDeSaude.label" default="Plano de Saúde" /></span>
					
						<span class="property-value" aria-labelledby="planoDeSaude-label"><g:link controller="planoDeSaude" action="visualizar" id="${planoDeSaudeContratadoInstance?.planoDeSaude?.id}">${planoDeSaudeContratadoInstance?.planoDeSaude?.nome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${planoDeSaudeContratadoInstance?.dataVencimentoBoleto}">
				<li class="fieldcontain">
					<span id="dataVencimentoBoleto-label" class="property-label"><g:message code="planoDeSaudeContratado.dataVencimentoBoleto.label" default="Data de Vencimento do Boleto" /></span>
					
						<span class="property-value" aria-labelledby="dataVencimentoBoleto-label"><g:fieldValue bean="${planoDeSaudeContratadoInstance}" field="dataVencimentoBoleto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planoDeSaudeContratadoInstance?.dependentes}">
				<li class="fieldcontain">
					<span id="dependentes-label" class="property-label"><g:message code="planoDeSaudeContratado.dependentes.label" default="Dependentes" /></span>
					
						<g:each in="${planoDeSaudeContratadoInstance.dependentes}" var="d">
						<span class="property-value" aria-labelledby="dependentes-label"><g:link controller="dependente" action="visualizar" id="${d.id}">${d?.nome?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${listaConsultasInstance}">
				<li class="fieldcontain">	
					<span id="consultas-label" class="property-label"><g:message code="consultas.label" default="Consultas" /></span>
					
						<g:each in="${listaConsultasInstance}" var="consulta">
						<span class="property-value" aria-labelledby="consulta-label">${'Médico: ' + consulta?.medico?.nome?.encodeAsHTML() + '<br/> Duração: ' + consulta?.duracaoMinutos?.encodeAsHTML() + ' minutos<br/>Instituicão Médica: ' + consulta?.instituicao?.nome?.encodeAsHTML() + '<br/>'}</span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:link class="edit" action="editar" id="${usuarioInstance?.id}">Editar</g:link>
					<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
					</sec:access>
				</fieldset>
			</g:form>
			
		</div>
	</body>
</html>

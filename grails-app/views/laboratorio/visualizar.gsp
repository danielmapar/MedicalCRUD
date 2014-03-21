
<%@ page import="br.com.modular.instituicao.Laboratorio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Laboratório</title>
	</head>
	<body>
		<a href="#show-laboratorio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Laboratórios</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Laboratório</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-laboratorio" class="content scaffold-show" role="main">
			<h1>Visualizar Laboratório</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list laboratorio">
			
				<g:if test="${instituicaoMedicaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="instituicaoMedica.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${instituicaoMedicaInstance}" field="nome"/></span>
					
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
						
				<g:if test="${instituicaoMedicaInstance?.planosDeSaude}">
				<li class="fieldcontain">
					<span id="planosDeSaude-label" class="property-label"><g:message code="instituicaoMedica.planosDeSaude.label" default="Planos de Saúde" /></span>
					
						<g:each in="${instituicaoMedicaInstance.planosDeSaude}" var="p">
						<span class="property-value" aria-labelledby="planosDeSaude-label"><g:link controller="planoDeSaude" action="visualizar" id="${p.id}">${p?.nome?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
						
				<g:if test="${laboratorioInstance?.limiteExames}">
				<li class="fieldcontain">
					<span id="limiteExames-label" class="property-label"><g:message code="laboratorio.limiteExames.label" default="Limite Exames" /></span>
					
						<span class="property-value" aria-labelledby="limiteExames-label"><g:fieldValue bean="${laboratorioInstance}" field="limiteExames"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${laboratorioInstance?.exames}">
				<li class="fieldcontain">
					<span id="exames-label" class="property-label"><g:message code="laboratorio.exames.label" default="Exames" /></span>
						
						<g:each in="${laboratorioInstance.exames}" var="e">
						<span class="property-value" aria-labelledby="exames-label"><g:link controller="exame" action="visualizar" id="${e.id}">${e?.nome?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>
				
			
			
			</ol>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${instituicaoMedicaInstance?.id}" />
					<g:link class="edit" action="editar" id="${instituicaoMedicaInstance?.id}">Editar</g:link>
					<g:actionSubmit class="delete" action="deletar" value="Deletar" onclick="return confirm('Você tem certeza?');" />
				</fieldset>
			</g:form>
			</sec:access>
		</div>
	</body>
</html>

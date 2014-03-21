<%@ page import="br.com.modular.instituicao.Hospital" %>
<%@ page import="br.com.modular.instituicao.InstituicaoMedica" %>
<%@ page import="br.com.modular.usuario.Endereco" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Visualizar Hospital</title>
	</head>
	<body>
		<a href="#show-hospital" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home Page</a></li>
				<li><g:link class="list" action="listagem">Lista de Hospitais</g:link></li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<li><g:link class="create" action="cadastrar">Cadastrar Hospital</g:link></li>
				</sec:access>
			</ul>
		</div>
		<div id="show-hospital" class="content scaffold-show" role="main">
			<h1>Visualizar Hospital</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hospital">
				
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
			
				
				<li class="fieldcontain">
					<span id="consultas-label" class="property-label"><g:message code="instituicaoMedica.consultas.label" default="Consultas" /></span>
						<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
						<g:if test="${instituicaoMedicaInstance?.consultas}">
						<g:each in="${instituicaoMedicaInstance.consultas}" var="c">
						<span class="property-value" aria-labelledby="consultas-label"><g:link controller="consulta" action="visualizar" id="${c.id}">Médico: ${c?.medico?.nome?.encodeAsHTML()} - duração em minutos: ${c?.duracaoMinutos?.encodeAsHTML()} </g:link></span>
						</g:each>
						</g:if>
						</sec:access>
					<span class="property-value" aria-labelledby="consultas-label"><g:link controller="consulta" action="cadastrar" params="['instituicaoMedica.id': instituicaoMedicaInstance?.id]">Agendar Consulta</g:link></span>

				</li>
				<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<g:if test="${hospitalInstance?.limiteConsultas}">
				<li class="fieldcontain">
					<span id="limiteConsultas-label" class="property-label"><g:message code="hospital.limiteConsultas.label" default="Limite Consultas" /></span>
					
						<span class="property-value" aria-labelledby="limiteConsultas-label"><g:fieldValue bean="${hospitalInstance}" field="limiteConsultas"/></span>
					
				</li>
				</g:if>
				</sec:access>
			
				<g:if test="${hospitalInstance?.especialidades_hospital}">
				<li class="fieldcontain">
					<span id="especialidades_hospital-label" class="property-label"><g:message code="hospital.especialidades_hospital.label" default="Especialidadeshospital" /></span>
					
						<g:each in="${hospitalInstance.especialidades_hospital}" var="e">
						<span class="property-value" aria-labelledby="especialidades_hospital-label"><g:link controller="especialidade" action="visualizar" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				
				<li class="fieldcontain">
					<span id="medicos_hospital-label" class="property-label"><g:message code="hospital.medicos_hospital.label" default="Medicos do Hospital" /></span>
						<g:if test="${hospitalInstance?.medicos_hospital}">	
						<g:each in="${hospitalInstance.medicos_hospital}" var="m">
						<span class="property-value" aria-labelledby="medicos_hospital-label"><g:link controller="medico" action="visualizar" id="${m.id}">${m?.nome?.encodeAsHTML()}</g:link></span>
						</g:each>
						</g:if>
						<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
						<span class="property-value" aria-labelledby="medicos_hospital-label"><g:link controller="medico" action="cadastrar" params="['hospital.id': hospitalInstance?.id]">Cadastrar Médico</g:link></span>
						</sec:access>
				</li>
				
			
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

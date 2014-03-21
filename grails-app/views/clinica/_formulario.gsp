<%@ page import="br.com.modular.instituicao.Clinica" %>
<%@ page import="br.com.modular.instituicao.InstituicaoMedica" %>
<%@ page import="br.com.modular.usuario.Endereco" %>


<div class="fieldcontain ${hasErrors(bean: instituicaoMedicaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="instituicaoMedica.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="20" required="" value="${instituicaoMedicaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} required">
	<label for="cep">
		<g:message code="endereco.cep.label" default="Cep" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cep" maxlength="9" required="" value="${enderecoInstance?.cep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'error')} required">
	<label for="logradouro">
		<g:message code="endereco.logradouro.label" default="Logradouro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="logradouro" maxlength="100" required="" value="${enderecoInstance?.logradouro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'complemento', 'error')} required">
	<label for="complemento">
		<g:message code="endereco.complemento.label" default="Complemento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="complemento" maxlength="50" required="" value="${enderecoInstance?.complemento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} required">
	<label for="bairro">
		<g:message code="endereco.bairro.label" default="Bairro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bairro" maxlength="30" required="" value="${enderecoInstance?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="endereco.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cidade" maxlength="50" required="" value="${enderecoInstance?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="endereco.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" maxlength="50" required="" value="${enderecoInstance?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instituicaoMedicaInstance, field: 'planosDeSaude', 'error')} required">
	<label for="planosDeSaude">
		<g:message code="instituicaoMedica.planosDeSaude.label" default="Planos de Saúde" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="planosDeSaude" from="${br.com.modular.modelos.PlanoDeSaude.list()}" multiple="multiple" optionKey="id" optionValue="nome" size="5" required="" value="${instituicaoMedicaInstance?.planosDeSaude*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clinicaInstance, field: 'limiteConsultas', 'error')} required">
	<label for="limiteConsultas">
		<g:message code="clinica.limiteConsultas.label" default="Limite Consultas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="limiteConsultas" type="number" value="${clinicaInstance.limiteConsultas}" required=""/>
</div>

<g:if test="${cadastro==false}">

<div class="fieldcontain ${hasErrors(bean: instituicaoMedicaInstance, field: 'consultas', 'error')} ">
	<label for="consultas">
		<g:message code="instituicaoMedica.consultas.label" default="Consultas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${instituicaoMedicaInstance?.consultas?}" var="c">
    <li><g:link controller="consulta" action="visualizar" id="${c.id}">${c?.duracaoMinutos?.encodeAsHTML()} minutos</g:link></li>
</g:each>
<li class="add">
<g:link controller="consulta" action="cadastrar" params="['instituicaoMedica.id': instituicaoMedicaInstance?.id]">Agendar Consulta</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: clinicaInstance, field: 'especialidades_clinica', 'error')} ">
	<label for="especialidades_clinica">
		<g:message code="clinica.especialidades_clinica.label" default="Especialidades do clinica" />
		
	</label>
	<g:select name="especialidades_clinica" from="${br.com.modular.modelos.Especialidade.list()}" multiple="multiple" optionKey="id" optionValue="nome" size="5" value="${clinicaInstance?.especialidades_clinica*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clinicaInstance, field: 'medicos_clinica', 'error')} ">
	<label for="medicos_clinica">
		<g:message code="clinica.medicos_clinica.label" default="Médicos do clinica" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clinicaInstance?.medicos_clinica?}" var="m">
    <li><g:link controller="medico" action="visualizar" id="${m.id}">${m?.nome?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="medico" action="cadastrar" params="['clinica.id': clinicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'medico.label', default: 'Médico')])}</g:link>
</li>
</ul>

</div>
</g:if>


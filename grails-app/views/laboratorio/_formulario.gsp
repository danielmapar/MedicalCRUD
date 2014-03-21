<%@ page import="br.com.modular.instituicao.Laboratorio" %>
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


<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'limiteExames', 'error')} required">
	<label for="limiteExames">
		<g:message code="laboratorio.limiteExames.label" default="Limite de Exames" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="limiteExames" type="number" value="${laboratorioInstance.limiteExames}" required=""/>
</div>

<g:if test="${cadastro==false}">

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'exames', 'error')} required">
	<label for="exames">
		<g:message code="laboratorio.exames.label" default="Exames" />
		<span class="required-indicator">*</span>
	</label>
	
<ul class="one-to-many">
<g:each in="${laboratorioInstance?.exames?}" var="e">
    <li><g:link controller="exame" action="visualizar" id="${e.id}">${e?.nome?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="exame" action="cadastrar" params="['laboratorio.id': laboratorioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exame.label', default: 'Exame')])}</g:link>
</li>
</ul>

</div>


</g:if>



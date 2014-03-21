<%@ page import="br.com.modular.seguranca.Usuario" %>
<%@ page import="br.com.modular.cliente.Cliente" %>
<%@ page import="br.com.modular.cliente.PlanoDeSaudeContratado" %>
<%@ page import="br.com.modular.usuario.Endereco" %>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" maxlength="128" required="" value="${usuarioInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="senha" required="" value="${usuarioInstance?.senha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="20" required="" value="${clienteInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'sobrenome', 'error')} required">
	<label for="sobrenome">
		<g:message code="cliente.sobrenome.label" default="Sobrenome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sobrenome" maxlength="20" required="" value="${clienteInstance?.sobrenome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'idade', 'error')} required">
	<label for="idade">
		<g:message code="cliente.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idade" type="number" value="${clienteInstance?.idade}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="cliente.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${br.com.modular.formatacao.DomainService$SexoType?.values()}" keys="${br.com.modular.formatacao.DomainService$SexoType.values()*.name()}" required="" value="${clienteInstance?.sexo?.name()}"/>
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

<div class="fieldcontain ${hasErrors(bean: planoDeSaudeContratadoInstance, field: 'planoDeSaude', 'error')} required">
	<label for="planoDeSaude">
		<g:message code="planoDeSaudeContratado.planoDeSaude.label" default="Plano de Saúde" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planoDeSaude" name="planoDeSaude.id" from="${br.com.modular.modelos.PlanoDeSaude.list()}" optionKey="id" optionValue="nome" required="" value="${planoDeSaudeContratadoInstance?.planoDeSaude?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planoDeSaudeContratadoInstance, field: 'dataVencimentoBoleto', 'error')} required">
	<label for="dataVencimentoBoleto">
		<g:message code="planoDeSaudeContratado.dataVencimentoBoleto.label" default="Data de Vencimento do Boleto" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataVencimentoBoleto" value="${dataInstance}" required=""/>
</div>
<g:if test="${cadastro==false}">

<div class="fieldcontain ${hasErrors(bean: planoDeSaudeContratadoInstance, field: 'dependentes', 'error')} ">
	<label for="dependentes">
		<g:message code="planoDeSaudeContratado.dependentes.label" default="Dependentes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${planoDeSaudeContratadoInstance?.dependentes?}" var="d">
    <li><g:link controller="dependente" action="visualizar" id="${d.id}">${d?.nome?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="dependente" action="cadastrar" params="['planoDeSaudeContratado.id': planoDeSaudeContratadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dependente.label', default: 'Dependente')])}</g:link>
</li>
</ul>

</div>
</g:if>
<%@ page import="br.com.modular.cliente.Dependente" %>



<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="dependente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${dependenteInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'sobrenome', 'error')} required">
	<label for="sobrenome">
		<g:message code="dependente.sobrenome.label" default="Sobrenome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sobrenome" required="" value="${dependenteInstance?.sobrenome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'idade', 'error')} required">
	<label for="idade">
		<g:message code="dependente.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idade" type="number" value="${dependenteInstance.idade}" required=""/>
</div>



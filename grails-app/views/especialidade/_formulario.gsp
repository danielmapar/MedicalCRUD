<%@ page import="br.com.modular.modelos.Especialidade" %>



<div class="fieldcontain ${hasErrors(bean: especialidadeInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="especialidade.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${especialidadeInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: especialidadeInstance, field: 'detalhamento', 'error')} required">
	<label for="detalhamento">
		<g:message code="especialidade.detalhamento.label" default="Detalhamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="detalhamento" required="" value="${especialidadeInstance?.detalhamento}"/>
</div>


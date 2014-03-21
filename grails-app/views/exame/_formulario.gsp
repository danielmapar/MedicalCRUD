<%@ page import="br.com.modular.instituicao.Exame" %>



<div class="fieldcontain ${hasErrors(bean: exameInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="exame.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="20" required="" value="${exameInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exameInstance, field: 'duracaoMinutos', 'error')} required">
	<label for="duracaoMinutos">
		<g:message code="exame.duracaoMinutos.label" default="Duração Minutos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracaoMinutos" type="number" value="${exameInstance.duracaoMinutos}" required=""/>
</div>

	<g:hiddenField name="laboratorioInstanceId" value="${laboratorioInstanceId}" />




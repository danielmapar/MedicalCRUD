<%@ page import="br.com.modular.modelos.Cobertura" %>



<div class="fieldcontain ${hasErrors(bean: coberturaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="cobertura.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${coberturaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coberturaInstance, field: 'planoDeSaude', 'error')} required">
	<label for="planoDeSaude">
		<g:message code="cobertura.planoDeSaude.label" default="Plano De Saúde" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planoDeSaude" name="planoDeSaude.id" from="${br.com.modular.modelos.PlanoDeSaude.list()}" optionKey="id" optionValue="nome" required="" value="${coberturaInstance?.planoDeSaude?.id}" class="many-to-one"/>
</div>


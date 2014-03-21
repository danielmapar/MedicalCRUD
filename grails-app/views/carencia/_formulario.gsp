<%@ page import="br.com.modular.modelos.Carencia" %>

<div class="fieldcontain ${hasErrors(bean: carenciaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="carencia.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${carenciaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carenciaInstance, field: 'tempoDeEsperaHoras', 'error')} required">
	<label for="tempoDeEsperaHoras">
		<g:message code="carencia.tempoDeEsperaHoras.label" default="Tempo de Espera em Horas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tempoDeEsperaHoras" type="number" value="${carenciaInstance.tempoDeEsperaHoras}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carenciaInstance, field: 'planoDeSaude', 'error')} required">
	<label for="planoDeSaude">
		<g:message code="carencia.planoDeSaude.label" default="Plano de Saúde" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planoDeSaude" name="planoDeSaude.id" from="${br.com.modular.modelos.PlanoDeSaude.list()}" optionKey="id" optionValue="nome" required="" value="${carenciaInstance?.planoDeSaude?.id}" class="many-to-one"/>
</div>


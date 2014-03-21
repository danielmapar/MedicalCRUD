<%@ page import="br.com.modular.instituicao.Consulta" %>


<div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'medico', 'error')} required">
	<label for="medico">
		<g:message code="consulta.medico.label" default="Médico" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="medico" name="medico.id" from="${br.com.modular.instituicao.Medico.list()}" optionValue="nome" optionKey="id" required="" value="${consultaInstance?.medico?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'duracaoMinutos', 'error')} required">
	<label for="duracaoMinutos">
		<g:message code="consulta.duracaoMinutos.label" default="Duração em Minutos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracaoMinutos" type="number" value="${consultaInstance.duracaoMinutos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'exame', 'error')} ">
	<label for="exame">
		<g:message code="consulta.exame.label" default="Exame" />
		
	</label>
	<g:select id="exame" name="exame.id" from="${br.com.modular.instituicao.Exame.list()}" optionValue="nome" optionKey="id" value="${consultaInstance?.exame?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>



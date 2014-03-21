<%@ page import="br.com.modular.instituicao.Medico" %>



<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="medico.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${medicoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'especialidade', 'error')} required">
	<label for="especialidade">
		<g:message code="medico.especialidade.label" default="Especialidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="especialidade" name="especialidade.id" from="${br.com.modular.modelos.Especialidade.list()}" optionKey="id" optionValue="nome" required="" value="${medicoInstance?.especialidade?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'hospital', 'error')} ">
	<label for="hospital">
		<g:message code="medico.hospital.label" default="Hospital" />
		
	</label>
	<g:select id="hospital" name="hospital.id" from="${br.com.modular.instituicao.Hospital.list()}" optionKey="id" optionValue="${{it.instituicaoMedicaHospital.nome}}" value="${medicoInstance?.hospital?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'clinica', 'error')} ">
	<label for="clinica">
		<g:message code="medico.clinica.label" default="Clínica" />
		
	</label>
	<g:select id="clinica" name="clinica.id" from="${br.com.modular.instituicao.Clinica.list()}" optionKey="id" optionValue="${{it.instituicaoMedicaClinica.nome}}" value="${medicoInstance?.clinica?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>


<%@ page import="br.com.modular.modelos.PlanoDeSaude" %>

<div class="fieldcontain ${hasErrors(bean: planoDeSaudeInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="planoDeSaude.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${planoDeSaudeInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planoDeSaudeInstance, field: 'valorMensalidade', 'error')} required">
	<label for="valorMensalidade">
		<g:message code="planoDeSaude.valorMensalidade.label" default="Valor Mensalidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorMensalidade" value="${fieldValue(bean: planoDeSaudeInstance, field: 'valorMensalidade')}" required=""/>
</div>


<g:if test="${cadastro==false}">

<div class="fieldcontain ${hasErrors(bean: planoDeSaudeInstance, field: 'cobertura', 'error')} required">
	<label for="cobertura">
		<g:message code="planoDeSaude.cobertura.label" default="Cobertura" />
	</label>
	
<ul class="one-to-many">
<g:each in="${planoDeSaudeInstance?.cobertura?}" var="c">
    <li><g:link controller="cobertura" action="visualizar" id="${c.id}">${c?.nome?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cobertura" action="cadastrar" params="['planoDeSaude.id': planoDeSaudeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cobertura.label', default: 'Cobertura')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: planoDeSaudeInstance, field: 'carencia', 'error')} required">
	<label for="carencia">
		<g:message code="planoDeSaude.carencia.label" default="Carência" />
	</label>
	
<ul class="one-to-many">
<g:each in="${planoDeSaudeInstance?.carencia?}" var="c">
    <li><g:link controller="carencia" action="visualizar" id="${c.id}">${c?.nome?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carencia" action="cadastrar" params="['planoDeSaude.id': planoDeSaudeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carencia.label', default: 'Carência')])}</g:link>
</li>
</ul>

</div>

</g:if>
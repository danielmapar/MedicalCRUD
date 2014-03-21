<!doctype html>
<%@page import="br.com.modular.formatacao.DomainService.UsuarioType"%>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bem vindo ao sistema de Programação Modular</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 15em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
	    <br/>
	    <hr/>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Status da Aplicação</h1>
			<ul>
				<li>Número de planos de saúde: ${br.com.modular.modelos.PlanoDeSaude.count()} </li>
				<li>Número de exames: ${br.com.modular.instituicao.Exame.count()} </li>
				<li>Número de especialidades: ${br.com.modular.modelos.Especialidade.count()} </li>
				<li>Número de médicos: ${br.com.modular.instituicao.Medico.count()} </li>
				<li>Número de hospitais: ${br.com.modular.instituicao.Hospital.count()} </li>
				<li>Número de clínicas: ${br.com.modular.instituicao.Clinica.count()} </li>
				<li>Número de laboratórios: ${br.com.modular.instituicao.Laboratorio.count()} </li>
				<li>Número de consultas: ${br.com.modular.instituicao.Consulta.count()} </li>
				

			</ul>
			<br/>
			<h1>Menu de Opções</h1>
			<ul>
			
		    <sec:access expression="hasRole('ROLE_CLIENTE')">
				<g:set var="tipoUsuario" value="${UsuarioType.C}" />
			</sec:access>
			<sec:access expression="hasRole('ROLE_ADMINISTRADOR')">
				<g:set var="tipoUsuario" value="${UsuarioType.A}" />
			</sec:access>
			
			<g:if test="${tipoUsuario == UsuarioType.C}">
				<b><li class="controller"><g:link controller="planoDeSaude" action="listagem">Lista de planos de saúde</g:link></li></b>
				<b><li class="controller"><g:link controller="especialidade" action="listagem">Lista de especialidades</g:link></li></b>
				<b><li class="controller"><g:link controller="medico" action="listagem">Lista de médicos</g:link></li></b>
				<b><li class="controller"><g:link controller="hospital" action="listagem">Lista de hospitais</g:link></li></b>
				<b><li class="controller"><g:link controller="laboratorio" action="listagem">Lista de laboratórios</g:link></li></b>
				<b><li class="controller"><g:link controller="clinica" action="listagem">Lista de clínicas</g:link></li></b>
				<b><li class="controller"><g:link controller="boleto" action="index">Gerar boleto</g:link></li></b>
			</g:if>
			<g:elseif test="${tipoUsuario == UsuarioType.A}">
				<b><li class="controller"><g:link controller="planoDeSaude" action="listagem">Lista de planos de saúde</g:link></li></b>
				<b><li class="controller"><g:link controller="carencia" action="listagem">Lista de carências</g:link></li></b>
				<b><li class="controller"><g:link controller="consulta" action="listagem">Lista de consultas</g:link></li></b>
				<b><li class="controller"><g:link controller="cobertura" action="listagem">Lista de coberturas</g:link></li></b>
				<b><li class="controller"><g:link controller="especialidade" action="listagem">Lista de especialidades</g:link></li></b>
				<b><li class="controller"><g:link controller="medico" action="listagem">Lista de médicos</g:link></li></b>
				<b><li class="controller"><g:link controller="hospital" action="listagem">Lista de hospitais</g:link></li></b>
				<b><li class="controller"><g:link controller="laboratorio" action="listagem">Lista de laboratórios</g:link></li></b>
				<b><li class="controller"><g:link controller="exame" action="listagem">Lista de exames</g:link></li></b>
				<b><li class="controller"><g:link controller="clinica" action="listagem">Lista de clínicas</g:link></li></b>
				<b><li class="controller"><g:link controller="dependente" action="listagem">Lista de dependentes</g:link></li></b>
				<b><li class="controller"><g:link controller="usuario" action="listagem">Lista de usuários</g:link></li></b>
			</g:elseif>
			<g:else>
				<b><li class="controller"><g:link controller="usuario" action="cadastrar">Cadastrar-se no sistema</g:link></li></b>
				<b><li class="controller"><g:link controller="planoDeSaude" action="listagem">Lista de planos de saúde</g:link></li></b>
				<b><li class="controller"><g:link controller="carencia" action="listagem">Lista de carências</g:link></li></b>
				<b><li class="controller"><g:link controller="cobertura" action="listagem">Lista de coberturas</g:link></li></b>
				<b><li class="controller"><g:link controller="especialidade" action="listagem">Lista de especialidades</g:link></li></b>
				<b><li class="controller"><g:link controller="medico" action="listagem">Lista de médicos</g:link></li></b>
				<b><li class="controller"><g:link controller="hospital" action="listagem">Lista de hospitais</g:link></li></b>
				<b><li class="controller"><g:link controller="laboratorio" action="listagem">Lista de laboratórios</g:link></li></b>
				<b><li class="controller"><g:link controller="exame" action="listagem">Lista de exames</g:link></li></b>
				<b><li class="controller"><g:link controller="clinica" action="listagem">Lista de clínicas</g:link></li></b>
			</g:else>
			
			
			</ul>
		</div>
	</body>
</html>
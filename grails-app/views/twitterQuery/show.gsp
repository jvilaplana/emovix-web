
<%@ page import="com.jordiv.emovix.TwitterQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="btn-group" role="group">
				<g:link class="btn btn-default" action="show" id="${twitterQueryInstance?.id}">
					<span class="glyphicon glyphicon-refresh"></span>
					<g:message code="default.refresh.label" args="[entityName]" />
				</g:link>
			</div>
			<div class="btn-group pull-right" role="group">
				<g:link class="btn btn-default" action="index">
					<span class="glyphicon glyphicon-list"></span>
					<g:message code="default.list.label" args="[entityName]" />
				</g:link>
			</div>
			<div class="btn-group pull-right" role="group">
				<g:link class="btn btn-default" action="create">
					<span class="glyphicon glyphicon-plus"></span>
					<g:message code="default.new.label" args="[entityName]" />
				</g:link>
			</div>
			<div class="clearfix"></div>
			&nbsp;
			<g:if test="${twitterQueryInstance?.query}">
				<div class="panel panel-primary">
					<div class="panel-heading">
			        	<h3 class="panel-title"><g:fieldValue bean="${twitterQueryInstance}" field="name"/></h3>
			     	</div>
			      	<div class="panel-body">
			      		<p>
			      			<span id="query-label" class="property-label"><g:message code="twitterQuery.query.label" default="Query" />:</span>
							<code><span class="property-value" aria-labelledby="query-label"><g:fieldValue bean="${twitterQueryInstance}" field="query"/></span></code>
						</p>
						<p>
							<span id="count-label" class="property-label"><g:message code="twitterQuery.count.label" default="Count" />:</span>
							<code><span class="property-value" aria-labelledby="count-label"><g:fieldValue bean="${twitterQueryInstance}" field="count"/></span></code>
						</p>
						<p>
							<span id="enabled-label" class="property-label"><g:message code="twitterQuery.enabled.label" default="Enabled" />:</span>
							<code><span class="property-value" aria-labelledby="enabled-label"><g:fieldValue bean="${twitterQueryInstance}" field="enabled"/></span></code>
						</p>
						<p>
							<span id="running-label" class="property-label"><g:message code="twitterQuery.running.label" default="Running" />:</span>
							<code><span class="property-value" aria-labelledby="running-label"><g:fieldValue bean="${twitterQueryInstance}" field="running"/></span></code>
						</p>
						<hr />
						<table class="table">
							<thead>
								<tr>
									<th>Total</th>
									<th>Neutral</th>
									<th>Bullying</th>
									<th>Improper</th>
									<th>Mood</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${responseCount}</td>
									<td>${neutralCount}</td>
									<td><g:link action="bullying" id="${twitterQueryInstance.id}">${bullyingCount}</g:link></td>
									<td>${improperCount}</td>
									<td>${moodCount}</td>
								</tr>
							</tbody>
						</table>
		      		</div>
			    </div>
			</g:if>
			<div class="btn-group pull-right" role="group">
				<g:form url="[resource:twitterQueryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-default" action="edit" resource="${twitterQueryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
				</g:form>
			</div>
			<div class="btn-group" role="group">
				<g:if test="${twitterQueryInstance?.enabled}">
					<g:link class="btn btn-danger has-spinner" action="disable" resource="${twitterQueryInstance}">
						<span class="glyphicon glyphicon-stop"></span>
						<g:message code="default.disable.label" />
						<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
					</g:link>
				</g:if>
				<g:else>
					<g:link class="btn btn-success has-spinner" action="enable" resource="${twitterQueryInstance}">
						<span class="glyphicon glyphicon-play"></span>
						<g:message code="default.enable.label" />
						<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
					</g:link>
				</g:else>
			</div>
			<div class="btn-group" role="group">
				<g:link class="btn btn-primary has-spinner" controller="twitterQueryResponse" action="index" id="${twitterQueryInstance?.id}">
					<span class="glyphicon glyphicon-play-circle"></span>
					<g:message code="twitterQuery.showResponses.label" />
					<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
				</g:link>
			</div>
		</div>
	</body>
</html>

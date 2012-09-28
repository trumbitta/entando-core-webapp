<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<h1><s:text name="title.apiServiceManagement" /></h1>
<div id="main">
	<s:if test="strutsAction == 1 || strutsAction == 3">
		<s:set var="masterApiMethodVar" value="%{getMethod(namespace, resourceName)}" />
	</s:if>
	<s:if test="strutsAction == 2">
		<h2 class="margin-more-bottom"><s:text name="label.edit" />: <s:property value="serviceKey" /></h2>
	</s:if>
	<s:elseif test="strutsAction == 1">
		<h2 class="margin-more-bottom"><s:text name="title.api.apiService.newFrom" />: <span class="monospace"><s:property value="#masterApiMethodVar.methodName" /></span></h2>
	</s:elseif>
	<s:elseif test="strutsAction == 3">
		<h2 class="margin-more-bottom"><s:text name="title.api.apiService.copyFrom" />: <span class="monospace"><s:property value="#masterApiMethodVar.methodName" /></span> in <span class="monospace"><s:property value="pageCode" /></span></h2>
	</s:elseif>
	<p>
		<s:set var="masterMethodVar" value="%{getMethod(namespace, resourceName)}" />
		<s:text name="label.service.parentApi" />: <em><s:property value="#masterMethodVar.description" />&#32;(/<s:if test="namespace!=null && namespace.length()>0"><s:property value="namespace" />/</s:if><s:property value="resourceName" />)</em>
	</p>
	<s:form action="save" >

		<s:if test="hasFieldErrors()">
			<div class="message message_error">
				<h3><s:text name="message.title.FieldErrors" /></h3>
				<ul>
					<s:iterator value="fieldErrors">
						<s:iterator value="value">
						<li><s:property escape="false" /></li>
						</s:iterator>
					</s:iterator>
				</ul>
			</div>
		</s:if>
		<fieldset>
			<legend><s:text name="label.info" /></legend>
			<p>
				<wpsf:hidden name="strutsAction" />
				<s:if test="strutsAction == 2">
					<wpsf:hidden name="serviceKey" />
				</s:if>
				<s:if test="strutsAction == 3">
					<wpsf:hidden name="pageCode" />
					<wpsf:hidden name="framePos" />
				</s:if>
				<wpsf:hidden name="resourceName" />
				<wpsf:hidden name="namespace" />
				<label for="<s:property value="serviceKey" />" class="basic-mint-label"><s:text name="name.api.service" />:</label>
				<wpsf:textfield useTabindexAutoIncrement="true" id="serviceKey" name="serviceKey" disabled="%{strutsAction == 2}" cssClass="text" />
			</p>
			<s:iterator value="systemLangs">
				<p>
					<label for="lang_<s:property value="code"/>" class="basic-mint-label"><span class="monospace">(<s:property value="code" />)</span>&#32;<s:text name="label.description" />:</label>
					<wpsf:textarea cols="50" rows="3" useTabindexAutoIncrement="true" id="%{'lang_'+code}" name="%{'lang_'+code}" value="%{descriptions[code]}" cssClass="text" />
				</p>
			</s:iterator>
			<p>
				<label for="tag" class="basic-mint-label"><s:text name="label.tag" />:</label>
				<wpsf:textfield useTabindexAutoIncrement="true" id="tag" name="tag" cssClass="text" />
			</p>
		</fieldset>
		<fieldset>
			<legend><s:text name="label.options" /></legend>
			<p>
				<wpsf:checkbox useTabindexAutoIncrement="true" name="activeService" id="activeService" cssClass="radiocheck" /><label for="activeService"><s:text name="label.active" /></label>
			</p>
			<p>
				<wpsf:checkbox useTabindexAutoIncrement="true" name="publicService" id="publicService" cssClass="radiocheck"  /><label for="publicService"><s:text name="label.hidden" /></label>
			</p>
			<p>
				<wpsf:checkbox useTabindexAutoIncrement="true" name="myEntandoService" id="myEntandoService" cssClass="radiocheck" /><label for="myEntandoService"><s:text name="label.myEntando.compatible" /></label>
			</p>
		</fieldset>
		<fieldset>
			<legend><s:text name="label.api.authorities" /></legend>
			<p><wpsf:checkbox useTabindexAutoIncrement="true" name="requiredAuth" id="requiredAuth" cssClass="radiocheck" /><label for="requiredAuth"><s:text name="label.api.authority.autenticationRequired" /></label></p>
			<p>
				<label class="basic-mint-label" for="requiredPermission"><s:text name="label.api.authority.permission" />:</label>
				<wpsf:select useTabindexAutoIncrement="true" headerKey="" headerValue="%{getText('label.none')}" name="requiredPermission" list="permissionAutorityOptions" listKey="key" listValue="value" id="requiredPermission" />
			</p>
			<p>
				<label class="basic-mint-label" for="requiredGroup"><s:text name="label.api.authority.group" />:</label>
				<wpsf:select useTabindexAutoIncrement="true" headerKey="" headerValue="%{getText('label.none')}" name="requiredGroup" list="groups" listKey="name" listValue="descr" id="requiredGroup" />
			</p>
		</fieldset>
		<fieldset>
			<legend><s:text name="label.parameters" /></legend>
			<table class="generic" summary="<s:text name="note.api.apiServiceEntryParameters.summary" />">
				<caption><span><s:text name="label.parameters" /></span></caption>
				<tr>
					<th><s:text name="label.name" /></th>
					<th><s:text name="label.description" /></th>
					<th class="icon"><s:text name="label.required" /></th>
					<th><s:text name="label.default" /></th>
					<th><s:text name="label.canBeOverridden" /></th>
				</tr>
				<s:iterator value="apiParameters" var="apiParameter" >
					<tr>
						<td class="monospace"><label for="<s:property value="%{#apiParameter.key + '_apiParam'}" />"><s:property value="#apiParameter.key" /></label></td>
						<td><s:property value="#apiParameter.description" /></td>
						<td class="icon"><img src="<wp:resourceURL />administration/common/img/icons/<s:property value="#apiParameter.required" />.png" alt="<s:property value="#apiParameter.required" />" /></td>
						<td><wpsf:textfield useTabindexAutoIncrement="true" id="%{#apiParameter.key + '_apiParam'}" name="%{#apiParameter.key + '_apiParam'}" value="%{apiParameterValues[#apiParameter.key]}" cssClass="text" /></td>
						<td><wpsf:checkbox useTabindexAutoIncrement="true" id="freeParameters" name="freeParameters" fieldValue="%{#apiParameter.key}" value="%{freeParameters.contains(#apiParameter.key)}" /> <label for="freeParameters"><s:if test="%{freeParameters.contains(#apiParameter.key)}"><s:text name="label.yes" /></s:if><s:else><s:text name="label.no" /></s:else></label></td>
					</tr>
				</s:iterator>
			</table>
		</fieldset>
		<p class="centerText">
			<wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.save')}" cssClass="button" />
		</p>
	</s:form>
</div>
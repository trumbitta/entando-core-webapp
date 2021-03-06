<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<s:if test="#attribute.required || #attribute.searcheable || #attribute.indexingType != 'NONE' || (#attribute.textAttribute && (#attribute.minLength != -1 || #attribute.maxLength != -1))">
	<span class="monospace js_noscreen">&#32;[</span><span class="attribute-meta-tip monospace">
	<s:if test="#attribute.required"><abbr title="<s:text name="Entity.attribute.flag.mandatory.full"/>"><s:text name="Entity.attribute.flag.mandatory.short"/></abbr><span class="attribute-meta-tip-info"></span> </s:if>
	<s:if test="#attribute.searcheable"><abbr title="<s:text name="Entity.attribute.flag.searcheable.full"/>"><s:text name="Entity.attribute.flag.searcheable.short"/></abbr><span class="attribute-meta-tip-info"></span> </s:if>
	<s:if test="#attribute.indexingType != 'NONE'"><abbr title="<s:text name="Entity.attribute.flag.indexed.full"/>"><s:text name="Entity.attribute.flag.indexed.short"/></abbr><span class="attribute-meta-tip-info"></span> </s:if>
	<s:if test="#attribute.textAttribute">
		<s:if test="#attribute.minLength != -1">&#32;<abbr title="<s:text name="Entity.attribute.flag.minLength.full" />" ><s:text name="Entity.attribute.flag.minLength.short" /></abbr>:<span class="attribute-meta-tip-info"><s:property value="#attribute.minLength" /></span> </s:if>
		<s:if test="#attribute.maxLength != -1">&#32;<abbr title="<s:text name="Entity.attribute.flag.maxLength.full" />" ><s:text name="Entity.attribute.flag.maxLength.short" /></abbr>:<span class="attribute-meta-tip-info"><s:property value="#attribute.maxLength" /></span> </s:if>
	</s:if>
	
	<s:set var="validationRules" value="#attribute.validationRules"></s:set>
	<s:if test="#validationRules != null && #validationRules.ognlValidationRule != null&& #validationRules.ognlValidationRule.expression != null">
		<abbr title="
			<s:if test="#validationRules.ognlValidationRule.helpMessageKey != null">
				<c:set var="labelKey"><s:property value="#validationRules.ognlValidationRule.helpMessageKey" /></c:set>
				<c:set var="langCode"><s:property value="currentLang.code" /></c:set>
				<wp:i18n key="${labelKey}" lang="${langCode}"></wp:i18n>
			</s:if>
			<s:else><s:property value="#validationRules.ognlValidationRule.helpMessage" /></s:else>
					"><s:text name="Entity.attribute.flag.help.short"/></abbr><span class="attribute-meta-tip-info"></span>
	</s:if>
	</span><span class="monospace js_noscreen">]</span></s:if>

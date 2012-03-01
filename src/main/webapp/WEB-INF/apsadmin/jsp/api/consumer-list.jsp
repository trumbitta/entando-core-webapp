<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>
<%@ taglib prefix="wp" uri="/aps-core" %>

<h1><s:text name="title.apiConsumerManagement" /></h1>
<div id="main">
    <s:if test="hasActionMessages()">
        <div class="message message_confirm">
            <h2><s:text name="messages.confirm" /></h2>
            <ul>
                <s:iterator value="actionMessages">
                    <li><s:property escape="false" /></li>
                </s:iterator>
            </ul>
        </div>
    </s:if>
    <s:if test="hasActionErrors()">
        <div class="message message_error">
            <h2><s:text name="message.title.ActionErrors" /></h2>
            <ul>
                <s:iterator value="actionErrors">
                    <li><s:property escape="false" /></li>
                </s:iterator>
            </ul>
        </div>
    </s:if>



<s:form action="search">

<p><label for="insertedKey" class="basic-mint-label label-search"><s:text name="label.search.by"/>&#32;<s:text name="label.consumer.key"/>:</label>
<wpsf:textfield useTabindexAutoIncrement="true" name="insertedKey" id="insertedKey" cssClass="text" /></p>

<p><label for="insertedDescription" class="basic-mint-label label-search"><s:text name="label.search.by"/>&#32;<s:text name="label.consumer.description"/>:</label>
<wpsf:textfield useTabindexAutoIncrement="insertedDescription" name="insertedDescription" id="text" cssClass="text" /></p>


<p>
	<wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.search')}" cssClass="button" />
</p>

</s:form>

<s:form action="search">

<wpsf:hidden name="insertedKey" />
<wpsf:hidden name="insertedDescription" />

<div class="subsection-light">

<wpsa:subset source="searchResult" count="10" objectName="groupSearchResult" advanced="true" offset="5">
<s:set name="group" value="#groupSearchResult" />

<div class="pager">
	<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pagerInfo.jsp" />
	<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
</div>

<table class="generic" summary="<s:text name="note.consumerList.summary" />">
<caption><span><s:text name="title.apiManagement.consumerList" /></span></caption>
<tr>
	<th><s:text name="label.key" /></th>
	<th><s:text name="label.description" /></th>
	<th><s:text name="label.tokens" /></th>
	<th><s:text name="label.expirationDate" /></th>	
	<th class="icon"><abbr title="<s:text name="label.remove" />">&ndash;</abbr></th>	
</tr>
<s:iterator var="consumerKeyVar">
    <s:set var="consumerVar" value="%{getConsumer(#consumerKeyVar)}" />
<tr>
	<td><a href="<s:url action="edit"><s:param name="consumerKey" value="#consumerKeyVar" /></s:url>" title="<s:text name="label.edit" />: <s:property value="#consumerKeyVar" />" ><s:property value="#consumerKeyVar" /></a></td>
	
	<td class="centerText monospace">
		<s:property value="#consumerVar.description" />
	</td>
	<td class="centerText monospace">
		XXXXXXXXXXXXXXXXXxx
	</td>
	<td class="centerText monospace">
		<s:if test="#consumerVar.expirationDate != null">
			<s:date name="#consumerVar.expirationDate" format="dd/MM/yyyy" />
		</s:if>
		<s:else><abbr title="<s:text name="label.none" />">&ndash;</abbr></s:else>
	</td>
	<td class="icon"><a href="<s:url action="trash"><s:param name="consumerKey" value="#consumerKeyVar"/></s:url>" title="<s:text name="label.remove" />: <s:property value="#consumerKeyVar" />"><img src="<wp:resourceURL />administration/common/img/icons/delete.png" alt="<s:text name="label.alt.clear" />" /></a></td>
</tr>
</s:iterator>
</table>

<div class="pager">
	<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
</div>

</wpsa:subset>

</div>

</s:form>

</div>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>

<h1><s:text name="document.title.main" /></h1>

<div id="main">

<s:if test="hasFieldErrors()">
<div class="message message_error">
<h2><s:text name="message.title.FieldErrors" /></h2>	
	<ul>
	<s:iterator value="fieldErrors">
		<s:iterator value="value">
		<li><s:property escape="false" /></li>
		</s:iterator>
	</s:iterator>
	</ul>
</div>
</s:if>

<p class="noscreen"><s:text name="note.jAPS.intro" />.</p>
<p class="noscreen"><s:text name="note.maxiButtons.intro" />:</p>

<s:set var="userConfigVar" value="userConfig" />

<s:iterator var="userShortcutCode" value="#userConfigVar" status="rowstatus">
<s:set var="userShortcut" value="%{getShortcut(#userShortcutCode)}"></s:set>

<dl class="maxiButton" id="fagiano_shortCut_<s:property value="#rowstatus.index"/>">

<s:if test="null != #userShortcut">

<s:set var="userShortcutSectionShortDescr"><s:if test="null != #userShortcut.menuSection.descriptionKey" ><s:text name="%{#userShortcut.menuSection.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.menuSection.description}" /></s:else></s:set>
<s:set var="userShortcutSectionLongDescr"><s:if test="null != #userShortcut.menuSection.longDescriptionKey" ><s:text name="%{#userShortcut.menuSection.longDescriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.menuSection.longDescription}" /></s:else></s:set>

<s:set var="userShortcutShortDescr"><s:if test="null != #userShortcut.descriptionKey" ><s:text name="%{#userShortcut.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.description}" /></s:else></s:set>
<s:set var="userShortcutLongDescr"><s:if test="null != #userShortcut.longDescriptionKey" ><s:text name="%{#userShortcut.longDescriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.longDescription}" /></s:else></s:set>

	<dt class="name <s:property value="#userShortcut.menuSectionCode" />">
		<%-- SCRIVERE TAG PER AGGIUNGERE MAPPA PARAMETRI ALLA URL --%>
		<a class="shortcut-link" 
				href="<s:url action="%{#userShortcut.actionName}" namespace="%{#userShortcut.namespace}"><wpsa:paramMap map="#userShortcut.parameters" /></s:url>" 
				lang="en" title="<s:property value="%{#userShortcutShortDescr}" />">
			<span class="up"><s:property value="%{#userShortcutSectionShortDescr}" /></span>
			<span class="down"><s:property value="%{#userShortcutShortDescr}" /></span>
		</a>
		<span class="shortcut-toolbar">
		<a class="shortcut-clear" title="<s:text name="label.clear" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="removeMyShortcut" namespace="/do/MyShortcut"><s:param name="position" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="4" /></s:url>"><img src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-clear.png" width="19" height="22" alt="<s:text name="label.clear" />" /></a>
		<img src="<wp:resourceURL />administration/common/img/shortcut-pipe.png" width="2" height="22" alt=" " />
		<a rel="shortcut-configure" title="<s:text name="label.configure" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut" anchor="shortcut-configure"><s:param name="position" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="1" /></s:url>"><img src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-configure.png" width="19" height="22" alt="<s:text name="label.set" />" /></a>
		<img src="<wp:resourceURL />administration/common/img/shortcut-pipe.png" width="2" height="22" alt=" " />
		<a title="<s:text name="label.move" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut"><s:param name="positionTarget" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="2" /></s:url>"><img class="move" src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-move.png" width="19" height="22" alt="<s:text name="label.move" />" /></a>
		</span>		
	</dt>
	<dd class="noscreen">
		<p><s:property value="%{#userShortcutLongDescr}" /></p>
	</dd>
</s:if>
<s:else>
	<dt class="name empty">
		<span class="up">&nbsp;</span>
		<span class="down">&nbsp;</span>
		<span class="shortcut-toolbar">
		<a rel="shortcut-configure" title="<s:text name="label.configure" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut" anchor="shortcut-configure"><s:param name="position" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="1" /></s:url>">
			<img src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-configure.png" width="19" height="22" alt="<s:text name="label.set" />" />
		</a>
		<img src="<wp:resourceURL />administration/common/img/shortcut-pipe.png" width="2" height="22" alt=" " />
		<a title="<s:text name="label.move" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut" anchor="shortcut-swap"><s:param name="positionTarget" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="2" /></s:url>"><img class="move" src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-move.png" width="19" height="22" alt="<s:text name="label.move" />" /></a>		
		</span>
	</dt>
	<dd class="noscreen">
		<p>&#32;</p>
	</dd>
</s:else>

</dl>

</s:iterator>

<%-- shortucs available for the current user --%>
<s:set var="allowedShortcutsVar" value="allowedShortcuts" />
<%-- if there are shortcuts and if position not null, so show the configuration form --%>
<s:if test="((null != #allowedShortcutsVar) && (#allowedShortcutsVar.size() > 0) && (null != position)) || #myClient=='advanced'">
	<div class="subsection-light clear" id="shortcut-configure-container">
		<h2 class="margin-bit-bottom" id="shortcut-configure"><s:text name="label.configure" />&#32;<s:text name="name.position" />&#32;<span class="position-name"><s:property value="%{position + 1}" /></span></h2>
		<s:form namespace="/do/MyShortcut" action="joinMyShortcut">
			<p class="noscreen">
				<wpsf:hidden name="position" />
				<wpsf:hidden name="strutsAction" value="1" />
			</p>
			<p>
				<label for="shortcutCode" class="basic-mint-label"><s:text name="label.choose" />:</label>
				
				<select name="shortcutCode" id="shortcutCode" tabindex="<wpsa:counter />" >
				<wpsa:set var="tmpShortcutGroup" value="null" />
				<s:iterator value="allowedShortcutSelectItems" var="allowedShortcutItem">
					<s:if test="null != #tmpShortcutGroup && !#allowedShortcutItem.optgroup.equals(#tmpShortcutGroup)">
					</optgroup>
					</s:if>
					<s:if test="null == #tmpShortcutGroup || !#allowedShortcutItem.optgroup.equals(#tmpShortcutGroup)">
					<optgroup label="<s:property value="#allowedShortcutItem.optgroup" />">
					</s:if>
						<option value="<s:property value="#allowedShortcutItem.key" />"><s:property value="#allowedShortcutItem.value" /></option>
					<wpsa:set var="tmpShortcutGroup"><s:property value="#allowedShortcutItem.optgroup" /></wpsa:set>
				</s:iterator>
				</optgroup>
				</select>
				
				<wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.set')}" cssClass="button" />
			</p>
		</s:form>
	</div>
</s:if>
<%-- else show the swap form --%>
<s:elseif test="null != positionTarget">
	<div class="subsection-light clear" id="shortcut-swap-container">
	<h2 class="margin-bit-bottom" id="shortcut-swap"><s:text name="label.swap" />&#32;<s:text name="name.position" />: <s:property value="%{positionTarget + 1}" /> &ndash; 
	<s:set var="userShortcutToMove" value="%{getShortcut(#userConfigVar[positionTarget])}" />
	<s:if test="null != #userShortcutToMove">
		<s:if test="null != #userShortcutToMove.descriptionKey"><s:text name="%{#userShortcutToMove.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcutToMove.description}" /></s:else>
	</s:if>
	<s:else><s:text name="label.empty.f" /></s:else>
	</h2>
	<s:form namespace="/do/MyShortcut" action="swapMyShortcut">
	<p class="noscreen">
		<wpsf:hidden name="positionTarget" />
		<wpsf:hidden name="strutsAction" value="2" />
	</p>
	
	<p>
	<label for="positionDest" class="basic-mint-label"><s:text name="label.choose" />:</label>
	<select name="positionDest" id="positionDest" tabindex="<wpsa:counter />" >
	<s:iterator var="userShortcutCodeDestVar" value="#userConfigVar" status="rowstatus">
		<s:set var="userShortcut" value="%{getShortcut(#userShortcutCodeDestVar)}"></s:set>
		<s:if test="null != #userShortcut">
			<s:set var="userShortcutShortDestDescr"><s:if test="null != #userShortcut.descriptionKey" ><s:text name="%{#userShortcut.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.description}" /></s:else></s:set>
		</s:if>
		<s:else>
			<s:set var="userShortcutShortDestDescr"><s:text name="label.empty.f" /></s:set>
		</s:else>
		<option value="<s:property value="#rowstatus.index" />"><s:property value="%{#rowstatus.index + 1}" /> &ndash; <s:property value="%{#userShortcutShortDestDescr}" /></option>
	</s:iterator>
	</select>
	
	<wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.set')}" cssClass="button" />
	</p>
	</s:form>
	</div>
</s:elseif>
</div>
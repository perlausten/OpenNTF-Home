<%--

    Copyright (c) 2022-2023 Contributors to the OpenNTF Home App Project

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:projectLayout project="${project}" current="documentation">
	<div class="lefthand-view-layout">
		<t:activityFeed items="${project.documentation}" urlPart="documentation" activeEntry="${doc}" project="${project}"
			titleProperty="description"/>
		<section>
			<c:if test="${not empty doc}">
			<fieldset>
				<legend><c:out value="${doc.description}"/></legend>
				
				<p><c:out value="${temporalBean.formatDate(doc.entryDate)}"/> | <t:personName value="${doc.entryAuthor}"/></p>
				
				<ul>
				<c:forEach items="${doc.downloads}" var="download">
					<li><a href="${download.url}"><c:out value="${download.name}"/></a></li>
				</c:forEach>
				</ul>
			</fieldset>
			</c:if>
		</section>
	</div>
</t:projectLayout>
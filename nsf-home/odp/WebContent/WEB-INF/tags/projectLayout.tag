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
<%@tag description="Project page layout" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@attribute name="project" required="true" type="java.lang.Object" %>
<%@attribute name="current" required="true" type="java.lang.String" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:layout>
	<section class="main-header">
		<h2><c:out value="${pageScope.project.name}"/></h2>
		<h3><c:out value="${pageScope.project.overview}"/></h3>
		
		<div class="info">
			<c:out value="${translation.createdBy}"/>
			<c:forEach items="${pageScope.project.chefs}" var="chef">
				<t:personName value="${chef}"/>
			</c:forEach>
			<span class="created"><time-ago value="${fn:escapeXml(pageScope.project.created)}" /></span>
			|
			<span class="downloads"><c:out value="${messages.format('downloads', pageScope.project.downloads)}"/></span>
		</div>
		
		<nav>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}" class="${pageScope.current == 'summary' ? 'current' : ''}"><c:out value="${translation.projectSummary}"/></a>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}/releases" class="${pageScope.current == 'releases' ? 'current' : ''}"><c:out value="${translation.projectDownloads}"/></a>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}/screenshots" class="${pageScope.current == 'screenshots' ? 'current' : ''}"><c:out value="${translation.projectScreenshots}"/></a>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}/documentation" class="${pageScope.current == 'documentation' ? 'current' : ''}"><c:out value="${translation.projectDocumentation}"/></a>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}/requests" class="${pageScope.current == 'requests' ? 'current' : ''}"><c:out value="${translation.projectRequests}"/></a>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}/defects" class="${pageScope.current == 'defects' ? 'current' : ''}"><c:out value="${translation.projectDefects}"/></a>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}/discussions" class="${pageScope.current == 'discussions' ? 'current' : ''}"><c:out value="${translation.projectDiscussions}"/></a>
			<a href="${mvc.basePath}/projects/${encoder.urlEncode(pageScope.project.name)}/reviews" class="${pageScope.current == 'reviews' ? 'current' : ''}"><c:out value="${translation.projectReviews}"/></a>
			<c:if test="${not empty pageScope.project.sourceControlUrl}">
				<a href="${pageScope.project.sourceControlUrl}"><c:out value="${translation.projectSourceControl}"/></a>
			</c:if>
		</nav>
	</section>
	<section class="main-content">
		<jsp:doBody />
	</section>
</t:layout>
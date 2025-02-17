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
<t:layout>
	<section class="main-header">
		<h2><c:out value="${translation.projectsHeader}"/></h2>
	</section>
	<section class="main-content">
		<h1><c:out value="${translation.projects}"/></h1>
		
		<table class="projects-list">
			<thead>
				<tr class="pager">
					<td>
						<c:if test="${prevPage gt 0}">
							<a href="${mvc.basePath}/projects?page=${prevPage}"><c:out value="${translation.prevPage}"/></a>
						</c:if>
					</td>
					<td></td>
					<td>
						<c:if test="${nextPage gt 0}">
							<a href="${mvc.basePath}/projects?page=${nextPage}"><c:out value="${translation.nextPage}"/></a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>
						<c:choose>
						<c:when test="${sortColumn != 'name'}">
							<a href="${mvc.basePath}/projects?sort=name"><c:out value="${translation.projectName}"/></a>
						</c:when>
						<c:otherwise>
							<c:out value="${translation.projectName}"/>
						</c:otherwise>
						</c:choose>
					</th>
					<th>
						<c:choose>
						<c:when test="${sortColumn != 'updated'}">
							<a href="${mvc.basePath}/projects?sort=updated"><c:out value="${translation.updated}"/></a>
						</c:when>
						<c:otherwise>
							<c:out value="${translation.updated}"/>
						</c:otherwise>
						</c:choose>
					</th>
					<th>
						<c:choose>
						<c:when test="${sortColumn != 'owner'}">
							<a href="${mvc.basePath}/projects?sort=owner"><c:out value="${translation.owner}"/></a>
						</c:when>
						<c:otherwise>
							<c:out value="${translation.owner}"/>
						</c:otherwise>
						</c:choose>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${projectList}" var="project">
					<tr>
						<td class="project-name">
							<a href="${mvc.basePath}/projects/${encoder.urlEncode(project.name)}"><c:out value="${project.name}"/></a>
							<span class="overview"><c:out value="${project.overview}"/></span>
						</td>
						<td class="updated"><time-ago value="${fn:escapeXml(empty project.lastModified ? (empty project.created ? project.docCreated : project.created) : project.lastModified)}" /></td>
						<td><t:personName value="${project.owner}"/></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="pager">
					<td>
						<c:if test="${prevPage gt 0}">
							<a href="${mvc.basePath}/projects?page=${prevPage}"><c:out value="${translation.prevPage}"/></a>
						</c:if>
					</td>
					<td></td>
					<td>
						<c:if test="${nextPage gt 0}">
							<a href="${mvc.basePath}/projects?page=${nextPage}"><c:out value="${translation.nextPage}"/></a>
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
	</section>
</t:layout>
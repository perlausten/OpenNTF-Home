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
	<section class="main-content">
		<div class="home-layout">
			<section id="blog">
				<c:forEach items="${blogEntries}" var="entry">
					<t:blogEntry value="${entry}"/>
				</c:forEach>
			</section>
			<section id="recents">
				<details id="recent-releases" class="activity-feed" open>
					<summary><c:out value="${translation.recentReleases}"/></summary>
					
					<ol>
						<c:forEach items="${recentReleases}" var="release">
							<li>
								<a href="${mvc.basePath}/projects/${encoder.urlEncode(release.projectName)}"><c:out value="${release.projectName}"/></a>
								<span class="release-date"><time-ago value="${fn:escapeXml(release.releaseDate)}" /></span>
							</li>
						</c:forEach>
					</ol>
				</details>
				
				<details id="upcoming-events" class="activity-feed" open>
					<summary><c:out value="${translation.upcomingEvents}"/></summary>
					
					<ol>
						<c:forEach items="${upcomingEvents}" var="event">
							<li>
								<c:out value="${event.name}"/>
								<span class="release-date"><future-time value="${fn:escapeXml(event.scheduledStartTime)}" /></span>
							</li>
						</c:forEach>
					</ol>
				</details>
				
				<details id="recent-ct-posts" class="activity-feed" open>
					<summary><c:out value="${translation.recentCtPosts}"/></summary>
					
					<ol>
						<c:forEach items="${recentCtPosts}" var="post">
							<li>
								<a href="${post.link}" target="_blank"><c:out value="${post.title}"/></a>
								<span class="release-date"><time-ago value="${fn:escapeXml(post.creationDate)}" /></span>
							</li>
						</c:forEach>
					</ol>
				</details>
			</section>
		</div>
	</section>
</t:layout>
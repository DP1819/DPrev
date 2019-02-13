<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>



<%-- TODO (Juan) tengo que mirar como poner la secci�n de pasar de pagina y demas --%>


<security:authorize access="hasAnyRole('HANDYWORKER','CUSTOMER')">
	
	<jstl:out value="${username }"></jstl:out>
	
	<display:table name="endorsements" id="endorsement"
		requestURI="${requestURI}" pagesize="5" class="displaytag">
		
		
		<security:authentication property="principal.username" var="username" />
		<jstl:if test='${endorsement.sender.userAccount.username == username}'>
			<display:column>
				<a href="endorsement/edit.do?endorsementId=${endorsement.id}"> <spring:message
						code="endorsement.edit"></spring:message></a>
			</display:column>
		</jstl:if>

		<spring:message code="endorsement.sender" var="sender"></spring:message>
		<display:column property="sender.name" title="${sender}"
			sortable="true" />

		<spring:message code="endorsement.receiver" var="receiver"></spring:message>
		<display:column property="receiver.name" title="${receiver}"
			sortable="true" />

		<spring:message code="endorsement.moment" var="moment"></spring:message>
		<display:column property="moment" title="${moment}" sortable="true" />

		<spring:message code="endorsement.comments" var="comments"></spring:message>
		<display:column property="comments" title="${comments}"
			sortable="true" />




	</display:table>


</security:authorize>

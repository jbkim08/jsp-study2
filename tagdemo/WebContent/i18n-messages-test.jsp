<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="theLocale" 
value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}"
scope="session" />

<fmt:setLocale value="${theLocale}" />

<fmt:setBundle basename="i18n.resources.mylabels" />

<html>

<body>

<a href="i18n-messages-test.jsp?theLocale=en_US">English (US)</a>
 |
<a href="i18n-messages-test.jsp?theLocale=es_ES">Spanish (ES)</a>
 |
<a href="i18n-messages-test.jsp?theLocale=de_DE">German (DE)</a>
 |
<a href="i18n-messages-test.jsp?theLocale=ko_KR">Korean (KO)</a>
|
<a href="i18n-messages-test.jsp?theLocale=ja_JP">Japan (JA)</a>
 
<hr>

<fmt:message key="label.greeting" /> <br/> <br/>

<fmt:message key="label.firstname" /> <i>John</i> <br/>

<fmt:message key="label.lastname" /> <i>Doe</i> <br/><br/>

<fmt:message key="label.welcome" /> <br/>

<hr>

Selected locale: ${theLocale}

<hr>

<c:set var="now" value="<%=new Date()%>"></c:set>

<fmt:formatDate value="${now}" type="date" dateStyle="full" /> <br>

<fmt:formatDate value="${now}" type="date" dateStyle="short" /> <br>

<fmt:formatDate value="${now}" type="time" /> <br>

<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /> <br>

<fmt:formatDate value="${now}" pattern="z a h:mm" /> <br>


<fmt:formatNumber value="1000.50" type="currency" />
<br/>

<fmt:formatNumber value="1000.50" />

</body>

</html>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<html>

<head><title>Confirmation</title></head>

<body>
<%
	// read form data
	String favLang = request.getParameter("favoriteLanguage");

	//favLang = URLEncoder.encode(favLang, "UTF-8");
	
	// create the cookie
	Cookie theCookie = new Cookie("myApp.favoriteLanguage", favLang);
	
	// set the life span ... total number of seconds (yuk!)
	theCookie.setMaxAge(60*60*24*365);    // <-- for one year
	
	// send cookie to browser
	response.addCookie(theCookie);
%>


	감사합니다! 당신이 선택한 언어는 : ${param.favoriteLanguage} 입니다.
	
	<br/><br/>
	
	<a href="cookies-homepage.jsp">Return to homepage.</a>
	
</body>

</html>









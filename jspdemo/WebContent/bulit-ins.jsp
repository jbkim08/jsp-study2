<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP 내장 객체</h3>
	Request user agent : <%= request.getHeader("User-Agent") %>
	<br><br>
	Request language : <%= request.getLocale() %>
</body>
</html>
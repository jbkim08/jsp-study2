<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head><title>Student Confirmation Title</title></head>

<body>

	Student Full name : ${param.firstName} ${param.lastName} 
	<!-- 화면에 보여주기 위한 방법 -->
	<br><br>
	<%= request.getParameter("firstName") %> <%= request.getParameter("lastName") %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String makeItLower(String data) {
			return data.toLowerCase();
		}
	%>
	"Hello World"를 소문자로 : <%= makeItLower("Hello World") %>
</body>
</html>
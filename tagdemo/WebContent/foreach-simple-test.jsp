<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// 문자열 배열 cities 생성및 초기화
	String[] cities = {"Mumbai", "Singapore", "Philadelphia"};
	//JSP 페이지에 정보를 저장
	pageContext.setAttribute("myCities", cities);
%>

<html>
<body>
	<c:forEach var="tempCity" items="${myCities}">
		
		${tempCity} <br/>
		
	</c:forEach>
</body>
</html>
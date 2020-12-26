<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 메타태그(뷰포트), 부트스트랩 CSS 링크 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<%  
  String userID = null;
  if (session.getAttribute("userID") != null) {
      userID = (String)session.getAttribute("signedUser");
      pageContext.setAttribute("userID", userID);
  } else {
      pageContext.setAttribute("userID", null);
  }
%>
<nav class="navbar navbar-expand-md navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="main.jsp">JSP 게시판</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="main.jsp">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="boardController">게시판</a>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            접속하기
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <c:choose>			
              <c:when test="${userID == null}">
                <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
                <li><a class="dropdown-item" href="join.jsp">가입하기</a></li>
              </c:when>
              <c:otherwise>
				<li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
              </c:otherwise>
            </c:choose>            
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
  <div class="row">
    <div class="col-lg-4 mx-auto">
      <h1>메인화면</h1>
    </div>
  </div>
</div>

	
<!-- 부트스트랩 JS 링크 -->
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
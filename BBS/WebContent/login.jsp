<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<nav class="navbar navbar-expand-md navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="main.jsp">JSP 게시판</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="main.jsp">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bbs.jsp">게시판</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
  <div class="row">
    <div class="col-lg-4 mx-auto">
      <div class="bg-light p-5 mt-5">
        <form action="userController" method="post">
          <h3 class="text-center mb-3">로그인 화면</h3>
          <input type="hidden" name="command" value="LOGIN">
          <input type="text" class="form-control mb-3" name="userID" placeholder="아이디" maxlength="20" required>
          <input type="password" class="form-control mb-3" name="userPassword" placeholder="패스워드" maxlength="20" required>
          <input type="submit" class="btn btn-primary form-control mb-3" value="로그인">         
        </form>
      </div>
    </div>
  </div>
</div>

	
<!-- 부트스트랩 JS 링크 -->
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
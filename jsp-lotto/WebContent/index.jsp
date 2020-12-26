<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <!-- head -->
  <head>
  	<meta charset="UTF-8">
  	<title>Insert title here</title>
  	
  	<!-- bootstrap 4.4 -->
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  </head>
  
  <!-- body -->
  <body>
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="/jsp-lotto">LOTTO</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="01-pick.jsp">번호 뽑기<span class="sr-only">(current)</span></a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="03-my-numbers.jsp">구매 번호들</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="04-winning-number.jsp">당첨 확인</a>
          </li>
        </ul>
      </div>
    </nav>
  	
  	<!-- jumbotron -->
  	<div class="jumbotron">
      <h1>로또 사이트 OPEN!</h1>
      <p>현재 시각 <%= new Date() %> 입니다.</p>
  	</div>
  	
  	<!-- javascript -->
  	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  </body>
	
</html>
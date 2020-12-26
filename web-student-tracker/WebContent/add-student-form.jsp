<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 추가</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css" integrity="sha512-oc9+XSs1H243/FRN9Rw62Fn8EtxjEYWHXRvjS43YtueEewbS6ObfXcJNyohjHqVKFPoXXUxwc+q1K7Dee6vv9g==" crossorigin="anonymous" />

<body>

	<div class="container">
		<h1 class="text-success py-1">504 학생 리스트</h1>
		
		<h3 class="my-3">학생 추가하기</h3>
		<!-- 입력 폼  -->
		<form action="StudentControllerServlet" method="GET">
			<input type="hidden" name="command" value="ADD">
			<div class="row">
				<div class="col-3 form-group">
					<label for="first-name">First Name</label>
					<input name="first-name" type="text" class="form-control form-control-lg" id="first-name" placeholder="성을 입력해주세요">
				</div>
				<div class="col-4 form-group">
					<label for="last-name">Last Name</label>
					<input name="last-name" type="text" class="form-control form-control-lg" id="last-name" placeholder="이름을 입력해주세요">
				</div>
			</div>
			<div class="row">
				<div class="col-7 form-group">
					<label for="email">Email</label>
					<input name="email" type="email" class="form-control form-control-lg" id="email" placeholder="이메일 주소를 입력해 주세요">
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-lg m-2">추가 하기</button>
			<button type="reset" class="btn btn-danger btn-lg m-2">취소 하기</button>
			<a class="btn btn-success btn-lg m-2" href="StudentControllerServlet">돌아 가기</a>
		</form>
		
	</div>		
</body>
</html>
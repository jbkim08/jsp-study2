<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Tracker App</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css" integrity="sha512-oc9+XSs1H243/FRN9Rw62Fn8EtxjEYWHXRvjS43YtueEewbS6ObfXcJNyohjHqVKFPoXXUxwc+q1K7Dee6vv9g==" crossorigin="anonymous" />

<body>

	<div class="container">
		<h1 class="text-success py-1">504 학생 리스트</h1>
		<button class="btn btn-outline-primary mb-2" 
			onclick="window.location.href='add-student-form.jsp'">학생 추가</button>		
		<table class="table table-striped">
	
			<tr class="bg-info text-light">
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<c:forEach var="tempStudent" items="${STUDENT_LIST}">	
				<!-- 각각의 학생마다 update링크와 파라메터 설정 -->
				<c:url var="updateLink" value="StudentControllerServlet">
					<c:param name="command" value="LOAD"></c:param>
					<c:param name="studentId" value="${tempStudent.id}"></c:param>
				</c:url>	
				
				<!-- 각각의 학생마다 delete링크와 파라메터 설정 -->
				<c:url var="deleteLink" value="StudentControllerServlet">
					<c:param name="command" value="DELETE"></c:param>
					<c:param name="studentId" value="${tempStudent.id}"></c:param>
				</c:url>	
																							
				<tr>
					<td> ${tempStudent.firstName} </td>
					<td> ${tempStudent.lastName} </td>
					<td> ${tempStudent.email}  </td>
					<td>
						<a class="btn btn-outline-secondary" href="${updateLink}">Update</a>
						<a class="btn btn-outline-danger ml-3" href="${deleteLink}" 
							onclick="if(!(confirm('정말로 삭제할까요?'))) return false">Delete</a>
					</td>
				</tr>			
			</c:forEach>

		</table>
	</div>		
</body>
</html>
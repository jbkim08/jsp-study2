<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
      <% String userID=null; if (session.getAttribute("userID") !=null) {
        userID=(String)session.getAttribute("signedUser"); pageContext.setAttribute("userID", userID); } else {
        pageContext.setAttribute("userID", null); } %>
        <nav class="navbar navbar-expand-md navbar-light bg-light">
          <div class="container-fluid">
            <a class="navbar-brand" href="main.jsp">JSP 게시판</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="main.jsp">메인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="boardController">게시판</a>
                </li>
              </ul>
              <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                    data-bs-toggle="dropdown" aria-expanded="false">
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
        <div class="container-fluid">
          <div class="row mt-5">
            <div class="col-lg-8 mx-auto">
              <table class="table table-striped text-center">
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="board" items="${boardList}">
                    <tr>
                      <th>${board.boardID}</th>
                      <td>${board.boardTitle}</td>
                      <td>${board.userID}</td>
                      <td>
                        <script>document.write('${board.writeTime}'.substring(0, 11))</script>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <div id="page-selection">
                <!-- Pagination goes here -->
              </div>
              <div class="row justify-content-end">
                <div class="col-4">
                  <a href="#" class="btn btn-primary d-block" data-bs-toggle="modal" data-bs-target="#writeModal">
                    글쓰기
                  </a>
                </div>
              </div>
            </div> <!-- col 끝 -->
          </div> <!-- row 끝 -->
        </div>
        <!-- 글쓰기 MODAL -->
        <div class="modal fade" id="writeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
          aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">게시판 글쓰기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form id="addModal" action="boardController" method="POST" class="d-grid gap-2">
                  <input type="hidden" name="command" value="INSERT">
                  <input type="hidden" name="userID" value="${userID}">
                  <label for="title">제목</label>
                  <input type="text" id="title" name="boardTitle" class="form-control" />
                  <label for="content">내용</label>
                  <textarea name="boardContent" id="content" class="form-control" rows="10"></textarea>
                  <input type="submit" onclick="insert()" class="btn btn-primary" />
                </form>
              </div>
            </div>
          </div>
        </div>

        <!-- 부트스트랩 JS 링크 -->
        <script src="js/jquery-3.5.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery.bootpag.min.js"></script>
        <script>
          function insert() {
            var addModalForm = document.getElementById('addModal');
            addModalForm.submit();
          }
          function timeFormat(str) {
            return str.substring(0, 11)
          }
          $('#page-selection').bootpag({
            total: ${ totalPages },
            page: ${ currPage },
            maxVisible: 5
          }).on('page', function (event, num) {
              location.href = "boardController?page=" + num;
            });

        </script>
    </body>

    </html>
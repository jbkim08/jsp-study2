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
      <h1>로또 번호를 고르세요!</h1>
      <hr />
      <p>1 부터 45 사이의 숫자 중, 6개의 번호를 선택! 총 5번의 기회!</p>
  	</div>
    
    <!-- form -->
    <div class="container">
      <form action="02-buy-process.jsp" method="post">
        <!-- table -->
        <table class="table">
          <thead>
            <tr>
              <th>번호 입력</th>
              <th>액션</th>
            </tr>
          </thead>
          <tbody>
            <% for(int i = 0; i < 5; i++) { %>
            <tr id="<%= i %>">
                <td>
                  <input type="text" class="form-control" name="numbers" />
                </td>
                <td>
                  <button class="btn btn-warning random-action" type="button">랜덤</button>
                  <button class="btn btn-info lock-action" type="button">잠금</button>
                  <button class="btn btn-light reset-action" type="button">초기화</button>
                </td>
            </tr>
            <% } %>
          </tbody>
        </table>
        
        <!-- submit button -->
        <button class="btn btn-primary btn-block" type="submit">구매하기</button>
      </form>
    </div>
    
  	
  	<!-- JS -->
  	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <!-- jQuery 이벤트 처리 -->
    <script>
      function shuffle(arr) {
        var j, x, i;
        for (i = arr.length - 1; i > 0; i--) {
          j = Math.floor(Math.random() * (i + 1));
          x = arr[i];
          arr[i] = arr[j];
          arr[j] = x;
        }
        return arr;
      }
      
      function lotto_num() {
        let numbers = [];
        
        for (var i = 0; i < 45; i++) {
          numbers[i] = i + 1;
        }
        numbers = shuffle(numbers);
        
        return new Array(numbers[0], numbers[1], numbers[2], numbers[3], numbers[4], numbers[5]);
      }
      
      // 랜덤 버튼 클릭 => 난수 생성!
      $('.random-action').click(function() {
        // 클릭된 버튼의 tr 선택 => 자식 중 input을 찾음 => 값 변경!
        $(this).closest('tr').find(':input[type=text]').val(lotto_num().toString());
      });
    
      // 저장 버튼 클릭 => 입력 불가!
      $('.lock-action').click(function() {
      // 클릭된 버튼의 tr 선택 => 자식 중 input을 찾음 => disabled 속성 추가!
        $(this).closest('tr').find(':input[type=text]').attr('disabled', true);
      });
    
      // 초기화 버튼 클릭 => 입력 창 리셋!
      $('.reset-action').click(function() {
        var input = $(this).closest('tr').find(':input[type=text]');
        input.attr('disabled', false);
        input.val("");
      });
    </script>
  </body>
	
</html>
<%@page import="com.lotto.service.LottoServiceImpl"%>
<%@ page import="com.lotto.service.LottoService" %>
<%@ page import="com.lotto.vo.LottoVO" %>
<%@ page import="com.lotto.dao.LottoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  // 서비스 객체 생성!
  LottoService lottoService = new LottoServiceImpl();
  
  // 사용자가 로또 번호를 구매!
  String[] params = request.getParameterValues("numbers");

  for (int i = 0; i < params.length; i++) {
    LottoVO input = new LottoVO(params[i]);
    lottoService.buy(input);
  }
  
  // 구매 내역으로 이동!
  response.sendRedirect("03-my-numbers.jsp");
%>
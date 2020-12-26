package com.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// datasource 커넥션 풀 선언
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. printwrite 객체 생성
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		// 2. db 연결
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = dataSource.getConnection();
		// 3. sql 작성
			String sql = "select * from student";
			myStmt = myConn.createStatement();
		// 4. sql 실행
			myRs = myStmt.executeQuery(sql);
		// 5. result set 실행
			while(myRs.next()) {
				String email = myRs.getString("email");
				out.println(email);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}

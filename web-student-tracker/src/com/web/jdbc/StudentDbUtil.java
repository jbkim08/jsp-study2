package com.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDbUtil {

	private DataSource dataSource;
	
	public StudentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Student> getStudents() throws Exception {
		
		List<Student> students = new ArrayList<Student>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = dataSource.getConnection();
		// 1. sql 작성
			String sql = "select * from student order by id";
			myStmt = myConn.createStatement();
		// 2. sql 실행
			myRs = myStmt.executeQuery(sql);
		// 3. result set 실행
			while(myRs.next()) {				
				int id = myRs.getInt("id");				
				String first_name = myRs.getString("first_name");
				String last_name = myRs.getString("last_name");
				String email = myRs.getString("email");
				
				Student tempStudent = new Student(id, first_name, last_name, email);			
				students.add(tempStudent);
			}
			return students;
		}
		finally {
			//close
			close(myConn, myStmt, myRs);
		}

	}

	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if(myRs != null) {
				myRs.close();
			}
			if(myStmt != null) {
				myStmt.close();
			}
			if(myConn != null) {
				myConn.close(); //실제로는 Connection Pool로 되돌아감
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	}

	public void addStudent(Student theStudent) throws Exception {
		
		Connection myConn = null;
		PreparedStatement myPstmt = null;
		
		try {
			// 0. DB 연결
			myConn = dataSource.getConnection();
			
			// 1. 파라메터가 들어가는 sql문 작성 (?)
			String sql = "insert into student "
					   + "(first_name, last_name, email) "
					   + "values (?, ?, ?)";
			
			myPstmt = myConn.prepareStatement(sql);
			
			// 2. 파라메터 정의
			myPstmt.setString(1, theStudent.getFirstName());
			myPstmt.setString(2, theStudent.getLastName());
			myPstmt.setString(3, theStudent.getEmail());
		
			// 3. Pstmt 실행
			myPstmt.execute();

		}
		finally {
			//close
			close(myConn, myPstmt, null);
		}
		
	}

	public Student getStudent(String theStudentId) throws Exception {
		
		Student theStudent = null;
		int studentId;
		
		Connection myConn = null;
		PreparedStatement myPstmt = null;
		ResultSet myRs = null;
		
		try {
			// student id 값 int로 변경
			studentId = Integer.parseInt(theStudentId);			
			// 0. DB 연결
			myConn = dataSource.getConnection();
			// 1. 파라메터가 들어가는 sql문 작성 (?)
			String sql = "select * from student where id=?";
			myPstmt = myConn.prepareStatement(sql);
			// 2. 파라메터 정의
			myPstmt.setInt(1, studentId);
			// 3. Pstmt 실행하여 결과(ResultSet)를 myRs에 저장
			myRs = myPstmt.executeQuery();
			// 4. result set 행으로 부터 데이터 얻어오기
			if(myRs.next()) {							
				String first_name = myRs.getString("first_name");
				String last_name = myRs.getString("last_name");
				String email = myRs.getString("email");
				
				theStudent = new Student(studentId, first_name, last_name, email);
			}
			else {
				throw new Exception("id를 찾을 수 없습니다. id"+ studentId);
			}
			
			
			return theStudent;
		}
		finally {
			//close
			close(myConn, myPstmt, myRs);
		}
	}

	public void updateStudent(Student theStudent) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myPstmt = null;
		
		try {
			// 0. DB 연결
			myConn = dataSource.getConnection();
			
			// 1. 파라메터가 들어가는 sql문 작성 (?)
			String sql = "update student "
					   + "set first_name=?, last_name=?, email=? "
					   + "where id=?";
			
			myPstmt = myConn.prepareStatement(sql);
			
			// 2. 파라메터 정의
			myPstmt.setString(1, theStudent.getFirstName());
			myPstmt.setString(2, theStudent.getLastName());
			myPstmt.setString(3, theStudent.getEmail());
			myPstmt.setInt(4, theStudent.getId());
			
			// 3. Pstmt 실행
			myPstmt.execute();

		}
		finally {
			//close
			close(myConn, myPstmt, null);
		}		
		
	}

	public void deleteStudent(String theStudentId) throws Exception {
		
		Connection myConn = null;
		PreparedStatement myPstmt = null;
		int studentId;
		
		try {
			// student id 값 int로 변경
			studentId = Integer.parseInt(theStudentId);	
			
			// 0. DB 연결
			myConn = dataSource.getConnection();
			
			// 1. 파라메터가 들어가는 sql문 작성 (?)
			String sql = "delete from student where id=?";
			
			myPstmt = myConn.prepareStatement(sql);
			
			// 2. 파라메터 정의
			myPstmt.setInt(1, studentId);
		
			// 3. Pstmt 실행
			myPstmt.execute();

		}
		finally {
			//close
			close(myConn, myPstmt, null);
		}
				
		
	}
}

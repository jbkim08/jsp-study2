package com.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentDbUtil studentDbUtil;
	
	// datasource 커넥션 풀 선언
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
		
	@Override
	public void init() throws ServletException {
		super.init();
		
		// studentDbUtil 생성
		try {
			studentDbUtil = new StudentDbUtil(dataSource);
		}
		catch (Exception e) {
			throw new ServletException(e); //브라우저에서 볼수있도록 넘긴다.
		}
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// 명령어 읽어오기
			String theCommand = request.getParameter("command");
			// 명령어가 없을경우에 "LIST"로 설정(디폴트값)
			if(theCommand == null) {
				theCommand = "LIST";
			}
			// 명령어에 맞게 Switch 문
			switch (theCommand) {
			case "LIST":
				listStudents(request, response);
				break;
				
			case "ADD":
				addStudents(request, response);
				break;
				
			case "LOAD":
				loadStudents(request, response);
				break;
				
			case "UPDATE":
				updateStudents(request, response);
				break;
			
			case "DELETE":
				deleteStudents(request, response);
				break;
				
			default:
				// 학생 리스트 메소드 - MVC 구조로 만들기
				listStudents(request, response);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}		
	}


	private void deleteStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// id 읽어오기
		String theStudentId = request.getParameter("studentId");
		// DbUtil에서  삭제
		studentDbUtil.deleteStudent(theStudentId);
		// list-students 보이기
		listStudents(request, response);	
	}


	private void updateStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// update 폼에서 수정된 데이터 읽어오기
		int id = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String email = request.getParameter("email");
		
		// 새 학생 객체 생성 (id 포함 주의)
		Student theStudent = new Student(id, firstName, lastName, email);
		
		// DB에 update => 
		studentDbUtil.updateStudent(theStudent);
		
		// update 내용이 새로 적용된 JSP 페이지 보여주기
		listStudents(request, response);		
	}


	private void loadStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// id 읽기
		String theStudentId = request.getParameter("studentId");
		
		// DB에서 학생 데이터 가져오기
		Student theStudent = studentDbUtil.getStudent(theStudentId);
		
		// request Attribute에 학생 데이터를 추가한다.
		request.setAttribute("THE_STUDENT", theStudent);
		
		// 학생 정보를 수정할 jps 페이지로 보낸다.
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);
	}


	private void addStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 폼(Form)에서 입력된 학생 데이터를 읽어오기
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String email = request.getParameter("email");
		
		// 새로운 학생 객체 생성
		Student theStudent = new Student(firstName, lastName, email);
		
		// DB에 입력
		studentDbUtil.addStudent(theStudent);

		// 새로은 학생 리스트를 다시 화면에 보여주기
		listStudents(request, response);
		
	}


	private void listStudents(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		//1. 학생 데이터를 studentDbUtil 에서 가져온다.
		List<Student> students = studentDbUtil.getStudents();
		
		//2. request 에 학생 데이터를 추가한다.
		request.setAttribute("STUDENT_LIST", students);
		
		//3. JSP 페이지로 보낸다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
		
	}

}

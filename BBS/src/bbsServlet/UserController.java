package bbsServlet;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import user.User;
import user.UserDao;


@WebServlet("/userController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDao userDao;
	
	//커넥션 풀
	@Resource(name="jdbc/bbs")
	private DataSource dataSource;
       
	@Override
	public void init() throws ServletException {
		super.init();
		userDao = new UserDao(dataSource);	
	}
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//response.sendRedirect("/BBS/main.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main.jsp");
		dispatcher.forward(request, response);
	}



	//login.jsp의 로그인 폼에서 유저아이디 비번 입력하면 DB에서 조회하여 결과값과 loginAction.jsp로 이동
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("UTF-8");
			// 명령어 읽어오기
			String theCommand = request.getParameter("command");
			// 명령어가 없을경우에 종료(return)
			if(theCommand == null) {
				return;
			}
			// 명령어에 맞게 Switch 문
			switch (theCommand) {

			case "LOGIN":
				userLogin(request, response);
				break;
				
			case "JOIN":
				userJoin(request, response);
				break;					
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}		

	}
	
	private void userJoin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 가입하기 창의 모든 input 의 내용을 가져와서 use객체를 만듬
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		
		User user = new User(userID, userPassword, userName, userGender, userEmail);
		
		// 유저Dao에서 새 유저  INSERT
		int result = userDao.join(user);
		// 유효한 id를 세션에 저장 (가입햇으므로 id정보를 세션에 저장하여 로그인 상태)
		if(result>=0) {
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
		}
		
		String page = null;	
		String message = null;
		// 결과가 0이상이면 DB에 입력완료, 음수이면 SQL에러 등.
		if(result>=0) {
			message = "가입 성공"; page = "/main.jsp";
		} else {
			message = "아이디 중복"; page = "/error.jsp";
		}
		
		// 뷰(jsp)에 보낼 데이터 저장
		request.setAttribute("msg", message);
		// 리퀘스트 디스패쳐 생성(jsp 이름)
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		// jsp 불러오기
		dispatcher.forward(request, response);
	}

	private void userLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 아이디 , 비번 읽어오기
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		// 유저Dao 에서 아이디 비번의 유효성을 체크
		int result = userDao.login(userID, userPassword);
		// 로그인 성공시 세션에 id저장 : id가 있으면 로그인 된 사용자 확인가능
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
		}
		
		String page = null;	
		String message = null;
		//1:로그인 성공, 0:비번 불일치, -1:아이디 없음, -2: DB에러
		switch(result) {
			case 1 : message = "로그인 성공"; page = "/main.jsp"; break;
			case 0 : message = "비밀번호 불일치"; page = "/error.jsp"; break;
			case -1 : message = "아이디가 없습니다."; page = "/error.jsp"; break;
			case -2 : 
			default : message = "DB 에러 입니다."; page = "/error.jsp"; break;	
		}
		// 뷰(jsp)에 보낼 데이터 저장
		request.setAttribute("msg", message);
		// 리퀘스트 디스패쳐 생성(jsp 이름)
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(page);
		// jsp 불러오기
		dispatcher.forward(request, response);

	}


}

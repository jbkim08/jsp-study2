package bbsServlet;

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

import board.Board;
import board.BoardDao;


@WebServlet("/boardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardDao boardDao;
	
	//커넥션 풀
	@Resource(name="jdbc/bbs")
	private DataSource dataSource;
       
	@Override
	public void init() throws ServletException {
		super.init();
		boardDao = new BoardDao(dataSource);	
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("UTF-8");
			// 명령어 읽어오기
			String theCommand = request.getParameter("command");
			// 명령어가 없을경우에 Main 페이지로(디폴트값)
			if(theCommand == null) {
				theCommand = "LIST";
			}
			// 명령어에 맞게 Switch 문
			switch (theCommand) {
			
			case "LIST":
				boardList(request, response);
				break;
				
			case "INSERT":
				boardInsert(request, response);
				break;
				
//			case "JOIN":
//				userJoin(request, response);
//				break;					
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}


	private void boardInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력창 의 모든 input 의 내용을 가져와서 board객체를 만듬
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String userID = request.getParameter("userID");
		if (userID == "") userID = "GEUST";
		
		int result = boardDao.insert(boardTitle, boardContent, userID);
		
		// 결과가 0이상이면 DB에 입력완료, 음수이면 SQL에러 등.
		if(result>=0) {
			//결과 화면 보이기
			boardList(request, response);
			
		} else {
			request.setAttribute("msg", "입력 에러!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
		}
	}

	// DB에 저장된 게시판 내용들을 리스트에 담아서 가져와 jsp 페이지에 표시한다.
	private void boardList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String boardTitle = request.getParameter("boardTitle");
		List<Board> list = boardDao.getBoardList();
				
		// 뷰(jsp)에 보낼 데이터 저장
		request.setAttribute("boardList", list);
		// 리퀘스트 디스패쳐 생성(jsp 이름)
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/bbs.jsp");
		//jsp 불러오기
		dispatcher.forward(request, response);
		
	}

}

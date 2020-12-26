package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class BoardDao {

	private DataSource dataSource; 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDao(DataSource dataSource) {
		this.dataSource = dataSource;  //서블릿에서 커넥션 풀 사용하여 객체 생성
	}
	
	public List<Board> getBoardList() {
		List<Board> list = new ArrayList<Board>();

		Board board;
		try{	
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("SELECT boardID,boardTitle,userID,writeTime FROM board");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new Board();
				board.setBoardID(rs.getInt("boardID"));
				board.setBoardTitle(rs.getString("boardTitle"));
				board.setUserID(rs.getString("userID"));
				board.setWriteTime(rs.getString("writeTime"));
			
				list.add(board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();	
		} finally {
			closeAll();
		}	
		
		return list;
	}
	
	
	
	public int insert(String boardTitle, String boardContent, String userID) {
		
		try{	
			conn = dataSource.getConnection();
			String sql = "INSERT INTO board(boardTitle, boardContent, userID, writeTime, isAvailable)"
					 + "VALUES(?, ?, ?, now() , True )";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,boardTitle);
			pstmt.setString(2,boardContent);
			pstmt.setString(3,userID);
		
			return pstmt.executeUpdate(); //업데이트후 입력,수정,삭제한 열의 수를 리턴또는 0 

		} catch (SQLException e) {
			e.printStackTrace();
			return -1;			//SQL 에러 
			
		} finally {
			closeAll();
		}			
	}

	private void closeAll() {	
		try {
			if(rs != null) 	  rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null)  conn.close(); //실제로는 Connection Pool로 되돌아감				
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
}
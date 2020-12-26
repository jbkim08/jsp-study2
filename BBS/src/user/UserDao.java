package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.sql.DataSource;

public class UserDao {

	private DataSource dataSource;  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDao(DataSource dataSource) {
		this.dataSource = dataSource;  //서블릿에서 커넥션 풀 사용하여 객체 생성
	}
	
	public int login(String userID, String userPassword) {

		try{	
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM user WHERE userID=?");
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("userPassword").equals(userPassword)) 
					return 1; //로그인 성공
				else 
					return 0; //비밀번호 불일치
			}
			return -1; 		  //아이디 없음
			
		} catch (SQLException e) {
			e.printStackTrace();
			return -2;			//DB 에러
			
		} finally {
			closeAll();
		}	
	}
	
	
	public int join(User user) {
		
		try{	
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("INSERT INTO user VALUES(?,?,?,?,?)");
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			
			return pstmt.executeUpdate(); //업데이트후 입력,수정,삭제한 열의 수를 리턴또는 0 

		} catch (SQLException e) {
			e.printStackTrace();
			return -2;			//SQL 에러 (아이디 중복)
			
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

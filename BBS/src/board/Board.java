package board;

public class Board {
	private int boardID;
	private String boardTitle;
	private String boardContent;
	private String userID;
	private String writeTime;
	private boolean isAvailable;
	
	public Board() {}
	
	public Board(int boardID, String boardTitle, String boardContent, String userID, String writeTime,
			boolean isAvailable) {
		this.boardID = boardID;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userID = userID;
		this.writeTime = writeTime;
		this.isAvailable = isAvailable;
	}

	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	
	
}

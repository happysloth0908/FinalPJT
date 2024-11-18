package com.ssafy.soda.model.dto;

public class Board {
	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private String regDate;
	private int viewCnt;
	private String category;
	private int userNo;

	///// --- 유저와 보드 연결 소운 실험 코드------------
	private User user;
	private Likes likes;
	private BoardReport boardReport;
	
	
	
	
	public BoardReport getBoardReport() {
		if (boardReport != null) {
			return boardReport;
		} else {
			return null;
		}
	}

	
	public Likes getLikes() {
		if (likes != null) {
			return likes;
		} else {
			return null;
		}
	}
	
	public Board(User user) {
		this.user = user;
	}

	public Board(User user, Likes likes) {
		this.user = user;
		this.likes = likes;
	}
	

	public User getUser() {
		if (user != null) {
			return user;
		} else {
			return null;
		}
	}

	// 유저 번호를 불러올 수 있도록 함.
	public Integer getUserNo() {
		// 유저가 삭제된 경우 null 이 뜰 수도 있음
		if (user != null) {
			return userNo;
		} else {
			return null;
		}
	}

	// 유저 아이디 가져오기
	public String getUserId() {
		// 유저가 삭제된 경우 null 이 뜰 수도 있음
		if (user != null) {
			return user.getUserId();
		} else {
			return null;
		}
	}
	//////// -----------------------------------

	public Board() {
	}
	
	public Board(int boardNo, String title, String writer, String content, String regDate, int viewCnt, String category,
			int userNo, User user, Likes likes) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
		this.category = category;
		this.userNo = userNo;
		this.user = user;
		this.likes = likes;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setLikes(Likes likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", category=" + category + ", userNo=" + userNo
				+ ", user=" + user + ", likes=" + likes + "]";
	}

	
	



}
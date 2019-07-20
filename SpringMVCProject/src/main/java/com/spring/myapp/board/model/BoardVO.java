package com.spring.myapp.board.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	//사용할 DATABASE TABLE 컬럼과 1:1로 매핑되는
	//필드들을 캡슐화를 통해 프로퍼티화 시킨다.
	private int boardNo;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	private boolean newMark;
	private int replyCnt;

	
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + "]";
	}
	
	

}







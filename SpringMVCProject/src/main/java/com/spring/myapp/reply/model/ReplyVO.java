package com.spring.myapp.reply.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int replyNo;
	private int boardNo;
	private String replyText;
	private String replyWriter;
	private Date regDate;
	private Date updateDate;
	
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", boardNo=" + boardNo + ", replyText=" + replyText + ", replyWriter="
				+ replyWriter + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}
	
	

}

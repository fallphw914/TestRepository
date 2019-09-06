package com.hwaboon.myapp.reply.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int replyNo;
	private int reviewNo;
	private String replyText;
	private String replyWriter;
	private Date regDate;
	private Date updateDate;

}


package com.hwaboon.myapp.review.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int reviewNo;
	private int viewCnt;
	private int likeCnt;
	private String title;
	private String writer;
	private String content;
	private Date regDate ;
	
}

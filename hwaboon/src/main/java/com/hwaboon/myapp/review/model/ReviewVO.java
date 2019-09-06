package com.hwaboon.myapp.review.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int reviewNo;
	private int viewCnt;
	private int likeCnt;
	private int replyCnt;
	private String title;
	private String writer;
	private String content;
	private Date regDate ;
	private MultipartFile file;

	private int fileId;
	private String fileName;
	private long fileSize;
	private String fileContentType;

	
}

package com.hwaboon.myapp.review.service;

import java.util.List;

import com.hwaboon.myapp.review.model.ReviewVO;

public interface IReviewService {
	
	ReviewVO getArticle(int reviewNo) throws Exception;
	List<ReviewVO> getAllArticles() throws Exception;
	
	void insert(ReviewVO article) throws Exception;
	void update(ReviewVO article) throws Exception;
	void delete(int reviewNo) throws Exception;


}

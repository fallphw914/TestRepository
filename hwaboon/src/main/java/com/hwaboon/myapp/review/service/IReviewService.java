package com.hwaboon.myapp.review.service;

import java.util.List;

import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.paging.Criteria;
import com.hwaboon.myapp.review.paging.SearchCriteria;

public interface IReviewService {
	
	ReviewVO getArticle(int reviewNo,boolean trigger) throws Exception;
	List<ReviewVO> getAllArticles() throws Exception;
	
	List<ReviewVO> listPaging(Criteria cri) throws Exception;
	int countArticles () throws Exception;
	
	//검색 동적 SQL처리
    List<ReviewVO> listSearch(SearchCriteria cri) throws Exception;
    int countSearchArticles(SearchCriteria cri) throws Exception;
	
	void insert(ReviewVO article) throws Exception;
	void update(ReviewVO article) throws Exception;
	void delete(int reviewNo) throws Exception;
	
	


}

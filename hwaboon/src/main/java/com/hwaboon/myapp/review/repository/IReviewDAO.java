package com.hwaboon.myapp.review.repository;

import java.util.List;

import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.paging.Criteria;

public interface IReviewDAO {
	
	ReviewVO getArticle(int reviewNo) throws Exception;
	List<ReviewVO> getAllArticles() throws Exception;
	List<ReviewVO> listPaging(Criteria cri) throws Exception;
	int countArticles () throws Exception;
	
	void insert(ReviewVO article) throws Exception;
	void update(ReviewVO article) throws Exception;
	void delete(int reviewNo) throws Exception;

}

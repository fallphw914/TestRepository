package com.hwaboon.myapp.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.repository.IReviewDAO;

@Service
public class ReviewService implements IReviewService {
	
	@Autowired
	public IReviewDAO dao;
	
	@Override
	public ReviewVO getArticle(int reviewNo) throws Exception {
		
		return dao.getArticle(reviewNo);
	}

	@Override
	public List<ReviewVO> getAllArticles() throws Exception {
		
		return dao.getAllArticles();
	}

	@Override
	public void insert(ReviewVO article) throws Exception {
		dao.insert(article);
		
	}

	@Override
	public void update(ReviewVO article) throws Exception {
		dao.update(article);
		
	}

	@Override
	public void delete(int reviewNo) throws Exception {
		dao.delete(reviewNo);
		
	}

}

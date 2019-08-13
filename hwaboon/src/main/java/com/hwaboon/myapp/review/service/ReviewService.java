package com.hwaboon.myapp.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwaboon.myapp.review.model.ReviewBoardUploadFileVO;
import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.paging.Criteria;
import com.hwaboon.myapp.review.paging.SearchCriteria;
import com.hwaboon.myapp.review.repository.IReviewDAO;

@Service
public class ReviewService implements IReviewService {
	
	@Autowired
	public IReviewDAO dao;
	
	/*
	 * @Transactional
	 * 
	 * @Override public ReviewVO getArticle(int reviewNo,boolean trigger) throws
	 * Exception {
	 * 
	 * ReviewVO article = dao.getArticle(reviewNo);
	 * 
	 * if(trigger) { String content = article.getContent() .replace("\n", "<br>")
	 * .replace("\u0020", "&nbsp;"); article.setContent(content); }
	 * 
	 * dao.updateViewCnt(reviewNo);
	 * 
	 * return article; }
	 */

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

	@Transactional
	@Override
	public void delete(int reviewNo) throws Exception {
		dao.deleteAll(reviewNo);
		dao.delete(reviewNo);
	}

	@Override
	public List<ReviewVO> listPaging(Criteria cri) throws Exception {
		
		return dao.listPaging(cri);
	}

	@Override
	public int countArticles() throws Exception {
		
		return dao.countArticles();
	}

	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int countSearchArticles(SearchCriteria cri) throws Exception {
		
		return dao.countSearchArticles(cri);
	}
	
	@Transactional
	@Override
	public void insertArticle(ReviewVO article, ReviewBoardUploadFileVO file) throws Exception {
		
		dao.insert(article);
		
		if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
			article.setReviewNo(dao.selectMaxArticleNo());
			file.setReviewNo(article.getReviewNo());
						
			dao.insertFileData(file);
		}
		
	}
	
	@Transactional
	@Override
	public ReviewVO selectArticle(int reviewNo, boolean trigger) throws Exception {
		
		ReviewVO article = dao.selectArticle(reviewNo);
		
		if(trigger) {
			String content = article.getContent()
									.replace("\n", "<br>")
									.replace("\u0020", "&nbsp;");
			article.setContent(content);
		}
		
		dao.updateViewCnt(reviewNo);
	
		
		
		return article;
	}
	
	
	@Override
	public List<ReviewVO> selectArticleList(SearchCriteria cri) throws Exception {
		
		return dao.selectArticleList(cri);
		
	}

	
	@Override
	public ReviewBoardUploadFileVO getFile(int fileId) throws Exception {
		
		ReviewBoardUploadFileVO file = dao.getFile(fileId);
		
        
		return file	;
		
	}

	

}

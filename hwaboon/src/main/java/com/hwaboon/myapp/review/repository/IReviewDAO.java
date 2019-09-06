package com.hwaboon.myapp.review.repository;

import java.util.List;

import com.hwaboon.myapp.review.model.ReviewBoardUploadFileVO;
import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.paging.Criteria;
import com.hwaboon.myapp.review.paging.SearchCriteria;



public interface IReviewDAO {
	
	ReviewVO getArticle(int reviewNo) throws Exception;
	List<ReviewVO> getAllArticles() throws Exception;
	
	List<ReviewVO> listPaging(Criteria cri) throws Exception;
	int countArticles () throws Exception;
	
	 //검색 동적 SQL처리
    List<ReviewVO> listSearch(SearchCriteria cri) throws Exception;
    int countSearchArticles(SearchCriteria cri) throws Exception;
    
	void insert(ReviewVO article) throws Exception;
	void update(ReviewVO article) throws Exception;
	void delete(int reviewNo) throws Exception;
	void deleteAll(int reviewNo) throws Exception;
	
	//조회수 상승 상승 하락 처리
	void updateViewCnt(int reviewNo) throws Exception;
	
	//댓글 개수 상승 하락처리
	void updateReplyCnt(int reviewNo, int count) throws Exception;
	
	
	//파일 업로드 
		void insertFileData(ReviewBoardUploadFileVO file);//파일을 업로딩 할 떄 insert 메서드
		int selectMaxArticleNo();
		int selectMaxFileId();
		List<ReviewVO> selectArticleList(SearchCriteria cri);
		ReviewVO selectArticle(int reviewNo);
		ReviewBoardUploadFileVO getFile(int fileId);
	

}

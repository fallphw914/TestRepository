package com.hwaboon.myapp.review.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwaboon.myapp.review.model.ReviewBoardUploadFileVO;
import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.paging.Criteria;
import com.hwaboon.myapp.review.paging.SearchCriteria;

@Repository
public class ReviewDAO implements IReviewDAO {
	
	private final SqlSession sqlSession;
	
	private static final String NAMESPACE="ReviewMapper";
	
	@Autowired
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public ReviewVO getArticle(int reviewNo) throws Exception {
		
		System.out.println("단일 게시물 조회 요청");
		System.out.println("요청 게시글 번호: "+reviewNo);
		return sqlSession.selectOne(NAMESPACE+".getArticle",reviewNo);
	}
	
	
	@Override
	public List<ReviewVO> getAllArticles() throws Exception {
		
		System.out.println("모든 게시물 조회 요청");
		
		return sqlSession.selectList(NAMESPACE+".getAllArticle");
	}
	

	@Override
	public void insert(ReviewVO article) throws Exception {
		
		sqlSession.insert(NAMESPACE+".insert",article);
		
	}

	@Override
	public void update(ReviewVO article) throws Exception {
		
		sqlSession.update(NAMESPACE+".update",article);
		
	}

	@Override
	public void delete(int reviewNo) throws Exception {
		
		System.out.println("게시물 삭제 요청");
		System.out.println("삭제 게시글 번호: "+reviewNo);
		
		sqlSession.delete(NAMESPACE+".delete",reviewNo);
		
	}
	
	@Override
	public void deleteAll(int reviewNo) throws Exception {


		sqlSession.delete(NAMESPACE+".deleteAll",reviewNo);
		
	}

	@Override
	public List<ReviewVO> listPaging(Criteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".listPaging",cri);
	}

	@Override
	public int countArticles() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".countArticles");
	}

	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".listSearch", cri);
	}

	@Override
	public int countSearchArticles(SearchCriteria cri) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".countSearchArticles", cri);
	}

	@Override
	public void updateViewCnt(int reviewNo) throws Exception {
		sqlSession.update(NAMESPACE+".updateViewCnt", reviewNo);
		
	}

	@Override
	public void insertFileData(ReviewBoardUploadFileVO file) {
		sqlSession.insert(NAMESPACE+".insertFileData", file);
		
	}

	@Override
	public int selectMaxArticleNo() {
		return sqlSession.selectOne(NAMESPACE + ".selectMaxArticleNo");
	}

	@Override
	public int selectMaxFileId() {
		return sqlSession.selectOne(NAMESPACE + ".selectMaxFileId");
	}

	@Override
	public List<ReviewVO> selectArticleList(SearchCriteria cri) {
		return sqlSession.selectList(NAMESPACE+".selectArticleList",cri);
	}

	@Override
	public ReviewVO selectArticle(int reviewNo) {
		return sqlSession.selectOne(NAMESPACE+".selectArticle",reviewNo);
	}

	@Override
	public ReviewBoardUploadFileVO getFile(int fileId) {
		return sqlSession.selectOne(NAMESPACE+".getFile",fileId);
	}

	@Override
	public void updateReplyCnt(int reviewNo, int count) throws Exception {


		Map<String, Object> datas = new HashMap<>();
		datas.put("reviewNo", reviewNo);
		datas.put("count", count);
		
		sqlSession.update(NAMESPACE+".updateReplyCnt",datas);
		
	}

	

	

	

}

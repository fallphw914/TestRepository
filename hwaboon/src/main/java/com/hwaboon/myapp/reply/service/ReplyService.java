package com.hwaboon.myapp.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwaboon.myapp.reply.model.ReplyVO;
import com.hwaboon.myapp.reply.repository.IReplyDAO;
import com.hwaboon.myapp.review.repository.IReviewDAO;
import com.hwaboon.myapp.review.paging.Criteria;



@Service
public class ReplyService implements IReplyService {
	
	@Autowired
	private IReplyDAO replyDao;
	
	@Autowired
	private IReviewDAO reviewDao;

	@Override
	public List<ReplyVO> list(int reviewNo) throws Exception {

		return replyDao.list(reviewNo);
	}

	@Transactional
	@Override
	public void insert(ReplyVO reply) throws Exception {
		
		replyDao.insert(reply);
		reviewDao.updateReplyCnt(reply.getReviewNo(),1);
		
	}

	@Override
	public void update(ReplyVO reply) throws Exception {
		
		replyDao.update(reply);
		
	}

	@Transactional
	@Override
	public void delete(int replyNo, int reviewNo) throws Exception {

		replyDao.delete(replyNo);
		
		reviewDao.updateReplyCnt(reviewNo,-1);
		
	}

	@Override
	public List<ReplyVO> listPaging(int reviewNo, Criteria cri) throws Exception {
		
		return replyDao.listPaging(reviewNo, cri);
	}

	@Override
	public int countReplies(int reviewNo) throws Exception {
		
		return replyDao.countReplies(reviewNo);
	}

}

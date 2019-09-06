package com.hwaboon.myapp.reply.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwaboon.myapp.reply.model.ReplyVO;
import com.hwaboon.myapp.review.paging.Criteria;

@Repository
public class ReplyDAO implements IReplyDAO {
	
	private static final String NAMESPACE="ReplyMapper";
	
	@Autowired
	private SqlSession sess;

	@Override
	public List<ReplyVO> list(int reviewNo) throws Exception {

		return sess.selectList(NAMESPACE+".list",reviewNo);
	}

	@Override
	public void insert(ReplyVO reply) throws Exception {

		sess.insert(NAMESPACE+".insert",reply);

	}

	@Override
	public void update(ReplyVO reply) throws Exception {
		
		sess.update(NAMESPACE+".update",reply);

	}

	@Override
	public void delete(int replyNo) throws Exception {
		
		sess.delete(NAMESPACE+".delete",replyNo);

	}

	@Override
	public void deleteAll(int reviewNo) throws Exception {
		
		sess.delete(NAMESPACE+".deleteAll",reviewNo);

	}

	@Override
	public List<ReplyVO> listPaging(int reviewNo, Criteria cri) throws Exception {
		//Mapper.xml에 여러 개의 데이터를 보낼 땐 Map 데이터로 포장해서 전달한다
				Map<String, Object> datas =new HashMap<>();
				datas.put("reviewNo",reviewNo);
				datas.put("criteria",cri);
				
				return sess.selectList(NAMESPACE+".listPaging",datas);
	}

	@Override
	public int countReplies(int reviewNo) throws Exception {

		return sess.selectOne(NAMESPACE+".countReplies",reviewNo);
	}

}

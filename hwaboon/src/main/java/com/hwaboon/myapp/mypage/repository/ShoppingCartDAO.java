package com.hwaboon.myapp.mypage.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.hwaboon.myapp.mypage.model.ShoppingCartVO;

@Repository
public class ShoppingCartDAO implements IShoppingCartDAO {
	
	SqlSession sqlSession;
	
	@Autowired
	public ShoppingCartDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ShoppingCartVO> list(String userId) throws Exception {
		return sqlSession.selectList("ShoppingCartMapper.list", userId);
	}

	@Override
	public void delete(int cartId) throws Exception {
		sqlSession.delete("ShoppingCartMapper.delete", cartId);
		
	}

	/*
	 * @Override public int sum(String userId) throws Exception { return
	 * sqlSession.selectOne("ShoppingCartMapper.sum", userId); }
	 */

	@Override
	public void update(ShoppingCartVO item) throws Exception {
		sqlSession.update("ShoppingCartMapper.update", item);
		
	}


//	@Override
//	public void insert(ShoppingCartVO item) throws Exception {
//		sqlSession.insert("ShoppingCartMapper.insert", item);
//		
//	}
//
//	@Override
//	public void updateAmount(ShoppingCartVO item) throws Exception {
//		sqlSession.update("ShoppingCartMapper.updateAmount", item);
//		
//	}
//
//	@Override
//	public void delete(Integer itemNo) throws Exception {
//		sqlSession.delete("ShoppingCartMapper.delete", itemNo);
//		
//	}
//
//	@Override
//	public void shipped(Integer itemNo) throws Exception {
//		sqlSession.update("ShoppingCartMapper.shipped", itemNo);
//		
//	}
//
//	@Override
//	public void delivered(Integer itemNo) throws Exception {
//		sqlSession.update("ShoppingCartMapper.delivered", itemNo);
//		
//	}
//
//	@Override
//	public List<ShoppingCartVO> list() throws Exception {
//		return sqlSession.selectList("ShoppingCartMapper.list");
//	}
//
//	@Override
//	public int getAmount(ShoppingCartVO item) throws Exception {
//		return sqlSession.selectOne("ShoppingCartMapper.getAmount", item);
//		
//	}

}

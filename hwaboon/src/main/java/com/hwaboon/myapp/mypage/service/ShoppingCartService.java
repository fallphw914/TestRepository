package com.hwaboon.myapp.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwaboon.myapp.mypage.model.ShoppingCartVO;
import com.hwaboon.myapp.mypage.repository.IShoppingCartDAO;


@Service
public class ShoppingCartService implements IShoppingCartService {

	@Autowired
	IShoppingCartDAO dao;

	@Override
	public List<ShoppingCartVO> list(String userId) throws Exception {
		return dao.list(userId);
	}

	@Override
	public void delete(int cartId) throws Exception {
		dao.delete(cartId);
		
	}

	/*
	 * @Override public int sum(String userId) throws Exception { return
	 * dao.sum(userId); }
	 */
	
	
	
//	@Override
//	public void insert(ShoppingCartVO item) throws Exception {
//		dao.insert(item);
//		
//	}
//
//	@Override
//	public void updateAmount(ShoppingCartVO item) throws Exception {
//		dao.updateAmount(item);
//		
//	}
//
//	@Override
//	public void delete(Integer itemNo) throws Exception {
//		dao.delete(itemNo);
//		
//	}
//
//	@Override
//	public void shipped(Integer itemNo) throws Exception {
//		dao.shipped(itemNo);
//		
//	}
//
//	@Override
//	public void delivered(Integer itemNo) throws Exception {
//		dao.delivered(itemNo);
//		
//	}
//
//
//	@Override
//	public int getAmount(ShoppingCartVO item) throws Exception {
//		return dao.getAmount(item);
//		
//	}
}

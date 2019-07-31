package com.hwaboon.myapp.mypage.repository;

import java.util.List;

import com.hwaboon.myapp.mypage.model.ShoppingCartVO;

public interface IShoppingCartDAO {

	List<ShoppingCartVO> list(String userId) throws Exception;
	
	void delete(int cartId) throws Exception;
	
	/* int sum(String userId) throws Exception; */
	
	void update(ShoppingCartVO item) throws Exception;
	
//	List<ShoppingCartVO> list() throws Exception;
//	void insert(ShoppingCartVO item) throws Exception;
//	void updateAmount(ShoppingCartVO item) throws Exception;
//	void delete(Integer itemNo) throws Exception;
//	void shipped(Integer itemNo) throws Exception;
//	void delivered(Integer itemNo) throws Exception;
//	int getAmount(ShoppingCartVO item) throws Exception;

}
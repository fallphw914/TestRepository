package com.hwaboon.myapp.mypage.model;

import java.util.Date;

public class OrderHistoryVO {
	
	private Date orderDate;
	private String userId;
	private Integer itemNo;
	private String itemName;
	private Integer itemAmount;
	private Integer itemPrice;
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getItemNo() {
		return itemNo;
	}
	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Integer getItemAmount() {
		return itemAmount;
	}
	public void setItemAmount(Integer itemAmount) {
		this.itemAmount = itemAmount;
	}
	public Integer getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	@Override
	public String toString() {
		return "OrderHistoryVO [orderDate=" + orderDate + ", userId=" + userId + ", itemNo=" + itemNo + ", itemName="
				+ itemName + ", itemAmount=" + itemAmount + ", itemPrice=" + itemPrice + "]";
	}
	
	
	

}

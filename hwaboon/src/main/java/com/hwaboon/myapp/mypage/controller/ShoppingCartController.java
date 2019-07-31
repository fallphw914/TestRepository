package com.hwaboon.myapp.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hwaboon.myapp.mypage.service.IShoppingCartService;
import com.hwaboon.myapp.review.controller.ReviewController;

@RequestMapping("/shoppingcart")
@Controller
public class ShoppingCartController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	IShoppingCartService service;
	
	@GetMapping(value = "/list")
	public String list(Model model, HttpSession session) throws Exception {
		// String userId = (String) session.getAttribute("userId");
		logger.info("쇼핑카트 리스트 요청");
		model.addAttribute("list", service.list("Jacob"));
		/* model.addAttribute("sum", service.sum("Jacob")); */
		
		return "/shoppingcart/list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam int cartId) throws Exception {
		service.delete(cartId);
		return "redirect:shoppingcart/list";
	}
	
//	@RequestMapping(value = "/list")
//	public String sum(Model model, HttpSession session) throws Exception {
//		// String userId = (String) session.getAttribute("userId");
//		model.addAttribute("sum", service.sum("Jacob"));
//		return "/shoppingcart/list";
//	}
	
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String list(Model model) throws Exception {
//		model.addAttribute("items", service.list());
//		return "/shoppingcart/list";
//	}
//	
//	@RequestMapping(value = "/insert", method = RequestMethod.POST)
//	public String insert(ShoppingCartVO item) throws Exception {	
//		service.insert(item);
//		return "SUCCESS";
//	}
//	
//	@RequestMapping(value = "/updateAmount", method = {RequestMethod.GET, RequestMethod.PUT})
//	public int updateAmount(@RequestBody ShoppingCartVO item) throws Exception {
//		service.updateAmount(item);
//		int amount = service.getAmount(item);
//		return amount;
//	}
//	
//	@RequestMapping(value = "/delete")
//	public String delete(Integer itemNo) throws Exception {
//		service.delete(itemNo);
//		return "/shoppingcart/delete";
//	}
//	
//	@RequestMapping(value = "/shipped", method = RequestMethod.POST)
//	public String shipped(Integer itemNo) throws Exception {
//		service.shipped(itemNo);
//		return "/shoppingcart/shipped";
//	}
//	
//	@RequestMapping(value = "/delivered", method = RequestMethod.POST)
//	public String delivered(Integer itemNo) throws Exception {
//		service.delivered(itemNo);
//		return "/shoppingcart/delivered";
//	}
}

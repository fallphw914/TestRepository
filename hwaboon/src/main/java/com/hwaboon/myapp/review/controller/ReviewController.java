package com.hwaboon.myapp.review.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.paging.PageCreator;
import com.hwaboon.myapp.review.paging.SearchCriteria;
import com.hwaboon.myapp.review.service.IReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private IReviewService service;

	/*
	 * //게시글 목록 페이지 열람
	 * 
	 * @RequestMapping(value="/list", method=RequestMethod.GET) public String
	 * list(Model model) throws Exception{
	 * 
	 * logger.info("게시글 목록 요청");
	 * 
	 * model.addAttribute("articles",service.getAllArticles());
	 * 
	 * return "review/list"; }
	 */
	
	/*
	 * //게시글 목록 페이징 처리 후 열람
	 * 
	 * @RequestMapping(value="/list", method=RequestMethod.GET) public String
	 * list(Criteria cri,Model model) throws Exception{
	 * 
	 * logger.info("게시글 목록 페이지 처리 후 요청");
	 * 
	 * PageCreator pc = new PageCreator(); pc.setCriteria(cri);
	 * pc.setArticleTotalCount(service.countArticles());
	 * 
	 * model.addAttribute("articles",service.listPaging(cri));
	 * model.addAttribute("pageCreator", pc);
	 * 
	 * return "review/list"; }
	 */
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(SearchCriteria cri,Model model) throws Exception{

		logger.info("게시글 목록 페이지 처리 후 요청");
		
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setArticleTotalCount(service.countSearchArticles(cri));
		
		model.addAttribute("articles", service.listSearch(cri));
		model.addAttribute("pageCreator", pc);

		return "review/list";
	}

	
	//게시글 작성 페이지 열람
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() {

		logger.info("글 작성 페이지 요청");


		return  "review/write";
	}


	//게시글 등록 요청

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(ReviewVO article, RedirectAttributes redirectAttr) throws Exception {

		logger.info("게시글 등록 요청");
		logger.info(article.toString());
		service.insert(article);
		redirectAttr.addFlashAttribute("message","regSuccess"); 

		return "redirect:/review/list";
		
	}
	
	//게시글 상세 페이지 열람
		@RequestMapping(value="/content", method=RequestMethod.GET)
		public String content(@RequestParam("reviewNo") int reviewNo,@ModelAttribute("criteria") SearchCriteria cri, Model model) throws Exception{

			logger.info("게시글 상세페이지 요청");

			model.addAttribute("article",service.getArticle(reviewNo,true));

			return "review/content";
		}
		
		
	//게시글 수정 페이지 요청
		
		@RequestMapping(value="/modify", method=RequestMethod.GET)
		public String modify(@RequestParam("reviewNo") int reviewNo,@ModelAttribute("criteria") SearchCriteria cri, Model model) throws Exception{

			logger.info("게시글 수정페이지 요청");

			model.addAttribute("article",service.getArticle(reviewNo,false));

			return "review/modify";
		}
		
		
		//게시글 수정 요청
		@RequestMapping(value="/modify", method=RequestMethod.POST)
		public String modify(ReviewVO article,SearchCriteria cri, RedirectAttributes Attrredirect) throws Exception {

			logger.info("게시글 수정 요청");
			logger.info(article.toString());
			service.update(article);
			
			Attrredirect.addAttribute("page", cri.getPage())
						.addAttribute("countPerPage", cri.getCountPerPage())
						.addAttribute("condition", cri.getCondition())
						.addAttribute("keyword", cri.getKeyword())
						.addFlashAttribute("message","modSuccess"); 
			
			return "redirect:/review/list";
			
		}
		
		//게시글 삭제 요청
		@RequestMapping(value="/delete", method=RequestMethod.POST)
		public String delete(@RequestParam("reviewNo") int reviewNo,SearchCriteria cri, RedirectAttributes Attrredirect) throws Exception{

			logger.info("게시글 삭제 요청");
			
			service.delete(reviewNo);
			Attrredirect.addAttribute("page", cri.getPage())
						.addAttribute("countPerPage", cri.getCountPerPage())
						.addAttribute("condition", cri.getCondition())
						.addAttribute("keyword", cri.getKeyword())
						.addFlashAttribute("message","delSuccess"); 

			return "redirect:/review/list";
		}
		
}

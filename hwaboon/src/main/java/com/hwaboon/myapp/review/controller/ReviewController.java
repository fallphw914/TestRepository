package com.hwaboon.myapp.review.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hwaboon.myapp.review.model.ReviewBoardUploadFileVO;
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
	
	
	@GetMapping(value = "/list")
	public String list(SearchCriteria cri, Model model) throws Exception{

		logger.info("게시글 목록 페이지 처리 후 요청");
		
		List<ReviewVO> list = service.selectArticleList(cri);
		
		
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setArticleTotalCount(service.countSearchArticles(cri));
		
		
		model.addAttribute("articles", list); 
		
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
		
		try {
			
			MultipartFile mfile = article.getFile();

			if(mfile!=null && !mfile.isEmpty()) {
				logger.info("/review/write : " + mfile.getOriginalFilename());
				ReviewBoardUploadFileVO file = new ReviewBoardUploadFileVO();
				file.setFileName(mfile.getOriginalFilename());
				file.setFileSize(mfile.getSize());
				file.setFileContentType(mfile.getContentType());
				file.setFileData(mfile.getBytes());
				
				logger.info("/review/write : " + file);
				service.insertArticle(article, file);
				
			} else {
				
				service.insert(article);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		
		redirectAttr.addFlashAttribute("message","regSuccess"); 

		return "redirect:/review/list";
		
	}
	
	@RequestMapping("/file/{fileId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int fileId) throws Exception {
		ReviewBoardUploadFileVO file = service.getFile(fileId);
		logger.info("getFile " + file.toString());
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		headers.setContentDispositionFormData("attachment", file.getFileName());
		
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}
	
	//게시글 상세 페이지 열람
		@RequestMapping(value="/content", method=RequestMethod.GET)
		public String content(@RequestParam("reviewNo") int reviewNo,@ModelAttribute("criteria") SearchCriteria cri, Model model) throws Exception{

			logger.info("게시글 상세페이지 요청");

			model.addAttribute("article",service.selectArticle(reviewNo, true));


			return "review/content";
		}
		
		
	//게시글 수정 페이지 요청
		
		@RequestMapping(value="/modify", method=RequestMethod.GET)
		public String modify(@RequestParam("reviewNo") int reviewNo,@ModelAttribute("criteria") SearchCriteria cri, Model model) throws Exception{

			logger.info("게시글 수정페이지 요청");

			model.addAttribute("article",service.selectArticle(reviewNo,false));

			return "review/modify";
		}
		
		
		//게시글 수정 요청
		@RequestMapping(value="/modify", method=RequestMethod.POST)
		public String modify(ReviewVO article,SearchCriteria cri, RedirectAttributes Attrredirect) throws Exception {

			logger.info("게시글 수정 요청");
			logger.info(article.toString());
			service.update(article);
			System.out.println(article);
			
			Attrredirect.addAttribute("page", cri.getPage())
						.addAttribute("countPerPage", cri.getCountPerPage())
						.addAttribute("condition", cri.getCondition())
						.addAttribute("keyword", cri.getKeyword())
						.addFlashAttribute("message","modSuccess"); 
			
			return "redirect:/review/list";
			
		}
		
		//게시글 삭제 요청
		@RequestMapping(value="/delete", method=RequestMethod.POST)
		public String delete(@RequestParam("reviewNo") int reviewNo, SearchCriteria cri, RedirectAttributes Attrredirect) throws Exception{

			logger.info("게시글 삭제 요청");
			
			service.delete(reviewNo);
			logger.info("삭제요청: "+reviewNo);
			Attrredirect.addAttribute("page", cri.getPage())
						.addAttribute("countPerPage", cri.getCountPerPage())
						.addAttribute("condition", cri.getCondition())
						.addAttribute("keyword", cri.getKeyword())
						.addFlashAttribute("message","delSuccess"); 

			return "redirect:/review/list";
		}
		
}

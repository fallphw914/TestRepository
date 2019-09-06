package com.hwaboon.myapp.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hwaboon.myapp.reply.model.ReplyVO;
import com.hwaboon.myapp.reply.service.IReplyService;
import com.hwaboon.myapp.review.paging.Criteria;
import com.hwaboon.myapp.review.paging.PageCreator;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private IReplyService service;
	
	@RequestMapping(value="",method=RequestMethod.POST)
	
	/* @RequestBody: 클라이언트가 전송한 JSON데이터를 자바 객체로 변환해주는 어노테이션이다. */
	public String register(@RequestBody ReplyVO reply) throws Exception{
		
		logger.info("/replies: post 요청 발생");
		logger.info("원본글 번호: "+reply.getReviewNo());
		
		service.insert(reply);
		
		logger.info(reply.toString()+"댓글 등록 성공");
		
		
		return "regSuccess";
	}
	
	//댓글 목록 가져오기
	/* @PathVariable: REST방식의 URI 경로에서 원하는 데이터를 추출할때 사용 */
	@RequestMapping(value="/all/{reviewNo}",method=RequestMethod.GET)
	public List<ReplyVO> list(@PathVariable int reviewNo) throws Exception{
		
		logger.info("replies/all/"+reviewNo+" : GET요청발생!");
		
		
		return service.list(reviewNo);
	}
	
	//페이징 처리된 댓글 목록 가져오기
	@RequestMapping(value="/{reviewNo}/{page}",method=RequestMethod.GET)
	public Map<String,Object> listPaing(@PathVariable ("reviewNo") int reviewNo,@PathVariable ("page") int page) throws Exception{
		
		logger.info("reply paging GET요청발생!");
		
		Criteria cri =new Criteria();
		cri.setPage(page);
		List<ReplyVO> replies = service.listPaging(reviewNo, cri);
		
		
		
		
		
		PageCreator pc =new PageCreator();
		pc.setCriteria(cri);
		pc.setArticleTotalCount(service.countReplies(reviewNo));
		
		Map<String,Object> datas = new HashMap<>();
		datas.put("replies",replies);
		datas.put("pageCreator",pc);
		return datas;
	}
	
	//댓글 삭제 요청처리
	@RequestMapping(value="/{replyNo}",method=RequestMethod.DELETE)
	public String delete(@PathVariable int replyNo, @RequestBody ReplyVO reply) throws Exception{
		
		logger.info("replies/all/"+replyNo+" : DELETE요청발생!");
		
		service.delete(replyNo, reply.getReviewNo());
		
		return "delSuccess";
	}
	
	//댓글 수정 요청처리
	@RequestMapping(value="/{replyNo}",method=RequestMethod.PUT)
	public String update(@RequestBody ReplyVO reply, @PathVariable int replyNo) throws Exception{
		
		logger.info("replies/"+replyNo+" : PUT요청발생!");
		
		reply.setReplyNo(replyNo);
		service.update(reply);
		
		return "modSuccess";
	}

}

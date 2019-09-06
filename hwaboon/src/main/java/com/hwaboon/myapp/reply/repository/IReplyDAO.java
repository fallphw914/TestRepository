package com.hwaboon.myapp.reply.repository;

import java.util.List;

import com.hwaboon.myapp.reply.model.ReplyVO;
import com.hwaboon.myapp.review.paging.Criteria;



public interface IReplyDAO {
	
		
		//댓글 목록 불러오기
			List<ReplyVO> list(int reivewNo) throws Exception;
			
			//댓글 쓰기 기능
			void insert (ReplyVO reply) throws Exception;
			
			//댓글 쓰기 기능
			void update (ReplyVO reply) throws Exception;
			
			//댓글 삭제 기능
			void delete(int replyNo) throws Exception;
			
			//게시글에 달린 댓글 전부 삭제
			void deleteAll(int reivewNo) throws Exception;

			
			//페이징 처리 된 게시글 목록 불러오기
			List<ReplyVO> listPaging(int reviewNo,Criteria cri) throws Exception;
			
			//특정 게시물의 총 댓글 수 불러오기 기능
			int countReplies(int reivewNo) throws Exception;



}

package replyTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hwaboon.myapp.reply.model.ReplyVO;
import com.hwaboon.myapp.reply.repository.IReplyDAO;
import com.hwaboon.myapp.review.paging.Criteria;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/mvc-config.xml"})
public class ReplyDAOTest {
	
	@Autowired
	private IReplyDAO dao; //의존성 주입
	
	@Test
	public void testReplyInsert() throws Exception{
		
		for(int i=1;i<=300;i++) {
			
			ReplyVO reply =new ReplyVO();
			reply.setReviewNo(100);
			reply.setReplyText("댓글"+i);
			reply.setReplyWriter("유저"+i);
			
			dao.insert(reply);
			
		}
		
		
		System.out.println("댓글 등록 성공~");
	}
	
	@Test
	public void replyListTest() throws Exception {
		
		for (ReplyVO vo : dao.list(100)) {
			
			if(vo.getReplyNo() == 251) break;
			System.out.println(vo);
			
		}
	}
	
	//2997번 글의 99번 댓글을 수정
	
	@Test
	public void replyUpdate() throws Exception {
		
		ReplyVO reply =new ReplyVO();
		reply.setReviewNo(2997);
		reply.setReplyNo(99);
		reply.setReplyText("댓글을 수정했습니다.");
		
		dao.update(reply);
	}
	
	//2997번 글의 300번 댓글을 삭제
	
	@Test
	public void replyDelete() throws Exception {
		
		dao.delete(300);
		System.out.println("삭제 완료");
	}	
	
	
	//댓글 페이징 테스트
	@Test
	public void pagingTest() throws Exception {
		
		Criteria cri =new Criteria();
		
		cri.setPage(2);
		cri.setCountPerPage(10);
		
		for(ReplyVO reply : dao.listPaging(2997, cri)) {
			System.out.println(reply);
		}
		
	}
	

}
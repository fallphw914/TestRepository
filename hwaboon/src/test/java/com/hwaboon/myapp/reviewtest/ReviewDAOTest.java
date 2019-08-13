package com.hwaboon.myapp.reviewtest;


import java.util.List;

import javax.inject.Inject;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hwaboon.myapp.review.model.ReviewVO;
import com.hwaboon.myapp.review.repository.IReviewDAO;
import com.hwaboon.myapp.review.repository.ReviewDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:/spring/mvc-config.xml"})
public class ReviewDAOTest {
   
   private static final Logger logger=LoggerFactory.getLogger(ReviewDAOTest.class);
   
   @Inject
   private IReviewDAO reviewDAO;
   

   @Test 
   public void insertTest() throws Exception{

      for(int i=1; i<=200; i++) { 
         ReviewVO vo = new ReviewVO();
         vo.setTitle(i+"번째 테스트 게시물"); vo.setContent(i+"번째 게시물 내용");
         vo.setWriter("user"+i); reviewDAO.insert(vo);

      } 
   }

   
   @Test
   public void updateTest() throws Exception{
      
      ReviewVO article = new ReviewVO();
      article.setReviewNo(1);
      article.setTitle("수정 테스트가 진행된 글 제목입니다.");
      article.setContent("글 내용수정 테스트 진행중 입니다");
      reviewDAO.update(article);
      logger.info(reviewDAO.getArticle(1).toString()+"\n");
   }

   @Test
   public void deleteTest() throws Exception{
      
	   reviewDAO.deleteAll(206);
      reviewDAO.delete(206);
   }
   
   @Test
   public void selectTest() throws Exception{
   
      logger.info(reviewDAO.getArticle(333).toString()+"\n");
   }
   
   @Test
   public void selectAllTest() throws Exception{
	   
	   List<ReviewVO> articles=reviewDAO.getAllArticles();
	   for(ReviewVO article : articles) {
		   logger.info(article.toString());
	   }
     
   }
   

}
package com.spring.myapp.usertest;

import java.beans.Encoder;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myapp.boardtest.BoardDAOTest;
import com.spring.myapp.user.model.LoginVO;
import com.spring.myapp.user.model.UserVO;
import com.spring.myapp.user.repository.IUserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/mvc-config.xml"})
public class UserDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOTest.class);
	
	@Autowired
	private IUserDAO dao;
	
	/*
	 * @Test public void userRegTest() throws Exception { UserVO vo = new UserVO();
	 * vo.setUserId("user1"); vo.setUserPw("pass"); vo.setUserName("park");
	 * 
	 * dao.register(vo);
	 * 
	 * System.out.println("회원 등록 성공"); }
	 */
	
	//id 중복 테스트
	/*
	 * @Test public void duplicateTest() throws Exception{
	 * 
	 * int n =dao.isDuplicateId("er");
	 * 
	 * if(n == 1) System.out.println("id 중복입니다~~~~~~~"); else
	 * System.out.println("id 중복 아닙니다~~~~~~~~"); }
	 */
	
	@Test
	public void loginTest() throws Exception {

		//로그인 처리를 위해 암호화된 DB패스워드를 디코딩하여 비교
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		LoginVO login = new LoginVO();
		login.setUserId("pine");
		login.setUserPw("@qkrgodnjs");
		
		UserVO user = dao.login(login);
		System.out.println("로그인 시도 회원정보: "+user);
		
		if(user != null) {
			
			String dbPw = user.getUserPw();
			System.out.println("DB password: "+dbPw);
			String inputPw= login.getUserPw();
			System.out.println("Input password: "+inputPw);
			
			if(encoder.matches(inputPw,dbPw)) {
				System.out.println("로그인 성공입니다.");
			}else {
				System.out.println("비밀번호가 틀렸습니다.");
			}
		}
		else {
			System.out.println("존재하지 않는 회원입니다.");
		}
	}
}

package com.spring.myapp.user.service;

import java.util.Date;
import java.util.Map;

import com.spring.myapp.user.model.LoginVO;
import com.spring.myapp.user.model.UserVO;

public interface IUserService {
	
	//회원 가입 처리
	public void register(UserVO user) throws Exception;
	
	//중복확인처리
	int isDuplicateId(String userId) throws Exception;
	
	//로그인 처리
	UserVO login(LoginVO login) throws Exception;
	
	//자동 로그인 유지처리
	void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;
	
	//세션아이디 검증후 회원정보를 불러오는 처리
	UserVO getUserWithSessionId(String sessionId) throws Exception;
}

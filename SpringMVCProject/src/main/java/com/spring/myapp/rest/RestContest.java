package com.spring.myapp.rest;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;
import com.spring.myapp.commons.paging.Criteria;
import com.spring.myapp.commons.paging.PageCreator;

//비동기 통신 예제
//요청이 오면 뷰리졸버를 거치지 않는다
@RestController
@RequestMapping("/rest/test")
public class RestContest {
	
	@RequestMapping("/hello")
	public String sayHelloWorld() {
		System.out.println("/rest/test/hello 요청이 들어옴");
		return "HelloWorld";
	}
	
	@RequestMapping("/sendVO")
	public RestVO sendVO() {
		
		RestVO vo =new RestVO();
		
		vo.setNumber(13);
		vo.setName("김까까");
		vo.setHobbys(Arrays.asList("운동", "음악감상","독서"));
		
		Map<String,String> skills =new HashMap<>();
		skills.put("언어","자바");
		skills.put("프레임워크","스프링");
		skills.put("운영체제","윈도우10");
		skills.put("DBMS","MySQL");
		vo.setSkills(skills);
		
		return vo;
	}
	
	@RequestMapping("/page-cre")
	public PageCreator pageCreator() {
		
		PageCreator pc =new PageCreator();
		
		pc.setCriteria(new Criteria());
		
		return pc;
		
	}
	
	
	////////////////////////////////////////////////////////////
	
	//RestController에서 jsp 파일 열기
	//리턴 타입을 ModelAndView타입으로 설정
	@RequestMapping("/setview")
	public ModelAndView test() {
		
		/*
		 * ModelAndView mv =new ModelAndView(); mv.setViewName("test/setview");
		 * mv.addObject("name","홍길동");
		 */
		return new ModelAndView("test/setview","name","spider-man");
	}

}

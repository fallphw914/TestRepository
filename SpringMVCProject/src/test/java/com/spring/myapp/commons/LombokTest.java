package com.spring.myapp.commons;

import lombok.Data;

@Data
public class LombokTest {
	
	//사용할 database table 컬럼과 1:1로 매핑되는
	//필드들을 캡슐화를 통해 프로퍼티화 시킨다.
	
	private String name;
	private String address;
	private String phoneNumber;
	private int age;

}

package com.javaclass.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberVO {
	
	private String id;
	private String gradeName;
	private String pass;
	private String name;
	private String tel;
	private String address;
	private String email;
	private Integer totalOrderPrice;
	private Integer mileage;
	private String memberStatus;
	private Integer memberLv;

}

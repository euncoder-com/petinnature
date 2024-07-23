package com.javaclass.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	
	private Integer answerno;
	private Integer qno;	
	private String answercontent;
	private Date adate;
	private String adminid;

}

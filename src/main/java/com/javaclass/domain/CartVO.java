package com.javaclass.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CartVO {

	private String id;
	private Integer product_no;
	private Date rdate;
	private Integer cnt;
	private Integer productNo;
	private String productName;
	private Integer productPrice;
	private String productContent;
	private String productImg;
	private Integer productCnt;
	private Integer deliveryFee;
	private Integer member_lv;
	private Integer mileage;
}

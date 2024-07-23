package com.javaclass.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	
	private Integer qNo;	
	private Integer productNo;
	private Integer orderNo;
	private String id;
	private String title;
	private String content;
	private Date qdate;
	private String process;
	private String qnaType;
	
	/* 추가 여기부터 */
	private String productName;
	private Integer productPrice;
	private String productContent;
	private String productImg;
	private Integer productCnt;



	public Integer getqNo() {
		return qNo;
	}

	public void setqNo(Integer qNo) {
		this.qNo = qNo;
	}

	 public String getQdate() {
	        if (qdate == null) {
	            return "N/A"; // 또는 적절한 기본값
	        }
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        return dateFormat.format(qdate);
	    }

	    // qdate 설정 메서드
	    public void setQdate(Date qdate) {
	        this.qdate = qdate;
	    }

}

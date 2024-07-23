package com.javaclass.domain;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;




public class ReviewVO {
	
	private Integer review_no;
	private Integer product_no;
	private String id;
	private String title;
	private String content;
	private Date rdate;
	private Float rate;
	
	private String review_img;	// 파일명
	private String b_realfname; // 저장된 파일이름
	private long b_fsize;		// 파일크기
	
	
	MultipartFile file; // ****** type='file'의 name명과 동일
	
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// 업로드 파일이 있는 경우
		if( !file.isEmpty()) {
			this.review_img = file.getOriginalFilename();
			this.b_fsize = file.getSize();
			
			// 실제 저장된 파일명 만들기
			UUID uuid = UUID.randomUUID();
			this.b_realfname = uuid.toString() + "_" + review_img;
			System.out.println(b_realfname);
			System.out.println(b_fsize);
			System.out.println(review_img);
			
			
			// 실제파일 저장
				//[오늘의 과제]
			// 추후에 웹서버 경로를 찾아서 수정
			File f = new File("C:\\Jaeyeon\\springproject\\petinnature\\src\\main\\webapp\\resources\\images\\reviewimg\\" + b_realfname);
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	
	
	
	
	
	public String getB_realfname() {
		return b_realfname;
	}

	public void setB_realfname(String b_realfname) {
		this.b_realfname = b_realfname;
	}

	public long getB_fsize() {
		return b_fsize;
	}

	public void setB_fsize(long b_fsize) {
		this.b_fsize = b_fsize;
	}

	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", product_no=" + product_no + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", rdate=" + rdate + ", rate=" + rate + ", review_img=" + review_img + "]";
	}
	public Integer getReview_no() {
		return review_no;
	}
	public void setReview_no(Integer review_no) {
		this.review_no = review_no;
	}
	public Integer getProduct_no() {
		return product_no;
	}
	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public Float getRate() {
		return rate;
	}
	public void setRate(Float rate) {
		this.rate = rate;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	
	
	
}

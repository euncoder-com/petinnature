package com.javaclass.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {

	private Integer productNo;	
	private String productName;
	private Integer productPrice;
	private String productContent;
	private String productImg;
	private Integer productCnt;
	
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
			this.productImg = file.getOriginalFilename();

			
			
			// 실제파일 저장
				//[오늘의 과제]
			// 추후에 웹서버 경로를 찾아서 수정
			File f = new File("C:\\Jaeyeon\\springproject\\petinnature\\src\\main\\webapp\\resources\\images\\productimgs\\" + productImg);
			
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
}

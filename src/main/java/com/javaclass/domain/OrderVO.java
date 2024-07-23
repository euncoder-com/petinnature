package com.javaclass.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class OrderVO {

	

    private Integer orderNo;
    private String id;
    private Date rdate;
    private Integer price;
    private String rname;
    private String raddress;
    private String rtel;
    private String orderstatus;
    private String request;
    private String payment;
    

    public String getRdate() {
        if (rdate == null) {
            return "N/A"; // 또는 적절한 기본값
        }
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(rdate);
    }

    // rdate 설정 메서드
    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

}

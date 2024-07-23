package com.javaclass.repository;

import java.util.HashMap;
import java.util.List;

import com.javaclass.domain.MemberVO;
import com.javaclass.domain.QnaVO;
import com.javaclass.domain.ReviewVO;

public interface MypageDAO {


	public List getqnaList(HashMap pagingParams);

	public Integer getqnaTotalCount(String id);

	public String getAnswer(Integer qno);

	public void writeQna(QnaVO vo);
	
	
	// 후기내역
		public List getMemberReview(ReviewVO vo) ;
		
		
		// 후기삭제
		public void deleteReview(ReviewVO vo);
		
		//후기페이징
		List getreviewList(HashMap pagingParams);
		public Integer getreviewTotalCount(String id);
		
		
		//후기작성
		public void insertReview(ReviewVO vo);
		
		
		// 주문내역
		public List getMemberOrderlist(MemberVO vo) ;
		
		
		// 주문내역페이징
		List getorderList(HashMap pagingParams);
		public Integer getorderTotalCount(String id);
		
		
		public List getMemberOrdercancel(String order_no);
		
		public List getMemberOrderinfo(String order_no);
		
		public void orderCancelDB(String order_no);

		public Integer exituser(String id);

	

}

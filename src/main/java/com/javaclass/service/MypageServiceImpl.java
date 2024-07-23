package com.javaclass.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.domain.MemberVO;
import com.javaclass.domain.QnaVO;
import com.javaclass.domain.ReviewVO;
import com.javaclass.repository.MypageDAO;

//### (1) 해당 어노테이션 지정
// 하나여서 이름 지정하지 않아도 됨
@Service("mypageServiceImpl")
public class MypageServiceImpl implements MypageService{

	// ### (2) 해당 어노테이션 지정
	@Autowired
	private MypageDAO mypageDAOImpl;
	
	public List getqnaList(HashMap pagingParams) {

		return mypageDAOImpl.getqnaList(pagingParams);
	}


	public int getqnaTotalCount(String id) {
		return mypageDAOImpl.getqnaTotalCount(id);
	}


	public String getAnswer(Integer qno) {

		return mypageDAOImpl.getAnswer(qno);
	}


	public void writeQna(QnaVO vo) {
		
		mypageDAOImpl.writeQna(vo);
		
	}
	
	// 후기내역
		public List getMemberReview(ReviewVO vo) {
			return mypageDAOImpl.getMemberReview(vo);
		}
		
		// 후기삭제
		public void deleteReview(ReviewVO vo) {
			mypageDAOImpl.deleteReview(vo);
		}
		
		// 후기페이징
		public List getreviewList(HashMap pagingParams) {

		      return mypageDAOImpl.getreviewList(pagingParams);
		   }

		   @Override
		   public Integer getreviewTotalCount(String id) {
		      return mypageDAOImpl.getreviewTotalCount(id);
		   }
		  
		
		// 후기작성
		  public void insertReview(ReviewVO vo) {

			  mypageDAOImpl.insertReview(vo);
			}
	   
		   
		
		
		// 주문내역
		public List getMemberOrderlist(MemberVO vo) {
			return mypageDAOImpl.getMemberOrderlist(vo);
		}
		
		
		
		// 주문내역 페이징
		public List getorderList(HashMap pagingParams) {

		      return mypageDAOImpl.getorderList(pagingParams);
		   }

		   @Override
		   public Integer getorderTotalCount(String id) {
		      return mypageDAOImpl.getorderTotalCount(id);
		   }

		   public List getMemberOrdercancel(String order_no) {
				return mypageDAOImpl.getMemberOrdercancel(order_no);
			}

		
		public List getMemberOrderinfo(String order_no) {
			
			return mypageDAOImpl.getMemberOrderinfo(order_no);
		}

		@Override
		public void orderCancelDB(String order_no) {
			mypageDAOImpl.orderCancelDB(order_no);
		}
			
		   
		@Override
		public Integer exituser(String id) {
			return mypageDAOImpl.exituser(id);
		}


	
}

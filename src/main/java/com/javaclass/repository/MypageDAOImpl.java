package com.javaclass.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.domain.MemberVO;
import com.javaclass.domain.QnaVO;
import com.javaclass.domain.ReviewVO;

@Repository("mypageDAOImpl")
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List getqnaList(HashMap pagingParams){
		return mybatis.selectList("MypageDAO.getqnaList", pagingParams);
	}


	public Integer getqnaTotalCount(String id) {
		return mybatis.selectOne("MypageDAO.getqnaTotalCount", id);
	}


	public String getAnswer(Integer qno) {

		return mybatis.selectOne("MypageDAO.getAnswer", qno);
	}



	public void writeQna(QnaVO vo) {
		
		mybatis.insert("MypageDAO.writeQna", vo);
		
	}


	// 후기내역
		public List getMemberReview(ReviewVO vo) {
			System.out.println("===> sqlSession getMemberReview() 호출");
			
			return mybatis.selectList("MypageDAO.getMemberReview", vo);
		}
		
		
		// 후기페이징
		public List getreviewList(HashMap pagingParams){
			return mybatis.selectList("MypageDAO.getreviewList", pagingParams);
		   }

		   @Override
		   public Integer getreviewTotalCount(String id) {
		      return mybatis.selectOne("MypageDAO.getreviewTotalCount", id);
		   }
		
		
		
		
		// 후기삭제
		public void deleteReview(ReviewVO vo) {
			System.out.println("===> sqlSession deleteReview() 호출");
			mybatis.delete("MypageDAO.deleteReview", vo);
		}
		
		
		// 후기작성
		public void insertReview(ReviewVO vo) {
			System.out.println(vo.toString());
			System.out.println("===> Mybatis insertReview() 호출");		
			mybatis.insert("MypageDAO.insertReview", vo);
		}
		
		
		
		// 주문내역
		public List getMemberOrderlist(MemberVO vo) {
			System.out.println("===> sqlSession getMemberOrderlist() 호출");
			
			return mybatis.selectList("MypageDAO.getMemberOrderlist", vo);
		}
		
		
		// 주문내역 페이징
		public List getorderList(HashMap pagingParams){
			return mybatis.selectList("MypageDAO.getorderList", pagingParams);
		   }

		   @Override
		   public Integer getorderTotalCount(String id) {
		      return mybatis.selectOne("MypageDAO.getorderTotalCount", id);
		   }
		   public List getMemberOrdercancel(String order_no) {
				System.out.println("===> sqlSession getMemberOrdercancel() 호출");
				
				return mybatis.selectList("MypageDAO.getMemberOrdercancel", order_no);
			}
		   
		   public List getMemberOrderinfo(String order_no) {
				System.out.println("===> sqlSession getMemberOrderinfo() 호출");
				
				return mybatis.selectList("MypageDAO.getMemberOrderinfo", order_no);
			}

		@Override
		public void orderCancelDB(String order_no) {
			mybatis.selectList("MypageDAO.orderCancelDB", order_no);
		}


		@Override
		public Integer exituser(String id) {
			return mybatis.update("MypageDAO.exituser", id);
		}




}

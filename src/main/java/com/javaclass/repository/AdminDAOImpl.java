package com.javaclass.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.domain.AnswerVO;
import com.javaclass.domain.CategoryVO;
import com.javaclass.domain.MemberVO;
import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.domain.QnaVO;

//### (1) 해당 어노테이션 지정
@Repository("adminDAOImpl")
public class AdminDAOImpl implements AdminDAO{

	//### (2) 해당 어노테이션 지정
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//---------------------------------------------
	public List<ProductVO> adminProductsList(ProductVO vo) {
		return sqlSession.selectList("AdminDAO.adminProductsList", vo);
	}


	@Override
	public List productTypeInfo(ProductVO pvo) {
		
		return sqlSession.selectList("AdminDAO.productTypeInfo", pvo);
	}
	
	
	@Override
	public List productBrandInfo(ProductVO pvo) {
		
		return sqlSession.selectList("AdminDAO.productBrandInfo", pvo);
	}


	@Override
	public void modifyProduct(ProductVO pvo, CategoryVO cvo, Integer originCateNo) {
		
		
		HashMap hash = new HashMap();
		
		hash.put("originCateNo", originCateNo);
		
		hash.put("product_no", pvo.getProductNo());
		
		hash.put("product_name", pvo.getProductName());
		hash.put("small_cate", cvo.getSmall_cate());
		hash.put("product_price", pvo.getProductPrice());
		hash.put("product_content", pvo.getProductContent());
		hash.put("product_cnt", pvo.getProductCnt());
		hash.put("pet_cate", cvo.getPet_cate());
		hash.put("big_cate", cvo.getBig_cate());
		hash.put("cate", cvo.getCate());
		hash.put("cate_no", cvo.getCate_no());
		
		sqlSession.update("AdminDAO.modifyProduct", hash);
		sqlSession.update("AdminDAO.modifyCategory", hash);
	}
	

	public void modifyBrand(Integer product_no, CategoryVO cvo, Integer originCateNo, Integer small_cate) {
		
		
		HashMap hash = new HashMap();

		hash.put("originCateNo", originCateNo);
		
		hash.put("product_no", product_no);
		
		hash.put("cate_no", cvo.getCate_no());
		
		hash.put("small_cate", small_cate);
		
		sqlSession.update("AdminDAO.modifyBrand", hash);
	}

	public List<OrderVO> adminOrdersList(HashMap pagingParams) {
		return sqlSession.selectList("AdminDAO.adminOrdersList", pagingParams);
	}

	public List<QnaVO> adminQnaList(HashMap pagingParams) {
		return sqlSession.selectList("AdminDAO.adminQnaList", pagingParams);
	}

	public int adminUpdateOrderStatus(OrderVO vo) {
		return sqlSession.update("AdminDAO.adminUpdateOrderStatus", vo);
	}


	@Override
	public void addProduct(ProductVO pvo) {
		sqlSession.insert("AdminDAO.addProduct", pvo);
		
	}


	@Override
	public void addTypeProduct(Integer addProductNum, CategoryVO cvo) {
		
		HashMap hash = new HashMap();

		
		hash.put("product_no", addProductNum);
		
		hash.put("cate_no", cvo.getCate_no());

		
		sqlSession.insert("AdminDAO.addTypeProduct", hash);
		
	}


	@Override
	public Integer addProductNum() {
		
		return sqlSession.selectOne("AdminDAO.addProductNum");
	}

	

	
	// 관리자 차트
	@Override
	public List<HashMap> getSalesChart(String cate) {
		return sqlSession.selectList("AdminDAO.saleschartList",cate);
	}


	@Override
	public int deleteProduct(List<Integer> productNos) {

		return sqlSession.delete("AdminDAO.deleteProduct",productNos);
	}


	@Override
	public void deleteCate(List<Integer> productNos) {
		sqlSession.delete("AdminDAO.deleteCate",productNos);
		
	}


	@Override
	public HashMap selectQna(Integer qNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AdminDAO.selectQna", qNo);
	}


	@Override
	public void writeAnswer(AnswerVO avo) {
		sqlSession.delete("AdminDAO.writeAnswer",avo);
		
	}


	@Override
	public void updateQnaStatus(QnaVO qvo) {
		sqlSession.delete("AdminDAO.updateQnaStatus",qvo);
		
	}


	@Override
	public int getAdminOrdersList() {
		
		return sqlSession.selectOne("AdminDAO.getAdminOrdersList");
	}


	@Override
	public int getAdminQnaList() {

		return sqlSession.selectOne("AdminDAO.getAdminQnaList");
	}

	public List<MemberVO> membersList(HashMap pagingParams) {
		return sqlSession.selectList("AdminDAO.membersList", pagingParams);
	}


	@Override
	public int getMemberList() {

		return sqlSession.selectOne("AdminDAO.getMemberList");
	}


}

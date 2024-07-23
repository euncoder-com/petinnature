package com.javaclass.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.domain.AnswerVO;
import com.javaclass.domain.CategoryVO;
import com.javaclass.domain.MemberVO;
import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.domain.QnaVO;
import com.javaclass.repository.AdminDAO;

//### (1) 해당 어노테이션 지정
// 하나여서 이름 지정하지 않아도 됨
@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService{

	// ### (2) 해당 어노테이션 지정
	@Autowired
	private AdminDAO adminDAOImpl;


	public List<ProductVO> adminProductsList(ProductVO vo){
		return adminDAOImpl.adminProductsList(vo);
	}


	@Override
	public List productTypeInfo(ProductVO pvo) {

		return adminDAOImpl.productTypeInfo(pvo);
	}
	
	
	@Override
	public List productBrandInfo(ProductVO pvo) {

		return adminDAOImpl.productBrandInfo(pvo);
	}


	@Override
	public void modifyProduct(ProductVO pvo, CategoryVO cvo, Integer originCateNo) {
		adminDAOImpl.modifyProduct(pvo, cvo, originCateNo);
		
	}


	@Override
	public void modifyBrand(Integer product_no, CategoryVO cvo, Integer originCateNo, Integer small_cate) {
		adminDAOImpl.modifyBrand(product_no, cvo, originCateNo, small_cate);
		
	};

	public List<OrderVO> adminOrdersList(HashMap pagingParams) {
		return adminDAOImpl.adminOrdersList(pagingParams);
	}

	public List<QnaVO> adminQnaList(HashMap pagingParams2) {
		return adminDAOImpl.adminQnaList(pagingParams2);
	};

	public int adminUpdateOrderStatus(OrderVO vo) {
		return adminDAOImpl.adminUpdateOrderStatus(vo);
	}


	@Override
	public void addProduct(ProductVO pvo) {
		adminDAOImpl.addProduct(pvo);
		
	}


	@Override
	public void addTypeProduct(Integer addProductNum, CategoryVO cvo) {
		adminDAOImpl.addTypeProduct(addProductNum, cvo);
		
	}


	@Override
	public Integer addProductNum() {
		return adminDAOImpl.addProductNum();
	};

	@Override
	public List<HashMap> getSalesChart(String cate) {
		return adminDAOImpl.getSalesChart(cate);
	}


	@Override
	public int deleteProduct(List<Integer> productNos) {

		return adminDAOImpl.deleteProduct(productNos);
	}


	@Override
	public void deleteCate(List<Integer> productNos) {
		adminDAOImpl.deleteCate(productNos);
		
	}


	@Override
	public HashMap selectQna(Integer qNo) {
		
		return adminDAOImpl.selectQna(qNo);
	}


	@Override
	public void writeAnswer(AnswerVO avo) {
		adminDAOImpl.writeAnswer(avo);
		
	}


	@Override
	public void updateQnaStatus(QnaVO qvo) {
		adminDAOImpl.updateQnaStatus(qvo);
		
	}


	@Override
	public int getAdminOrdersList() {
		
		return adminDAOImpl.getAdminOrdersList();
	}


	@Override
	public int getAdminQnaList() {
		
		return adminDAOImpl.getAdminQnaList();
	};

	public List<MemberVO> membersList(HashMap pagingParams) {
		return adminDAOImpl.membersList(pagingParams);
	}


	@Override
	public int getMemberList() {

		return adminDAOImpl.getMemberList();
	};

}

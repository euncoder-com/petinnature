package com.javaclass.repository;

import java.util.HashMap;
import java.util.List;

import com.javaclass.domain.AnswerVO;
import com.javaclass.domain.CategoryVO;
import com.javaclass.domain.MemberVO;
import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.domain.QnaVO;

public interface AdminDAO {
	public List<ProductVO> adminProductsList(ProductVO vo);

	public List productTypeInfo(ProductVO pvo);
	
	public List productBrandInfo(ProductVO pvo);

	public void modifyProduct(ProductVO pvo, CategoryVO cvo, Integer product_no);

	public void modifyBrand(Integer product_no, CategoryVO cvo, Integer originCateNo, Integer small_cate);

	public List<OrderVO> adminOrdersList(HashMap pagingParams);
	public List<QnaVO> adminQnaList(HashMap pagingParams2);
	public int adminUpdateOrderStatus(OrderVO vo);

	public void addProduct(ProductVO pvo);

	public void addTypeProduct(Integer addProductNum, CategoryVO cvo);

	public Integer addProductNum();

	public List<HashMap> getSalesChart(String cate);

	public int deleteProduct(List<Integer> productNos);

	public void deleteCate(List<Integer> productNos);

	public HashMap selectQna(Integer qNo);

	public void writeAnswer(AnswerVO avo);

	public void updateQnaStatus(QnaVO qvo);

	public int getAdminOrdersList();

	public int getAdminQnaList();
	
	public List<MemberVO> membersList(HashMap pagingParams);

	public int getMemberList();

}

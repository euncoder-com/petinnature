package com.javaclass.repository;

import java.util.HashMap;
import java.util.List;

import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.domain.ReviewVO;

public interface ProductDAO {
	
	public List<ProductVO> getProductList(Integer start, String orderkey, String cate, String cate2, String cate3, String cate4, String pName, Integer minprice, Integer maxprice);
	public int getProductCnt(String cate, String cate2, String cate3, String cate4, String pName, Integer minprice, Integer maxprice);
	public List<ProductVO> getRecomProductList();
	
	//상품상세리뷰
		ProductVO getProductDetail(ProductVO vo);
		List<ReviewVO> getProductReview(HashMap pagingParams);
		Integer getPRTotalCount(Integer productNo);
		List<HashMap> getCartList(String id);
		void addCart(String productNo, Integer cnt, String id);
		void deleteCart(String productNo, String id);
		Integer checkCart(String productNo, String id);
		void updateCart(String productNo, Integer cnt, String id);
		
		
		List<HashMap> getOrderCartList(String id);
		Integer insertOrderinfo(OrderVO ovo);
		void insertOrderProduct(String productNo, String productPrice, String productCnt, String orderNo);
		void orderCartDelete(String id);

		HashMap getProductHashMap(ProductVO vo, String id);
		void updateTOP(OrderVO ovo);
		
		void updateProductCnt(Integer orderNo);
}

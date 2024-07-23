package com.javaclass.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.domain.ReviewVO;
import com.javaclass.repository.ProductDAO;

@Service
public class ShoppingServiceImpl implements ShoppingService{

	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductVO> getProductList(Integer start, String orderkey, String cate,
			String cate2, String cate3, String cate4, String pName, Integer minprice, Integer maxprice ) {
		return productDAO.getProductList(start,orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	public int getProductCnt(String cate, String cate2, String cate3, String cate4, String pName, Integer minprice, Integer maxprice) {
		return productDAO.getProductCnt(cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}


	@Override
	public List<ProductVO> getRecomProductList() {
		return productDAO.getRecomProductList();
	}

	//상품상세리뷰페이징
		@Override
		public ProductVO getProductDetail(ProductVO vo) {
			return productDAO.getProductDetail(vo);
		}

		@Override
		public List<ReviewVO> getProductReview(HashMap pagingParams) {
			return productDAO.getProductReview(pagingParams);
		}
		
		public Integer getPRTotalCount(Integer productNo) {
			return productDAO.getPRTotalCount(productNo);
		}

		@Override
		public List<HashMap> getCartList(String id) {
			return productDAO.getCartList(id);
		}

		@Override
		public void addCart(String productNo, Integer cnt, String id) {
			productDAO.addCart(productNo, cnt, id);
		}

		@Override
		public void deleteCart(String productNo, String id) {
			productDAO.deleteCart(productNo, id);
		}

		@Override
		public Integer checkCart(String productNo, String id) {
			return productDAO.checkCart(productNo, id);
		}

		@Override
		public void updateCart(String productNo, Integer cnt, String id) {
			productDAO.updateCart(productNo, cnt, id);
		}

		@Override
		public List<HashMap> getOrderCartList(String id) {
			return productDAO.getOrderCartList(id);
		}

		@Override
		public Integer insertOrderinfo(OrderVO ovo) {
			return productDAO.insertOrderinfo(ovo);
		}

		@Override
		public void insertOrderProduct(String productNo, String productPrice, String productCnt, String orderNo) {
			productDAO.insertOrderProduct(productNo, productPrice, productCnt, orderNo);
		}

		@Override
		public void orderCartDelete(String id) {
			productDAO.orderCartDelete(id);
		}

		@Override
		public HashMap getProductHashMap(ProductVO vo, String id) {
			return productDAO.getProductHashMap(vo,id);
		}
		@Override
		public void updateTOP(OrderVO ovo) {
			productDAO.updateTOP(ovo);
		}

		@Override
		public void updateProductCnt(Integer orderNo) {
			productDAO.updateProductCnt(orderNo);
			
		}




}

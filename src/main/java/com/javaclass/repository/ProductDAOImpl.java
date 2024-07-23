package com.javaclass.repository;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.domain.ReviewVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getProductList(Integer start, String orderkey, String cate,
			String cate2, String cate3, String cate4, String pName, Integer minprice, Integer maxprice){
		HashMap keyword = new HashMap();
		keyword.put("orderkey", orderkey);
		keyword.put("start", start);
		keyword.put("cate",cate);
		keyword.put("cate2",cate2);
		keyword.put("cate3", cate3);
		keyword.put("cate4", cate4);
		keyword.put("pName", pName);
		keyword.put("minprice", minprice);
		keyword.put("maxprice", maxprice);
		HashSet a = new HashSet();
		System.out.println(a);
		System.out.println("===> Mybatis getProductList() 호출");
		return mybatis.selectList("ProductDAO.getProductList", keyword);
	}

	public int getProductCnt(String cate, String cate2, String cate3, String cate4, String pName, Integer minprice, Integer maxprice) {
		HashMap keyword = new HashMap();
		keyword.put("catekey", 10);
		keyword.put("cate", cate);
		keyword.put("cate2", cate2);
		keyword.put("cate3", cate3);
		keyword.put("cate4", cate4);
		keyword.put("pName", pName);
		keyword.put("minprice", minprice);
		keyword.put("maxprice", maxprice);
		int total = mybatis.selectOne("ProductDAO.getProductCnt",keyword);
		System.out.println("페이지수 조회 !! : "+total);
		return total;
	}


	@Override
	public List<ProductVO> getRecomProductList() {

		return mybatis.selectList("ProductDAO.getRecomProductList");
	}
	
	
	//상품상세리뷰 페이징
		public ProductVO getProductDetail(ProductVO vo) {
			return mybatis.selectOne("ProductDAO.getProductDetail",vo);
		}
		@Override
		public List<ReviewVO> getProductReview(HashMap pagingParams) {
			return mybatis.selectList("ProductDAO.getProductReview",pagingParams);
		}
		public Integer getPRTotalCount(Integer productNo) {
			return mybatis.selectOne("ProductDAO.getPRTotalCount",productNo);
		}

		@Override
		public List<HashMap> getCartList(String id) {
			return mybatis.selectList("ProductDAO.getCartList",id);
		}

		@Override
		public void addCart(String productNo, Integer cnt, String id) {
			HashMap hm = new HashMap();
			hm.put("productNo",productNo);
			hm.put("cnt",cnt);
			hm.put("id", id);
			mybatis.insert("ProductDAO.addCart",hm);
		}

		@Override
		public void deleteCart(String productNo, String id) {
			System.out.println("장바구니삭제 호출");
			HashMap hm = new HashMap();
			hm.put("productNo",productNo);
			hm.put("id", id);
			mybatis.insert("ProductDAO.deleteCart",hm);
		}

		@Override
		public Integer checkCart(String productNo, String id) {
			System.out.println("장바구니체크 호출");
			HashMap hm = new HashMap();
			hm.put("productNo",productNo);
			hm.put("id", id);
			return mybatis.selectOne("ProductDAO.checkCart",hm);
		}

		@Override
		public void updateCart(String productNo, Integer cnt, String id) {
			System.out.println("장바구니체크 호출");
			HashMap hm = new HashMap();
			hm.put("productNo",productNo);
			hm.put("id", id);
			hm.put("cnt", cnt);
			mybatis.update("ProductDAO.updateCart",hm);
			//mybatis.update("ProductDAO.updateProductCnt",hm);
		}


		@Override
		public List<HashMap> getOrderCartList(String id) {
			return mybatis.selectList("ProductDAO.selectOrderCart",id);
		}

		@Override
		public Integer insertOrderinfo(OrderVO ovo) {
			return mybatis.insert("ProductDAO.insertOrderinfo",ovo);
		}

		@Override
		public void insertOrderProduct(String productNo, String productPrice, String productCnt, String orderNo) {
			HashMap hm = new HashMap();
			hm.put("no",productNo);
			hm.put("price", productPrice);
			hm.put("cnt", productCnt);
			hm.put("orderNo", orderNo);
			mybatis.update("ProductDAO.insertOrderProduct",hm);
		}

		@Override
		public void orderCartDelete(String id) {
		
			mybatis.delete("ProductDAO.orderCartDelete",id);
			
		}

		@Override
		public HashMap getProductHashMap(ProductVO vo, String id) {
			HashMap hm1 = mybatis.selectOne("ProductDAO.getProductHashMap",vo);
			HashMap hm2 = mybatis.selectOne("MemberDAO.getDiscountRate",id);
			hm1.putAll(hm2);
			return hm1;
		}

		@Override
		public void updateTOP(OrderVO ovo) {
			mybatis.update("MemberDAO.updateTOP",ovo);
		}

		@Override
		public void updateProductCnt(Integer orderNo) {
			mybatis.update("ProductDAO.updateProductCnt",orderNo);
			
		}
}

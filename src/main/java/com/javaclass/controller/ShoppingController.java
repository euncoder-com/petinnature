package com.javaclass.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.service.ShoppingService;

@Controller
@RequestMapping("shopping")
public class ShoppingController {

	@Autowired
	private ShoppingService productservice;
	
	void mainlist(Model m, String orderkey, String cate, String cate2,
						@RequestParam(value="cate3[]",required=false) List<String> cate3,
						@RequestParam(value="cate4[]",required=false) List<String> cate4,
						String pName, Integer minprice, Integer maxprice) {
		List list = new ArrayList();
		
		if(orderkey==null || orderkey.equals(""))orderkey="최신순";
		orderkey = orderChange(orderkey);
		
		String cate3s=null;
		String cate4s=null;
		if(cate3!=null)	cate3s = cateconvert(cate3);
		if(cate4!=null)	cate4s = cateconvert(cate4);
		
		list = productservice.getProductList(0,orderkey,cate,cate2,cate3s,cate4s, pName, minprice, maxprice);
		m.addAttribute("productlist",list);
		m.addAttribute("totalpage",getTotalCount(cate, cate2, cate3s, cate4s, pName, minprice, maxprice));
	}
	
	@RequestMapping("dogmain.do")
	public void dogmain(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		String cate= "강아지";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	@RequestMapping("dogfood.do")
	public void dogfood(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		if(cate2==null) cate2="사료";
		String cate="강아지";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	@RequestMapping("dogsnack.do")
	public void dogsnack(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		if(cate2==null) cate2="간식";
		String cate="강아지";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	@RequestMapping("dogtoy.do")
	public void dogtoy(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		if(cate2==null) cate2="장난감";
		String cate="강아지";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	@RequestMapping("catmain.do")
	public void catmain(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		String cate="고양이";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	@RequestMapping("catfood.do")
	public void catfood(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		String cate="고양이";
		if(cate2==null) cate2="사료";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	@RequestMapping("catsnack.do")
	public void catsnack(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		String cate="고양이";
		if(cate2==null) cate2="간식";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	@RequestMapping("cattoy.do")
	public void cattoy(Model m, String orderkey, Integer page, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		String cate="고양이";
		if(cate2==null) cate2="장난감";
		mainlist(m, orderkey, cate, cate2, cate3, cate4, pName, minprice, maxprice);
	}
	
	int getTotalCount(String cate, String cate2, String cate3, String cate4, 
			String pName, Integer minprice, Integer maxprice){
		// 데이터베이스의 레코드 수 검색
		int productCnt = productservice.getProductCnt(cate, cate2, cate3, cate4, pName, minprice, maxprice);
		
		// 레코드수에서 페이지수를 계산하기
		int pageTotalCount = productCnt / 9;
		if(productCnt%9>0) pageTotalCount++;
		
		// 화면에서의 페이지 수를 리턴
		return pageTotalCount;
	}
	
	String orderChange(String orderkey) {
		if(orderkey.equals("가격높은순")) {
			return "p.product_price desc";
		}
		else if(orderkey.equals("가격낮은순")) {
			return "p.product_price";
		}else{
			return "p.product_no desc";
		}
	}
	
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "shopping/"+step;
	}
		
	@ResponseBody
	@RequestMapping("listsort.do")
	public List<ProductVO> listsort(String orderkey, Integer page, String cate, String cate2, 
									@RequestParam(value="cate3[]",required=false) List<String> cate3,
									@RequestParam(value="cate4[]",required=false) List<String> cate4,
									String pName, Integer minprice, Integer maxprice){
		
		orderkey = orderChange(orderkey);
		
		String cate3s=null;
		String cate4s=null;
		if(cate3!=null)	cate3s = cateconvert(cate3);
		if(cate4!=null)	cate4s = cateconvert(cate4);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		list = productservice.getProductList(0,orderkey, cate, cate2, cate3s, cate4s, pName, minprice, maxprice);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("pagechange.do")
	public List<ProductVO> pagechange(String orderkey, Integer page, String cate, String cate2, 
								@RequestParam(value="cate3[]",required=false) List<String> cate3,
								@RequestParam(value="cate4[]",required=false) List<String> cate4,
								String pName, Integer minprice, Integer maxprice){
		
		System.out.println("페이징 호출");
		int startrow = 0;
		if(page != null) startrow = 9*(page-1);
		else page=1;
		
		orderkey = orderChange(orderkey);
		
		String cate3s=null;
		String cate4s=null;
		if(cate3!=null)	cate3s = cateconvert(cate3);
		if(cate4!=null)	cate4s = cateconvert(cate4);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		list = productservice.getProductList(startrow ,orderkey, cate, cate2, cate3s, cate4s, pName, minprice, maxprice);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("productlist.do")
	public List<ProductVO> dogfoodbrand(String orderkey, Integer page, String cate, String cate2,
							@RequestParam(value="cate3[]", required=false) List<String> cate3,
							@RequestParam(value="cate4[]", required=false) List<String> cate4,
							String pName, Integer minprice, Integer maxprice){
		int startrow = 0;
		if(page != null) startrow = 9*(page-1);
		else page=1;
		
		orderkey = orderChange(orderkey);
		
		String cate3s=null;
		String cate4s=null;
		if(cate3!=null)	cate3s = cateconvert(cate3);
		if(cate4!=null)	cate4s = cateconvert(cate4);
		
		System.out.println(cate+"/"+cate2+"/"+cate3+"/"+cate4);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		list = productservice.getProductList(startrow ,orderkey, cate, cate2, cate3s, cate4s, pName, minprice, maxprice);
		return list;
	}
	
	public String cateconvert(List<String> cate) {
		String cates = "";
		cates += cate.get(0);
		if (cate.size() > 1) {
			for (int i = 1; i < cate.size(); i++) {
				cates += "|" + cate.get(i);
			}
		}
		System.out.println("cate3 : " + cate);
		return cates;
	}
	
	@ResponseBody
	@RequestMapping("totalpage")
	public int totalpate(String orderkey, Integer page, String cate, String cate2,
			@RequestParam(value="cate3[]",required=false) List<String> cate3,
			@RequestParam(value="cate4[]",required=false) List<String> cate4,
			String pName, Integer minprice, Integer maxprice) {
		
		System.out.println("pName : "+pName);
		
		orderkey = orderChange(orderkey);
		
		String cate3s=null;
		String cate4s=null;
		if(cate3!=null)	cate3s = cateconvert(cate3);
		if(cate4!=null)	cate4s = cateconvert(cate4);
		
		int totalpage = productservice.getProductCnt(cate, cate2, cate3s, cate4s, pName, minprice, maxprice);
		return totalpage;
	}
	
	@RequestMapping("single-product.do")
	public String singleProduct(Model model, ProductVO product, HttpSession session, 
								HttpServletResponse response, String pageNum, @RequestParam("productNo") int pno) {
		
		System.out.println(product.toString());
		int pageSize = 5;

      
        	
        	System.out.println("상품상세 호출");
			/*
			 * m.addAttribute("reviewList",productservice.getProductReview(vo));
			 * m.addAttribute("product",productservice.getProductDetail(vo));
			 */
    		
    		int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum); // 현재 페이지 번호
            int startRow = (currentPage - 1) * pageSize; // 시작 행 번호
            int endRow = currentPage * pageSize; // 끝 행 번호
            
            
            HashMap pagingParams = new HashMap();
            System.out.println("ProductNo :" + product.getProductNo());
            pagingParams.put("id", product.getProductNo());
            pagingParams.put("startRow", startRow);
            pagingParams.put("endRow", endRow);
            pagingParams.put("pageSize", pageSize);
            pagingParams.put("productNo", pno);

            List reviewList = productservice.getProductReview(pagingParams);
            
            int totalCnt = productservice.getPRTotalCount(product.getProductNo());
            int totalPage = totalCnt / pageSize;
            if(totalCnt%pageSize!=0) totalPage++;
            
            model.addAttribute("reviewList", reviewList);
            model.addAttribute("currentPage", currentPage);
            model.addAttribute("totalPage", totalPage);
            model.addAttribute("product",productservice.getProductDetail(product));
            
       return "/shopping/single-product";
            
        		
		
	}
	
	//상품상세바로결제
	   @RequestMapping("buynow.do")
	   public String buynow(Model m, ProductVO vo, Model model, HttpSession session, 
	         HttpServletResponse response, String cnt) {
	      if(session.getAttribute("logname") == null) {
	              return "redirect:/member/login.do";
	       }else {
	          String id = (String)session.getAttribute("logname");
	         List<HashMap> li = new ArrayList<HashMap>();
	         System.out.println("상품상세 호출");
	         HashMap s = new HashMap();
	         s = productservice.getProductHashMap(vo, id);
	         float discount_rate = (float)(Integer)s.get("discount_rate");
	         float price = (float)(Integer)s.get("product_price");
	         s.put("discount", discount_rate/100*Float.parseFloat(cnt)*price);
	         s.put("cnt",cnt);
	         s.put("product_name", s.get("product_name").toString().length() >= 14 ?
	                     s.get("product_name").toString().substring(0, 14) + "<br/>"
	                           + s.get("product_name").toString().substring(14, s.get("product_name").toString().length()) : s.get("product_name").toString()
	               );
	         li.add(s);
	         m.addAttribute("buylist",li);

	         return "shopping/checkout";
	       }
	   }

	
	//상품상세 장바구니 담기
	@ResponseBody
	@RequestMapping("addCart.do")
	public void addcart(Model model, String productNo, Integer cnt, 
					HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("logname") != null) {
	        	String id = (String)session.getAttribute("logname");
	        	Integer check = productservice.checkCart(productNo, id);
	        	if(check>0) {
	        		System.out.println("productNo: "+productNo);
	        		productservice.updateCart(productNo, cnt, id);
	        	}
	        	else {
	        		System.out.println("상품추가");
	        		productservice.addCart(productNo, cnt, id);
	        	}
		}
	}
	
	//장바구니 상품삭제
		@RequestMapping("deleteCart.do")
		public String deleteCart(Model model, String productNo,
						HttpSession session, HttpServletResponse response) {
			if(session.getAttribute("logname") != null) {
		        	String id = (String)session.getAttribute("logname");
		        	productservice.deleteCart(productNo, id);
		        	return "redirect:cart.do";
			}
			return "redirect:cart.do";
		}
	
	//장바구니페이지출력
	@RequestMapping("cart.do")
	public String cart(Model model, HttpSession session, 
			HttpServletResponse response) {
		
		if(session.getAttribute("logname") == null) {
	           return "redirect:/member/login.do";
	        }else {
	        	String id = (String)session.getAttribute("logname");
	        	
	        	List<HashMap> hashMaps = productservice.getCartList(id);
				hashMaps.forEach(s->{
					s.put("product_name", s.get("product_name").toString().length() >= 14 ?
									s.get("product_name").toString().substring(0, 14) + "<br/>"
											+ s.get("product_name").toString().substring(14, s.get("product_name").toString().length()) : s.get("product_name").toString()
					);

				

				});
	        	
	        	model.addAttribute("cartlist",hashMaps);
	        	return "shopping/cart";
	        }
	}
	
	//장바구니주문하기
	@ResponseBody
	@RequestMapping("updatecart.do")
	public void updatecart(Model model, HttpSession session, 
			HttpServletResponse response, String productNo, Integer cnt) {
		String id = (String)session.getAttribute("logname");
		productservice.updateCart(productNo, cnt, id);
	}

	
	   //장바구니주문하기
	   @RequestMapping("checkout.do")
	   public String checkout(Model model, HttpSession session,
	                     HttpServletResponse response) {

	      System.out.println("주문호출");
	      String id = (String)session.getAttribute("logname");

	      List<HashMap> hashMaps = productservice.getOrderCartList(id);

	      hashMaps.forEach(s->{
	         s.put("product_name", s.get("product_name").toString().length() >= 14 ?
	               s.get("product_name").toString().substring(0, 14) + "<br/>"
	                     + s.get("product_name").toString().substring(14, s.get("product_name").toString().length()) : s.get("product_name").toString()
	         );

	      });

	      model.addAttribute("buylist",hashMaps);

	      return "shopping/checkout";
	   }
		
		
		
		//결제주문하기
		@ResponseBody
		@RequestMapping("checkoutOrder.do")
		public Integer checkoutOrder(Model model, HttpSession session, 
				HttpServletResponse response, OrderVO ovo) {
			System.out.println("주문호출");
			ovo.setId((String)session.getAttribute("logname"));
			System.out.println("1 : "+ovo);
			productservice.insertOrderinfo(ovo);
			
			
			//수정
			productservice.updateTOP(ovo);
			System.out.println("2 : "+ovo);

			
			
			
			return ovo.getOrderNo();
		}
		
		@ResponseBody
		@RequestMapping("checkoutOrder2.do")
		public void checkoutOrder2(Model model, HttpSession session, 
				HttpServletResponse response, Integer orderNo,
				@RequestParam(value="productNo[]",required=false) List<String> productNo,
				@RequestParam(value="productPrice[]",required=false) List<String> productPrice,
				@RequestParam(value="productCnt[]",required=false) List<String> productCnt) {
			System.out.println("주문호출");
			System.out.println(orderNo);
			for(int i=0; i<productNo.size(); i++) {
				productservice.insertOrderProduct(
					productNo.get(i), productPrice.get(i), productCnt.get(i), String.valueOf(orderNo));
			}
			
			productservice.updateProductCnt(orderNo);
			
		}

		
		//주문완료후 장바구니 삭제
		@RequestMapping("orderCartDelete.do")
		public void orderCartDelete(Model model, HttpSession session, 
				HttpServletResponse response) {
			
			String id = (String)session.getAttribute("logname");
			productservice.orderCartDelete(id);
		}
		

	
}

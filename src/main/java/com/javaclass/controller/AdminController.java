package com.javaclass.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javaclass.domain.AnswerVO;
import com.javaclass.domain.CategoryVO;
import com.javaclass.domain.MemberVO;
import com.javaclass.domain.OrderVO;
import com.javaclass.domain.ProductVO;
import com.javaclass.domain.QnaVO;
import com.javaclass.service.AdminService;
import com.javaclass.service.MemberService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;

	
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "admin/"+step;
	}
	
	@RequestMapping("dashboard.do")
	public String mypage_memberinfo(MemberVO vo, HttpSession session, HttpServletResponse response) {

		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				return "/admin/dashboard";
			}
		
			
			}
	
	
	}
	
	@ResponseBody
	@RequestMapping("chartList.do")
	public List<HashMap> chartList(String cate) {
		System.out.println(cate);
		List<HashMap> li = adminService.getSalesChart(cate);
		return li;
	}
	
	
	
	@RequestMapping("products.do")
	public String admin_productsinfo(MemberVO vo, ProductVO pvo, HttpSession session, HttpServletResponse response, Model model) {
		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				
				
				List<ProductVO> productVO = adminService.adminProductsList(pvo);

				model.addAttribute("list", productVO );
				model.addAttribute("productName", pvo.getProductName());
				return "/admin/products";

			
			
			}
		
			
			}

	}

	
	
	@RequestMapping("answer.do")
	public String qnaanswer(ProductVO pvo, MemberVO vo, QnaVO qvo , HttpSession session, HttpServletResponse response, Model model, @RequestParam("qNo") Integer qNo) {
		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				
				
				HashMap qna = adminService.selectQna(qNo);
				model.addAttribute("qnalist", qna);
				return "/admin/answer";

			
			
			}
		
			
			}

	}

	
	
	@RequestMapping("writeAnswer.do")
	public String writeAnswer(HttpServletRequest request, QnaVO qvo, AnswerVO avo, MemberVO vo, HttpSession session, HttpServletResponse response, Model model) {
		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				
				avo.setAdminid((String)session.getAttribute("logname"));
				avo.setQno(Integer.parseInt(request.getParameter("q_no")));
				avo.setAnswercontent(request.getParameter("answer_content"));
				qvo.setqNo(Integer.parseInt(request.getParameter("q_no")));
				adminService.writeAnswer(avo);
				adminService.updateQnaStatus(qvo);
				return "redirect:/admin/qna.do";

			
			
			}
		
			
			}

	}

	@RequestMapping("modify-product.do")
	public String modify_product(HttpServletRequest request, @ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo , MemberVO vo, HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				
				Integer originCateNo = Integer.parseInt(request.getParameter("origin_cate_no"));
				pvo.setProductName(request.getParameter("product_name"));
				pvo.setProductCnt(Integer.parseInt(request.getParameter("product_cnt")));
				pvo.setProductPrice(Integer.parseInt(request.getParameter("product_price")));
				pvo.setProductContent(request.getParameter("product_content"));
				
				cvo.setBig_cate(request.getParameter("big_cate"));
				cvo.setSmall_cate(request.getParameter("small_cate"));
				cvo.setCate_no(Integer.parseInt(request.getParameter("cate_no")));
				pvo.setProductNo(Integer.parseInt(request.getParameter("product_no")));
				
				
				
				adminService.modifyProduct(pvo, cvo, originCateNo);

				return "redirect:/admin/products.do";

			
			
			}
		
			
			}

	}

	
	
	
	@RequestMapping("add.do")
	public String add_product(HttpServletRequest request, @ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo , MemberVO vo, HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				
				pvo.setProductName(request.getParameter("product_name"));
				pvo.setProductCnt(Integer.parseInt(request.getParameter("product_cnt")));
				pvo.setProductPrice(Integer.parseInt(request.getParameter("product_price")));
				pvo.setProductContent(request.getParameter("product_content"));
			
				cvo.setCate_no(Integer.parseInt(request.getParameter("cate_no")));
				

				adminService.addProduct(pvo);
				
				Integer addProductNum = adminService.addProductNum();
				
				adminService.addTypeProduct(addProductNum, cvo);

				return "redirect:/admin/products.do";

			
			
			}
		
			
			}

	}
	
	
	@RequestMapping("modify-brand.do")
	public String edit_brand(HttpServletRequest request, MemberVO vo, CategoryVO cvo, HttpSession session, HttpServletResponse response, Model model) {
		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				
				Integer small_cate = Integer.parseInt(request.getParameter("small_cate"));
				Integer originCateNo = Integer.parseInt(request.getParameter("origin_cate_no"));
				Integer product_no = Integer.parseInt(request.getParameter("product_no"));
				
				adminService.modifyBrand(product_no, cvo, originCateNo, small_cate);

				
				return "redirect:/admin/products.do";
			
			
			}
		
			
			}

	}

	
	@PostMapping("/deleteProducts")
    public String deleteProducts(@RequestParam("productNo") List<Integer> productNos, RedirectAttributes redirectAttributes) {

		adminService.deleteCate(productNos);
		adminService.deleteProduct(productNos);


        return "redirect:/admin/products.do";
    }
	
	
	
	@RequestMapping("modify.do")
	public String edit_product(MemberVO vo, ProductVO pvo, HttpSession session, HttpServletResponse response, Model model, @RequestParam("pno") int pno) {
		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			Integer memberlv = memberService.memberlv(vo);
			
			if(memberlv==1) {
				return "redirect:/index2.do";
			
			}else {
				
				pvo.setProductNo(pno);
				List productTypeInfo = adminService.productTypeInfo(pvo);
				List productBrandInfo = adminService.productBrandInfo(pvo);
				
				
				model.addAttribute("productTypeInfo", productTypeInfo);
				model.addAttribute("productBrandInfo", productBrandInfo);
				
				return "/admin/modify-product";
			
			
			}
		
			
			}

	}
	
	
	@RequestMapping("order.do")
	public String admin_orderinfo(OrderVO vo, QnaVO qvo, HttpSession session, HttpServletResponse response, Model model, String pageNum) {

	int pageSize = 5;

		
        int currentPage = (pageNum == null || pageNum.trim().isEmpty()) ? 1 : Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize ; // 시작 행 번호
        int endRow = currentPage * pageSize; // 끝 행 번호
	
        HashMap pagingParams = new HashMap();
        pagingParams.put("orderNo", vo.getOrderNo());
        pagingParams.put("orderStatus", vo.getOrderstatus());
        pagingParams.put("address", vo.getRaddress());
        pagingParams.put("id", vo.getId());
        pagingParams.put("price", vo.getPrice());
        pagingParams.put("tel", vo.getRtel());
        pagingParams.put("payment", vo.getPayment());
        pagingParams.put("request", vo.getRequest());
        pagingParams.put("rdate", vo.getRdate());
        pagingParams.put("name", vo.getRname());
        pagingParams.put("startRow", startRow);
        pagingParams.put("endRow", endRow);
        pagingParams.put("pageSize", pageSize);
        
		
		List<OrderVO> order = adminService.adminOrdersList(pagingParams);
		
		int totalCnt = adminService.getAdminOrdersList();
        int totalPage = totalCnt / pageSize;
        if(totalCnt%pageSize!=0) totalPage++;

		
		model.addAttribute("orderlist", order);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		

		return "/admin/order";
	}
	
	
	
	
	@RequestMapping("qna.do")
	public String qnalist(OrderVO vo, QnaVO qvo, HttpSession session, HttpServletResponse response, Model model, String pageNum) {

		int pageSize = 5;

		
        int currentPage = (pageNum == null || pageNum.trim().isEmpty()) ? 1 : Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize ; // 시작 행 번호
        int endRow = currentPage * pageSize; // 끝 행 번호
        

        
        HashMap pagingParams = new HashMap();
        
        pagingParams.put("qNo", qvo.getqNo());
        pagingParams.put("productNo", qvo.getProductNo());
        pagingParams.put("orderNo", qvo.getOrderNo());
        pagingParams.put("id", qvo.getId());
        pagingParams.put("title", qvo.getTitle());
        pagingParams.put("content", qvo.getContent());
        pagingParams.put("qdate", qvo.getQdate());
        pagingParams.put("process", qvo.getProcess());
        pagingParams.put("qnaType", qvo.getQnaType());
        
        
        pagingParams.put("startRow", startRow);
        pagingParams.put("endRow", endRow);
        pagingParams.put("pageSize", pageSize);
		

		List<QnaVO> qna = adminService.adminQnaList(pagingParams);
		
		int totalCnt = adminService.getAdminQnaList();
        int totalPage = totalCnt / pageSize;
        if(totalCnt%pageSize!=0) totalPage++;

		model.addAttribute("qnalist", qna);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		

		return "/admin/qna";
	}

	@RequestMapping("adminUpdateOrderStatus.do")
	public String adminUpdateOrderStatus(OrderVO vo, HttpSession session, HttpServletResponse response, Model model) {

		int ok = adminService.adminUpdateOrderStatus(vo);
		return "redirect:/admin/order.do"; // 적절한 뷰 또는 리다이렉트 URL로 변경

	}

	@RequestMapping("accounts.do")
	public String admin_accountsinfo(MemberVO vo, HttpSession session, HttpServletResponse response, Model model, String pageNum) {

		

		int pageSize = 10;

			
	        int currentPage = (pageNum == null || pageNum.trim().isEmpty()) ? 1 : Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize ; // 시작 행 번호
	        int endRow = currentPage * pageSize; // 끝 행 번호
		
	        HashMap pagingParams = new HashMap();
	        pagingParams.put("address", vo.getAddress());
	        pagingParams.put("email", vo.getEmail());
	        pagingParams.put("gradeName", vo.getGradeName());
	        pagingParams.put("name", vo.getName());
	        pagingParams.put("id", vo.getId());
	        pagingParams.put("tel", vo.getTel());
	        pagingParams.put("totalOrderPrice", vo.getTotalOrderPrice());
	        pagingParams.put("startRow", startRow);
	        pagingParams.put("endRow", endRow);
	        pagingParams.put("pageSize", pageSize);
	        
		
		
		List<MemberVO> member = adminService.membersList(pagingParams);
		
		

		int totalCnt = adminService.getMemberList();
        int totalPage = totalCnt / pageSize;
        if(totalCnt%pageSize!=0) totalPage++;

		
		
		model.addAttribute("memberslist", member);
		model.addAttribute("name", vo.getName());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		
		
		return "/admin/accounts";
	}



}

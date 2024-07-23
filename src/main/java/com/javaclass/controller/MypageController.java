package com.javaclass.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.domain.MemberVO;
import com.javaclass.domain.OrderVO;
import com.javaclass.domain.QnaVO;
import com.javaclass.domain.ReviewVO;
import com.javaclass.service.MemberService;
import com.javaclass.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
    // 페이징 처리를 위한 기본 설정
	private int pageSize = 5; // 한 페이지에 보여줄 게시물 수
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;

	@Autowired
	private PasswordEncoder passwordEncoder;


	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "mypage/"+step;
	}


	@RequestMapping("mypage_memberinfo.do")
	public String mypage_memberinfo(MemberVO vo, HttpSession session, HttpServletResponse response, Model model) {

		if(session.getAttribute("logname") == null) {
			return "redirect:/member/login.do";
		}else {
			vo.setId((String)session.getAttribute("logname"));
			vo = memberService.getMember(vo);
			model.addAttribute("members", vo );

			return "/mypage/mypage_memberinfo";
		}
	}


	@RequestMapping("mypage_qna.do")
	public String mypage_qna(MemberVO vo, HttpSession session , HttpServletResponse response, Model model, String pageNum, Integer qno) {


		
		if(session.getAttribute("logname") == null) {
			
			return "redirect:/member/login.do";
			
		}else {
			
		        vo.setId((String)session.getAttribute("logname"));
		        
		        
		        int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum); // 현재 페이지 번호
		        int startRow = (currentPage - 1) * pageSize; // 시작 행 번호
		        int endRow = currentPage * pageSize;
		        
		        
		        HashMap pagingParams = new HashMap();
		        pagingParams.put("id", vo.getId());
		        pagingParams.put("startRow", startRow);
		        pagingParams.put("endRow", endRow);
		        pagingParams.put("pageSize", pageSize);
		        
		      
		        System.out.println(qno);
		        
		        
		        List qnaList = mypageService.getqnaList(pagingParams);
		        
		        int totalCnt = mypageService.getqnaTotalCount(vo.getId());
		        
		        int totalPage = totalCnt / pageSize;
	              if(totalCnt%pageSize!=0) totalPage++;


		        model.addAttribute("qnaList", qnaList);
		        model.addAttribute("currentPage", currentPage);
		        model.addAttribute("totalPage", totalPage);

		     
			
			return "/mypage/mypage_qna";
		}
		
		
		
	}
	
	

	@RequestMapping(value = "mypage_qna_answer.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String answer(@RequestParam("qno") Integer qno) {
	    String answer = mypageService.getAnswer(qno);
	    return answer;
	}
	
	
	
	@RequestMapping("writeqna.do")
	public String writeqna(@ModelAttribute QnaVO vo, HttpSession session, HttpServletResponse response) {
		
		vo.setId((String)session.getAttribute("logname"));
		mypageService.writeQna(vo);
		
		return "redirect:mypage_qna.do";

		
	}
	

	// 정보수정

	@RequestMapping("update_memberinfo.do") 
	public String updateMember(MemberVO vo) {

		String encodedPassword = passwordEncoder.encode(vo.getPass());
		vo.setPass(encodedPassword);
		memberService.updateMember(vo); 
		return "redirect:mypage_memberinfo.do?id="+vo.getId();
		
	}

	  
	  
	  // 후기삭제
	  
	  @RequestMapping("delete_review.do")
		public String deleteReview(ReviewVO vo) {
		  System.out.println(vo.getReview_no());
		  mypageService.deleteReview(vo);
			return "redirect:mypage_review.do";
		}
	  

	  // 후기(내역)페이징
	  
	  @RequestMapping("mypage_review.do")
	   public String mypage_review(MemberVO vo, HttpSession session , HttpServletResponse response, Model model, String pageNum) {
		  int pageSize = 5;

	      if(session.getAttribute("logname") == null) {
	         
	         return "redirect:/member/login.do";
	         
	      }else {
	         
	              vo.setId((String)session.getAttribute("logname"));
	              
	              
	              int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum); // 현재 페이지 번호
	              int startRow = (currentPage - 1) * pageSize ; // 시작 행 번호
	              int endRow = currentPage * pageSize; // 끝 행 번호
	              
	              
	              HashMap pagingParams = new HashMap();
	              pagingParams.put("id", vo.getId());
	              pagingParams.put("startRow", startRow);
	              pagingParams.put("endRow", endRow);
	              pagingParams.put("pageSize", pageSize);
	              
	            
	              List reviewList = mypageService.getreviewList(pagingParams);
	              
	              int totalCnt = mypageService.getreviewTotalCount(vo.getId());
	              int totalPage = totalCnt / pageSize;
	              if(totalCnt%pageSize!=0) totalPage++;
	              

	              model.addAttribute("reviewList", reviewList);
	              model.addAttribute("currentPage", currentPage);
	              model.addAttribute("totalPage", totalPage);
	              
	         return "/mypage/mypage_review";
	      }
	      
	      
	      
	   }


	 // 후기작성
	  @PostMapping("reviewWrite.do")
		public String insertReview( ReviewVO vo, HttpSession session , HttpServletResponse response) throws IOException {
		  
		  if(session.getAttribute("logname") == null) {
		         
		         return "redirect:/member/login.do";
		         
		      }else {
		    	  
		              vo.setId((String)session.getAttribute("logname"));
		 
		      System.out.println(vo.toString());
		  System.out.println("호출됬니");
		  mypageService.insertReview(vo);
			return "redirect:mypage_orderlist.do";
		}
	  
	  } 
	  
	  
	  // 주문내역페이징
	  @RequestMapping("mypage_orderlist.do")
	   public String mypage_orderlist(MemberVO vo, HttpSession session , HttpServletResponse response, Model model, String pageNum) {
		  int pageSize = 5;

	      if(session.getAttribute("logname") == null) {
	         
	         return "redirect:/member/login.do";
	         
	      }else {
	         
	              vo.setId((String)session.getAttribute("logname"));
	              
	              
	              int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum); // 현재 페이지 번호
	              int startRow = (currentPage - 1) * pageSize ; // 시작 행 번호
	              int endRow = currentPage * pageSize; // 끝 행 번호
	              
	              
	              HashMap pagingParams = new HashMap();
	              pagingParams.put("id", vo.getId());
	              pagingParams.put("startRow", startRow);
	              pagingParams.put("endRow", endRow);
	              pagingParams.put("pageSize", pageSize);
	              
	            
	              List orderList = mypageService.getorderList(pagingParams);


	              
	              int totalCnt = mypageService.getorderTotalCount(vo.getId());
	              System.out.println("1: "+totalCnt);
	              int totalPage = totalCnt / pageSize;
	              if(totalCnt%pageSize!=0) totalPage++;

	              model.addAttribute("orderList", orderList);
	              model.addAttribute("currentPage", currentPage);
	              model.addAttribute("totalPage", totalPage);
	              
	         return "/mypage/mypage_orderlist";
	      }
	      
	      
	      
	   }

	  
	  
	  @RequestMapping("order_cancel.do") 
	  public void getMemberList2(Model m, String order_no) { // [확인] 파라메터 출력 List list2 =
	  List list2 = mypageService.getMemberOrdercancel(order_no);
	  List list3 = mypageService.getMemberOrderinfo(order_no);
	  	System.out.println(order_no);
	  	System.out.println(list3.get(0).toString());
	   m.addAttribute("orderCancel", list2);
	   m.addAttribute("orderinfo", list3);
	  
	 }
	  
	  @ResponseBody
	  @RequestMapping("orderCancelDB.do")
	  public void orderCancelDB(Model m, String order_no) {
		  mypageService.orderCancelDB(order_no);
	  }
	 
	  @ResponseBody
		@RequestMapping("exituser")
		public Integer exituser(HttpSession session, @RequestParam(value = "newPassword") String newPassword, MemberVO vo) {
			System.out.println("호출맞니");
			String id = (String)session.getAttribute("logname");
			vo.setId(id);
			MemberVO passresult = memberService.passCheck(vo);

			if(passwordEncoder.matches(newPassword, passresult.getPass())) {

				Integer result = mypageService.exituser(id);
				session.removeAttribute("logname");
				return result;
		}
			return -1;
	  }

}

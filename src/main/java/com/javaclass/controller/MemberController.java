package com.javaclass.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javaclass.domain.MemberVO;
import com.javaclass.service.EmailService;
import com.javaclass.service.MemberService;

// ### (1) 해당 어노테이션 지정
@Controller
@RequestMapping("member")
public class MemberController {

	// ### (2) 해당 어노테이션 지정
	@Autowired
	private MemberService memberService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
    private EmailService emailService;
	
	@Autowired
    private JavaMailSender emailSender;



	//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	// 단지 경로 연결을 위해 @RequestMapping() public void ...(){} 이렇게 사용하지 않고
	// 이런식으로 주면 됨
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "member/"+step;
	}


	// ### (4) 해당 어노테이션 지정
	@ResponseBody
	@RequestMapping("loginform.do")
	public String login(MemberVO vo, HttpSession session, String id, String pass) {

		vo.setId(id);
		vo.setPass(pass);
		MemberVO idresult = memberService.idCheck(vo);

		if(idresult == null) {

			System.out.println("존재하지 않는 아이디");
			return "1";

		} else {
			


			MemberVO passresult = memberService.passCheck(vo);

			if(passwordEncoder.matches(vo.getPass(), passresult.getPass())) {


				session.setAttribute("logname", passresult.getId());
				session.setAttribute("membername", passresult.getName());
				System.out.println("로그인 성공");
				return "2";


			}else{

				System.out.println("비밀번호 불일치");	
				return "3";

			}
		}
	}



	@RequestMapping("join.do")
	public String join(MemberVO vo) {

		String encodedPassword = passwordEncoder.encode(vo.getPass());
		vo.setPass(encodedPassword);
		memberService.join(vo);
		return "redirect:login.do";
	}


	@ResponseBody
	@RequestMapping("idfind.do")
	public String idfind(MemberVO vo) {
		System.out.println("데이타:" + vo.toString());

		MemberVO result = memberService.idfind(vo);
		//return "member/loginFind";

		System.out.println("결과:" + result.toString());
		return result.getId();
	}

	@ResponseBody
	@RequestMapping("passfind.do")
	public String passfind(HttpServletRequest request, HttpSession session) {
		
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		String name = request.getParameter("name");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setName(name);
		vo.setTel(tel);
		vo.setEmail(email);
	    vo.setId(id);
		
		MemberVO result = memberService.passfind(vo);
	    
	    if (result != null) {
	        String verificationCode = emailService.generateVerificationCode();
	        
	        String subject = "비밀번호 변경시 필요한 인증번호입니다.";
	        
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(vo.getEmail());
	        message.setSubject(subject);
	        message.setText(verificationCode);
	        emailSender.send(message);
	        System.out.println(verificationCode);
	        session.setAttribute("verificationCode", verificationCode);
	        session.setAttribute("findId", vo.getId());
	        
	        return "success";
	    } else {
	        return "fail";
	    }
	}

	@RequestMapping("changepass.do")
	public String changepass(MemberVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
		String verificationCode = (String) session.getAttribute("verificationCode");
	    String findId = (String) session.getAttribute("findId");
	    
	    String enteredVerificationCode = request.getParameter("verificationCode");
	    System.out.println(enteredVerificationCode);
	    if (verificationCode != null && verificationCode.equals(enteredVerificationCode)) {
	        String encodedPassword = passwordEncoder.encode(vo.getPass());
	        vo.setId(findId);
	        vo.setPass(encodedPassword);

	        memberService.changepass(vo);
	        session.removeAttribute("verificationCode");
	        session.removeAttribute("findId");
	        
	        return "redirect:login.do";
	    } else {
	    	redirectAttributes.addFlashAttribute("error", "incorrectVerificationCode");
	    	return "redirect:loginFind.do";
	    }
	}

	
	@RequestMapping("login.do")
	public String loginpage(MemberVO vo) {
		return "/member/login";
	}


	@RequestMapping("idcheck.do")
	@ResponseBody
	public Integer idcheck(@RequestBody String id) {
		int count = 0;
		count = memberService.idcheck(id);
		System.out.println(count);
		return count;
	}




	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("logname");
		return "/member/login";
	}

}

package com.javaclass.service;

import java.util.HashMap;
import java.util.List;

import com.javaclass.domain.MemberVO;
import com.javaclass.domain.QnaVO;
import com.javaclass.domain.ReviewVO;

public interface MemberService {

	public MemberVO idCheck(MemberVO vo);
	public MemberVO passCheck(MemberVO vo);
	public void join(MemberVO vo);
	public MemberVO idfind(MemberVO vo);
	public MemberVO passfind(MemberVO vo);
	public void changepass(MemberVO vo);
	public Integer idcheck(String id);
	
	// 회원정보
	public MemberVO getMember(MemberVO vo);
	
	// 정보수정
	public void updateMember(MemberVO vo);
	
	
	//회원권한확인
	public Integer memberlv(MemberVO vo);
	
	

}

package com.javaclass.repository;

import com.javaclass.domain.MemberVO;

public interface MemberDAO {
	public MemberVO idCheck(MemberVO vo);
	public MemberVO passCheck(MemberVO vo);
	public void join(MemberVO vo);
	public MemberVO idfind(MemberVO vo);
	public MemberVO passfind(MemberVO vo);
	public void changepass(MemberVO vo);
	public Integer idcheck(String id);
	
	
	
	// 정보수정
		public void updateMember(MemberVO vo);
		
		//회원정보
		public MemberVO getMember(MemberVO vo);
		
		
		public Integer searchMemberLv(MemberVO vo);

	
	
}

package com.javaclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.javaclass.domain.MemberVO;
import com.javaclass.repository.MemberDAO;

//### (1) 해당 어노테이션 지정
// 하나여서 이름 지정하지 않아도 됨
@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{

	// ### (2) 해당 어노테이션 지정
	@Autowired
	private MemberDAO memberDAOImpl;
	

	
	public MemberVO idCheck(MemberVO vo) {

		return memberDAOImpl.idCheck(vo);
	}
	
	public MemberVO passCheck(MemberVO vo) {

		return memberDAOImpl.passCheck(vo);
	}

	
	public void join(MemberVO vo) {

	        memberDAOImpl.join(vo);
	    }
	
	public MemberVO idfind(MemberVO vo) {

        return memberDAOImpl.idfind(vo);
    }
	
	public MemberVO passfind(MemberVO vo) {

        return memberDAOImpl.passfind(vo);
    }

	public void changepass(MemberVO vo) {
		
		memberDAOImpl.changepass(vo);
	}


	public Integer idcheck(String id) {
		return memberDAOImpl.idcheck(id);
	}
	
	// 회원정보
	public MemberVO getMember(MemberVO vo) {
		return memberDAOImpl.getMember(vo);
	}
	
	
	// 정보수정
	public void updateMember(MemberVO vo) {
		memberDAOImpl.updateMember(vo);
	}

	@Override
	public Integer memberlv(MemberVO vo) {

		return memberDAOImpl.searchMemberLv(vo);
	}
    
	
}

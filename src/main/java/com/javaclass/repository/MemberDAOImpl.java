package com.javaclass.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.domain.MemberVO;

//### (1) 해당 어노테이션 지정
//하나여서 이름 지정하지 않아도 됨
@Repository("memberDAOImpl")
public class MemberDAOImpl implements MemberDAO{

	//### (2) 해당 어노테이션 지정
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//---------------------------------------------
	public MemberVO idCheck(MemberVO vo) {
		return sqlSession.selectOne("MemberDAO.idCheck", vo);
	}

	public MemberVO passCheck(MemberVO vo) {
		return sqlSession.selectOne("MemberDAO.passCheck", vo);
	}
	
	public MemberVO passfind(MemberVO vo) {
		return sqlSession.selectOne("MemberDAO.passfind", vo);
	}
	
	public MemberVO idfind(MemberVO vo) {
		return sqlSession.selectOne("MemberDAO.idfind", vo);
	}

	public void join(MemberVO vo) {
	    sqlSession.insert("MemberDAO.join", vo);
	}

	public void changepass(MemberVO vo) {

		sqlSession.update("MemberDAO.changepass", vo);
		
	}
	
	
	// 회원가입 유효성 
		public Integer idcheck(String id) {
			return sqlSession.selectOne("MemberDAO.idcheck2", id);
		}

		// 정보수정
		public void updateMember(MemberVO vo) {
			sqlSession.update("MemberDAO.updateMember", vo);
		}

		// 회원정보
		public MemberVO getMember(MemberVO vo) {
			return (MemberVO) sqlSession.selectOne("MemberDAO.getMember", vo);
		}

		@Override
		public Integer searchMemberLv(MemberVO vo) {

			return sqlSession.selectOne("MemberDAO.searchMemberLv", vo.getId());
		}



}

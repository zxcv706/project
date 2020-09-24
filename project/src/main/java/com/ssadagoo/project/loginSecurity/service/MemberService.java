package com.ssadagoo.project.loginSecurity.service;

import com.ssadagoo.project.domain.MemberVO;

public interface MemberService {
	
	void insertMember(MemberVO member);
	boolean hasUsername(String username);

}
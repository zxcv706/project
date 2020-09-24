package com.ssadagoo.project.dao;

import com.ssadagoo.project.domain.MemberVO;
import com.ssadagoo.project.domain.Users;

public interface MemberDAO {
	
	void insertMember(MemberVO member);
	boolean hasUsername(String username);
	void insertUsers(Users users, String role);

}
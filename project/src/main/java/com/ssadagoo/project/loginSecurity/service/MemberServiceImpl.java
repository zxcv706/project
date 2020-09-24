package com.ssadagoo.project.loginSecurity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssadagoo.project.dao.MemberDAO;
import com.ssadagoo.project.domain.MemberVO;
import com.ssadagoo.project.domain.Users;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	@Override
	public void insertMember(MemberVO memberVO) {

		String hashedPassword = ""; 
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		hashedPassword = passwordEncoder.encode(memberVO.getMemberPassword());
		log.info("hashedPassword : "+hashedPassword);
		
		Users users = new Users(memberVO.getMemberId(),	hashedPassword,	1);

		memberDAO.insertUsers(users, "ROLE_USER");
		memberDAO.insertMember(memberVO);
	}

	@Transactional(readOnly = true)
	@Override
	public boolean hasUsername(String username) {
		return memberDAO.hasUsername(username);
	}

}

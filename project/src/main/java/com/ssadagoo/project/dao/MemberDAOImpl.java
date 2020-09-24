package com.ssadagoo.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssadagoo.project.domain.MemberVO;
import com.ssadagoo.project.domain.Users;
import com.ssadagoo.project.loginSecurity.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO member) {
		
		log.info("insertMember");

		sqlSession.getMapper(UserMapper.class).insertMember(member);
	}
	
	@Override
	public boolean hasUsername(String username) {

		log.info("hasUsername");
		
		return sqlSession.getMapper(UserMapper.class)
						 .hasUsername(username) == 1 ? true : false;
	} //

	@Override
	public void insertUsers(Users users, String role) {

		log.info("insertUsers");
		
		sqlSession.getMapper(UserMapper.class)
				  .insertUser(users);
		
		sqlSession.getMapper(UserMapper.class)
		  		  .insertUserRoles(users.getUsername(), role);
	} //

}
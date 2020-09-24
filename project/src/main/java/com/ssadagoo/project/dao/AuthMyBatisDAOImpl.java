/**
 * 
 */
package com.ssadagoo.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssadagoo.project.domain.Users;
import com.ssadagoo.project.loginSecurity.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

/**
 * @author 
 *
 */
@Repository
@Slf4j
public class AuthMyBatisDAOImpl implements AuthMyBatisDAO {
	
	@Autowired
	private SqlSession sqlSession;

	/**
	 * @see com.ssadagoo.project.dao.AuthMyBatisDAO.springSecuritySample1.service.AuthMyBatisService#hasUsername(java.lang.String)
	 */
	@Override
	public boolean hasUsername(String username) {

		log.info("hasUsername");
		
		return sqlSession.getMapper(UserMapper.class)
						 .hasUsername(username) == 1 ? true : false;
	} //

	/**
	 * @see com.ssadagoo.project.dao.AuthMyBatisDAO.springSecuritySample1.service.AuthMyBatisService#insertUsers(com.ssadagoo.project.domain.javateam.springSecuritySample1.vo.Users, java.lang.String)
	 */
	@Override
	public void insertUsers(Users users, String role) {

		log.info("insertUsers");
		
		sqlSession.getMapper(UserMapper.class)
				  .insertUser(users);
		
		sqlSession.getMapper(UserMapper.class)
		  		  .insertUserRoles(users.getUsername(), role);
	} //

	
	

} //
/**
 * 
 */
package com.ssadagoo.project.loginSecurity.mapper;

import org.apache.ibatis.annotations.Param;

import com.ssadagoo.project.domain.MemberVO;
import com.ssadagoo.project.domain.Role;
import com.ssadagoo.project.domain.Users;

/**
 * mapper
 * 
 * @author 
 *
 */
public interface UserMapper {
	
	Users getUserByUsername(String userName);
	Role getUserRolesByUsername(String userName);
	
	int hasUsername(String username);
	
	Users loadUserByUsername(String userName);
	void insertMember(MemberVO memberVO);
	void insertUser(@Param("users") Users users);
	void insertUserRoles(@Param("username") String username, 
						 @Param("role") String role);

}
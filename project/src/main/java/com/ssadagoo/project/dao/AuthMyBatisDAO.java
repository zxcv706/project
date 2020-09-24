/**
 * 
 */
package com.ssadagoo.project.dao;

import com.ssadagoo.project.domain.Users;

/**
 * @author 
 *
 */
public interface AuthMyBatisDAO {
	
	boolean hasUsername(String username);
	void insertUsers(Users users, String role);

} //
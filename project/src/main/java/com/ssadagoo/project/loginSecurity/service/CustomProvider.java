package com.ssadagoo.project.loginSecurity.service;
 
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 
import javax.sql.DataSource;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.ssadagoo.project.domain.CustomUser;
import com.ssadagoo.project.domain.Role;

import lombok.extern.java.Log;
 
@Component
@Log
public class CustomProvider
        implements AuthenticationProvider, UserDetailsService {
   
    private JdbcTemplate jdbcTemplate;
   
    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
   
    @Override
    public CustomUser loadUserByUsername(String userName) {
       
        log.info("loadUserByUsername");
       
        try {
            return (CustomUser)jdbcTemplate.queryForObject(
                     "SELECT * FROM users WHERE username=?",
                     new Object[]{ userName },
                     new BeanPropertyRowMapper<CustomUser>(CustomUser.class));
        } catch (EmptyResultDataAccessException e) {
            log.info("error1");
            return null;
        }
 
    }
   
    private Role loadUserRole(String userName) {
       
        log.info("loadUserRole");
       
        try {
            return (Role)jdbcTemplate.queryForObject(
                    "SELECT username, role FROM user_roles WHERE username=?",
                     new Object[]{ userName },
                     new BeanPropertyRowMapper<Role>(Role.class));
        } catch (EmptyResultDataAccessException e) {
            log.info("error2");
            return null;
        }
       
    }
   
    @Override
    public Authentication authenticate(Authentication authentication)
                throws AuthenticationException {
       
        log.info("authenticate");
       
        String username = authentication.getName();
        String password = (String) authentication.getCredentials();
       
        log.info("#### 계정명 : "+ username);
 
        CustomUser user = null;
        Collection<? extends GrantedAuthority> authorities = null;
       
        try {
                user = this.loadUserByUsername(username);
                log.info("#### user : "+user);   
                Role role = this.loadUserRole(username);
               
                // 사용자 계정 유무 점검 : 추가
                if (user == null) {                
                    throw new UsernameNotFoundException("사용자 계정이 없습니다.");
                }              
                               
                List<Role> roles = new ArrayList<Role>();
                roles.add(role);       
                user.setAuthorities(roles);
               
                BCryptPasswordEncoder passwordEncoder
                    = new BCryptPasswordEncoder();
               
                if (passwordEncoder.matches(password, user.getPassword()))
                    log.info("비밀번호 일치 !"); 
                else {
                    throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
                }
 
                authorities = user.getAuthorities();
               
        } catch(UsernameNotFoundException e) {
            log.info(e.toString());
            throw new UsernameNotFoundException(e.getMessage());            
        } catch(BadCredentialsException e) {
            log.info(e.toString());
            throw new BadCredentialsException(e.getMessage());
        } catch(Exception e) {
            log.info(e.toString());
            e.printStackTrace();
        }
       
        return new UsernamePasswordAuthenticationToken(user, password, authorities);
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        // 추가
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
 
} //

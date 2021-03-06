package com.ssadagoo.project;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.ssadagoo.project.domain.StoreDTO;
import com.ssadagoo.project.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {  
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",  
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"  
      })  
@WebAppConfiguration  
@Slf4j  
public class ViewProductTest2 {
	
	@Autowired
	private StoreService storeService;
	
	@Test
	public void test() {
		
		assertEquals(20, storeService.getAllStoresDetails().size());
	} 

}

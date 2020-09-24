package com.ssadagoo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssadagoo.project.domain.StoreProductDTO;
import com.ssadagoo.project.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/store")
	public String home(Model model) {
		
		log.info("점포 현황 !");
		
        // HTTP Header 정보 setting
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		
		// 매장 정보 : 20개의 점포, 상품 5개 제한
		// 매장 아이디, 매장명, 위도/경도 좌표, 상품명, 원산지, 그램당 가격 
		List<StoreProductDTO> stores = storeService.getAllStoresDetails();
		
		ObjectMapper om = new ObjectMapper();
		String json = "";
		
		try {
			json = om.writeValueAsString(stores);
		} catch (JsonProcessingException e) {
			log.error("json 변환 실패");
			e.printStackTrace();
		}
		
		for (StoreProductDTO s : stores) {
			log.info("s : " + s);
		}
		
		model.addAttribute("stores", json);
				
		return "/map/map.jsp";
	}
	
}
package com.ssadagoo.project.service;

import java.util.List;

import com.ssadagoo.project.domain.FoodVO;

public interface FoodService {
	
	String getUrl(String food);
	
	/**
	 * 전체 음식 조회(paging 적용)
	 * 
	 * @param page 현재 페이지
	 * @param limit 페이지 당 음식 수
	 * @return 음식들
	 */
	List<FoodVO> getFoodsByPage(int page, int limit);
	
	/**
	 * 전체 음식 조회(paging 적용)
	 * 
	 * @param foodCate 음식 카테고리 ex) 한식,중식 ...
	 * @param page 현재 페이지
	 * @param limit 페이지 당 음식 수
	 * @return 음식들
	 */
	List<FoodVO> getFoodsByCatePage(String foodCate,int page, int limit);

}

/**
 * 
 */
package com.ssadagoo.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssadagoo.project.domain.FoodVO;
import com.ssadagoo.project.service.FoodService;

import lombok.extern.slf4j.Slf4j;

/**
 * @author Administrator
 *
 */
@Controller

@Slf4j
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	FoodService foodService;
	
	@RequestMapping("/foods")
	public String chinese(@RequestParam("foodCate") String foodCate,
			@RequestParam("page") int page, Model model) {
		log.info("foods");
		
		String foodFolder;
		
		foodFolder=foodCate.equals("한식") ? "korean" :
				   foodCate.equals("중식") ? "chinese" :
			       foodCate.equals("일식") ? "japanese":
			       foodCate.equals("양식") ? "american": "etc"; 
		
		model.addAttribute("foods",foodService.getFoodsByCatePage(foodCate, page, 9));
		model.addAttribute("foodCate",foodCate);
		model.addAttribute("foodFolder",foodFolder);
		
		return "/recipe/recipe.jsp";
	}
	
	/*
	 * @RequestMapping("/tmp_korean") public String tmp_korean(Model model) {
	 * 
	 * 
	 * String[][]foods = { {"한식","간장닭조림","짭조름한 간장과 닭의 콜라보레이션!!","2간장닭조림.jpg"},
	 * {"한식","갈비찜","사랑받는 사위를 위한 장모님의 정성듬뿍 음식!","2갈비찜.jpg"},
	 * {"한식","고구마맛탕","달콤하고 부드러운 영양만점 고구마간식!!","2고구마맛탕.jpg"},
	 * {"한식","굴떡국","새해가되면 만들어먹는 스페셜한 떡국!!","2굴떡국.jpg"},
	 * {"한식","궁중떡뽁이 "," 임금님도 반했다! 고오급떡볶이","2궁중떡뽁이.jpg"},
	 * {"한식","김밥","소풍하면 떠오르는 음식의 대명사","2김밥.jpg"},
	 * {"한식","김치찌개","비오는날 소주한잔과 함께하면 끝장!","2김치찌개.jpg"},
	 * {"한식","두부간장조림"," 고소한 두부를 한층 업그레이드시킨다!","2두부간장조림.jpg"},
	 * {"한식","만두국","제대앞둔 말년병장도 벌떡 !","2만두국.jpg"},
	 * {"한식","메밀전병"," 시장가면 꼭 먹어야하는 베스트오브베스트","2메밀전병.jpg"},
	 * {"한식","모듬전"," 막걸리와 단짝친구 술한병 홀딱","2모듬전.jpg"},
	 * {"한식","배숙","달달한 감기몸살 자연치료제!","2배숙.jpg"},
	 * {"한식","버터계란밥","초스피드 간단 식사","2버터계란밥.jpg"},
	 * {"한식","부대찌개","햄요리의 끝판왕 밥세공기뚝딱!","2부대찌개.jpg"},
	 * {"한식","비빔라면","더운 여름날 매콤새콤한 비빔라면 후루룩","2비빔라면.jpg"},
	 * {"한식","소고기장조림","뜨끈한 밥에 쓱싹 최고의반찬","2소고기장조림.jpg"},
	 * {"한식","소불고기","온가족이 함께 즐거운식사의 지름길","2소불고기.jpg"},
	 * {"한식","순두부계란국","씹지않고 식도로 바로 토스!!","2순두부계란국.jpg"},
	 * {"한식","순두부찌개","칼칼한 국물이 위장을 가격한다!","2순두부찌개.jpg"},
	 * {"한식","어묵국","어묵에서 나온 육수가 시너지효과를!","2어묵국.jpg"},
	 * {"한식","얼큰수제비"," 김치 한점 올려서 후루룩!","2얼큰수제비.jpg"},
	 * {"한식","오징어볶음","바다속 오징어가 내혓속에서 꿈틀!","2오징어볶음.jpg"},
	 * {"한식","육개장","호불호 안갈리는 뜨끈한 국물","2육개장.jpg"},
	 * {"한식","잡채","생일날 잔치상에 대표주자","2잡채.jpg"},
	 * {"한식","짜빠구리","기생충 흥행 일등공신!","2짜빠구리.jpg"},
	 * {"한식","치즈계란말이","치즈와 계란이라는 깡패조합!","2치즈계란말이.jpg"},
	 * {"한식","팥죽","귀신은 물럿거라! 전통있는 우리음식","2팥죽.jpg"} };
	 * 
	 * List<FoodVO> foodlist = new ArrayList<>(); FoodVO foodVo = null; for(int i=0;
	 * i<foods.length; i++) { foodVo = new FoodVO(foods[i]);
	 * foodVo.setUrl(foodService.getUrl(foodVo.getFoodName()));
	 * foodlist.add(foodVo); } model.addAttribute("koreanfoods", foodlist);
	 * 
	 * return "/recipe/recipe(한식)2.jsp"; }
	 */
	

}

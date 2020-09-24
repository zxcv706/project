package com.ssadagoo.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssadagoo.project.domain.FoodVO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FoodDAOImpl implements FoodDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FoodVO> getFoodsByPage(int page, int limit) {
		Map<String, Integer> map = new HashMap<>();
		map.put("page", page);
		map.put("limit", limit);
		return sqlSession.selectList("mapper.food_mapper.getFoodsByPage", map);
	}

	@Override
	public List<FoodVO> getFoodsByCatePage(String foodCate, int page, int limit) {
		log.info("foodCate:" + foodCate);
		Map<String, Object> map = new HashMap<>();
		map.put("foodCate",foodCate);
		map.put("page", page);
		map.put("limit", limit);
		return sqlSession.selectList("mapper.foodMapper.getFoodsByCatePage", map);
	}

}

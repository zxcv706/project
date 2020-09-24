package com.ssadagoo.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssadagoo.project.domain.ProductVO;
import com.ssadagoo.project.domain.StoreDTO;
import com.ssadagoo.project.domain.StoreVO;

@Repository
public class ProductDAOimpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StoreVO> getAllStores() {
		return sqlSession.selectList("mapper.MapMapper.getAllStores");
	}

	@Override
	public List<ProductVO> getAllProducts() {
		return sqlSession.selectList("mapper.MapMapper.getAllProducts");
	}

	@Override
	public List<StoreDTO> getAllProductsByStores() {
		return sqlSession.selectList("mapper.MapMapper.getAllProductsByStores");
	}

	@Override
	public List<ProductVO> getProductsByStoreName(String storename) {
		return sqlSession.selectList("mapper.MapMapper.getProductsByStoreName",storename);
	}

}

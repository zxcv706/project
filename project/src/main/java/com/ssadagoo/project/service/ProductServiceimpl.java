package com.ssadagoo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssadagoo.project.dao.ProductDAO;
import com.ssadagoo.project.domain.ProductVO;
import com.ssadagoo.project.domain.StoreDTO;
import com.ssadagoo.project.domain.StoreVO;

@Service
public class ProductServiceimpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Transactional(readOnly=true)
	@Override
	public List<StoreVO> getAllStores() {
		return productDAO.getAllStores();
	}
	
	@Transactional(readOnly=true)
	@Override
	public List<ProductVO> getAllProducts() {
		return productDAO.getAllProducts();
	}

	@Transactional(readOnly=true)
	@Override
	public List<StoreDTO> getAllProductsByStores() {
		return productDAO.getAllProductsByStores();
	}

	@Transactional(readOnly=true)
	@Override
	public List<ProductVO> getProductsByStoreName(String storename) {
		return productDAO.getProductsByStoreName(storename);
	}

}

package com.ssadagoo.project.service;

import java.util.List;

import com.ssadagoo.project.domain.ProductVO;
import com.ssadagoo.project.domain.StoreDTO;
import com.ssadagoo.project.domain.StoreVO;

public interface ProductService {

	/**
	 * 전체 점포 현황 조회
	 * @return
	 */
	List<StoreVO> getAllStores();
	
	/**
	 *  전체 상품 조회
	 * @return
	 */
	List<ProductVO> getAllProducts();

	/**
	 * 전체 점포 상품 현황 조회
	 * @return
	 */
	List<StoreDTO> getAllProductsByStores(); 
	
	/**
	 * 특정 점포 상품 현황 조회
	 * @param storename
	 * @return
	 */
	List<ProductVO> getProductsByStoreName(String storename);

}

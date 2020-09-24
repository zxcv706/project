package com.ssadagoo.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssadagoo.project.domain.StoreProductDTO;
import com.ssadagoo.project.domain.StoreVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	ProductService productService;
	
	@Override
	public List<StoreProductDTO> getAllStoresDetails() {

		log.info("전체 점포 현황 조회");
		List<StoreProductDTO> storeProducts = new ArrayList<>();
		List<StoreVO> stores = productService.getAllStores();
		StoreProductDTO storeProductDTO = null;
		String storeName ="";
		
		for(int i = 0; i < stores.size(); i++) {
			storeProductDTO = new StoreProductDTO();
			storeName = stores.get(i).getStoreName();
			storeProductDTO.setProductList(productService.getProductsByStoreName(storeName));
			storeProductDTO.setStoreName(stores.get(i).getStoreName());
			storeProductDTO.setLatitude(stores.get(i).getLatitude());
			storeProductDTO.setLongitude(stores.get(i).getLongitude());
			storeProductDTO.setStoreAddress1(stores.get(i).getStoreAddress1());
			storeProductDTO.setStoreAddress2(stores.get(i).getStoreAddress2());
			storeProducts.add(storeProductDTO);
			log.info("----stores : "+stores.get(i));
		}
		
		return storeProducts;
	}

}

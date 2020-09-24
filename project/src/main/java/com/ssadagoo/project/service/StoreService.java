package com.ssadagoo.project.service;

import java.util.List;

import com.ssadagoo.project.domain.StoreProductDTO;
import com.ssadagoo.project.domain.StoreVO;

public interface StoreService {
	
	List<StoreProductDTO> getAllStoresDetails();

}
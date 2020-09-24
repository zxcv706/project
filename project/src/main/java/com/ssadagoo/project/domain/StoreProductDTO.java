package com.ssadagoo.project.domain;

import java.util.List;

import lombok.Data;

@Data
public class StoreProductDTO {
	
	/** 점포명 */
	private String storeName;
	/** 점포 위도 */
	private double latitude;
	/** 점포 경도 */
	private double longitude;
	/** 점포 주소1 */
	private String storeAddress1;
	/** 점포 주소2 */
	private String storeAddress2;
	/** 점포 상품 보유 현황 */
	private List<ProductVO> productList;
}



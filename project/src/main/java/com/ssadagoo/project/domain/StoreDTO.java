package com.ssadagoo.project.domain;

import lombok.Data;

@Data
public class StoreDTO {
	
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
	/** 상품명 */ 
	private String productName;
	/** 상품 원산지 */
	private String productOrigin;
	/** 상품 단가 : 그램당 단가 */
	private float productPrice;
	/** 상품 수량 */
	private int productQuantity;
	/** 상품 수량 단위 */
	private String productQuantityUnit;
}



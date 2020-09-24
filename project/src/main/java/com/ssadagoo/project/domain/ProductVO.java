package com.ssadagoo.project.domain;

import lombok.Data;

@Data
public class ProductVO {

	/** 상품 아이디 */
	private int productId;
	/** 가게 이름 */
	private String storeName;
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
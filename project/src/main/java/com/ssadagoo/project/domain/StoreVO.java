package com.ssadagoo.project.domain;

import lombok.Data;

@Data
public class StoreVO {
	
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
	

}

package com.ssadagoo.project.domain;

public class FoodVO {
	
	/** 음식 아이디 */
	private int foodId;
	
	/** 음식 카테고리 */
	private String foodCate;
	
	/** 음식명 */
	private String foodName;
	
	/** 음식 설명 */
	private String foodDetail;
	
	/** 음식 이미지 */
	private String foodImg;
	
	/** youtube url */
	private String url;
	
	public FoodVO() {}

	public FoodVO(String[] arr) {
		
		this.foodCate = arr[0];
		this.foodName = arr[1];
		this.foodDetail = arr[2];
		this.foodImg = arr[3];
	}

	public int getFoodId() {
		return foodId;
	}

	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}

	public String getFoodCate() {
		return foodCate;
	}

	public void setFoodCate(String foodCate) {
		this.foodCate = foodCate;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodDetail() {
		return foodDetail;
	}

	public void setFoodDetail(String foodDetail) {
		this.foodDetail = foodDetail;
	}

	public String getFoodImg() {
		return foodImg;
	}

	public void setFoodImg(String foodImg) {
		this.foodImg = foodImg;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "FoodVO [foodId=" + foodId + ", foodCate=" + foodCate + ", foodName=" + foodName + ", foodDetail="
				+ foodDetail + ", foodImg=" + foodImg + ", url=" + url + "]";
	}
	
}

package com.ssadagoo.project.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private String memberId;
	private String memberPassword;
	private String memberNickname;
	private String memberName;
	private String memberGender;
	private String memberEmail;
	private String memberPhone;
	private String memberBirth;
	private String memberZip;
	private String memberAddressBasic;
	private String memberAddressDetail;

}
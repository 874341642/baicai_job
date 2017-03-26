package com.baicai.job.business.test.vo;

import java.io.Serializable;
import java.util.Date;

public class CustomerUser implements Serializable {

	private static final long serialVersionUID = 8357785626985932152L;

	private String userId;

	private String userName;

	private Date userBirthday;

	private Double userSalary;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId == null ? null : userId.trim();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public Double getUserSalary() {
		return userSalary;
	}

	public void setUserSalary(Double userSalary) {
		this.userSalary = userSalary;
	}
}
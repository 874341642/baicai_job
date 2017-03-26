package com.baicai.job.business.test.dao;

import com.baicai.job.business.test.vo.CustomerUser;

public interface ITestDao {
	
	int deleteByPrimaryKey(String userId);

	int insert(CustomerUser record);

	int insertSelective(CustomerUser record);

	CustomerUser selectByPrimaryKey(String userId);

	int updateByPrimaryKeySelective(CustomerUser record);

	int updateByPrimaryKey(CustomerUser record);
}
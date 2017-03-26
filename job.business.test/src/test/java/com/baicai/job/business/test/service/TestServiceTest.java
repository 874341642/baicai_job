package com.baicai.job.business.test.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.omg.CORBA.portable.ApplicationException;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.baicai.job.business.test.vo.CustomerUser;
import com.baicai.job.test.common.BaseJunit4Test;
import com.google.gson.Gson;

public class TestServiceTest extends BaseJunit4Test {

	@Inject
	private ITestService testService;

	@Test // 标明是测试方法
	@Transactional // 标明此方法需使用事务
	@Rollback(false) // 标明使用完此方法后事务不回滚,true时为回滚
	public void testFindUser() {
		List<CustomerUser> customerUserList = null;
		try {
			customerUserList = testService.findUser("1");
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
		System.out.println(customerUserList);
		Gson gson = new Gson();
		String json = gson.toJson(customerUserList);
		System.out.println(json);
		assertTrue(customerUserList != null && customerUserList.size() > 0);
	}

}

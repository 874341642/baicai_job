package com.baicai.job.member.login.service;

import static org.junit.Assert.assertTrue;

import javax.inject.Inject;

import org.junit.Test;
import org.omg.CORBA.portable.ApplicationException;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

public class MemberServiceTest {

	@Inject
	private IMemberService memberService;

	@Test // 标明是测试方法
	@Transactional // 标明此方法需使用事务
	@Rollback(false) // 标明使用完此方法后事务不回滚,true时为回滚
	public void testMemberLogin() {
		boolean flag = false;
		String account = "wangyaozu";
		String password = "123456";
		try {
			flag = memberService.memberLogin(account, password);
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
		assertTrue(flag == true);
	}

}

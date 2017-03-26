package com.baicai.job.member.login.service;

import static org.junit.Assert.assertTrue;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.baicai.job.common.ApplicationException;
import com.baicai.job.common.MD5Util;
import com.baicai.job.test.common.BaseJunit4Test;

public class MemberServiceTest extends BaseJunit4Test {

	@Inject
	private IMemberService memberService;

	@Test // 标明是测试方法
	@Transactional // 标明此方法需使用事务
	@Rollback(false) // 标明使用完此方法后事务不回滚,true时为回滚
	public void testMemberLogin() {
		boolean flag = false;
		String account = "wangyaozu";
		String password = "123456";
		String encodePassword = null;
		try {
			encodePassword = MD5Util.EncoderByMd5(password);
			System.out.println(encodePassword);
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		try {
			flag = memberService.memberLogin(account, encodePassword);
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
		assertTrue(flag == true);
	}

}

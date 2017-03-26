package com.baicai.job.member.login.service;

import javax.inject.Inject;
import javax.inject.Named;

import com.baicai.job.member.login.dao.IMemberDao;

@Named
public class MemberService implements IMemberService
{
	@Inject
	private IMemberDao memberDao;
	
	@Override
	public Boolean memberLogin(String account, String password) {
		return memberDao.findUserLogin(account, password);
	}
    
}

package com.baicai.job.web.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baicai.job.member.login.service.IMemberService;



@Controller  
@Scope("prototype")
@RequestMapping("/member")
public class MemberController {

	@Resource
	private IMemberService memberService;
	
	@ResponseBody
	@RequestMapping("/memberLogin")
	public void memberLogin(String account,String password)
	{
		Boolean result=memberService.memberLogin(account, password);
		System.out.println(result);
	}
}

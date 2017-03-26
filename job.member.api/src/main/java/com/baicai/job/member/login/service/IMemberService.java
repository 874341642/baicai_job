package com.baicai.job.member.login.service;

import com.baicai.job.common.ApplicationException;

/** @Package com.baicai.job.member.api  
 * @ClassName IMemberService  
 * @author 刘小军
 * @date 2017年3月25日 下午6:05:13    
 */
public interface IMemberService {
	public  Boolean  memberLogin(String account,String password) throws ApplicationException;
	
}

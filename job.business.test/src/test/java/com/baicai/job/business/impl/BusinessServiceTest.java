package com.baicai.job.business.impl;

import static org.junit.Assert.assertTrue;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.baicai.job.business.test.dao.ITestDao;
import com.baicai.job.business.test.vo.CustomerUser;
import com.baicai.job.test.common.BaseJunit4Test;
import com.google.gson.Gson;

public class BusinessServiceTest extends BaseJunit4Test{
	
	
	@Inject  //自动注入,默认按名称  
    private ITestDao testDao;   
 
@Test   //标明是测试方法  
@Transactional   //标明此方法需使用事务  
@Rollback(false)  //标明使用完此方法后事务不回滚,true时为回滚  
public void testFindUser( ) {   
       CustomerUser customerUser=testDao.selectByPrimaryKey("1");  
       System.out.println(customerUser);  
       Gson gson = new Gson();
       gson.toJson(customerUser);
       assertTrue( customerUser != null);   
    }  

}

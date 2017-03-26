package com.baicai.job.business.test.service;

import java.util.List;

import org.omg.CORBA.portable.ApplicationException;

import com.baicai.job.business.test.vo.CustomerUser;

public interface ITestService {

	List<CustomerUser> findUser(String id) throws ApplicationException;
}

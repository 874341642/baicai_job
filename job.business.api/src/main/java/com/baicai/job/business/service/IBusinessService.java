package com.baicai.job.business.service;

import java.util.List;

import org.omg.CORBA.portable.ApplicationException;

import com.baicai.job.business.test.vo.CustomerUser;

public interface IBusinessService {

	List<CustomerUser> findUser(String id) throws ApplicationException;
}

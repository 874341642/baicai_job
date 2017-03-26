package com.baicai.job.business.api;

import java.util.List;

import org.omg.CORBA.portable.ApplicationException;

import com.baicai.job.business.test.vo.CustomerUser;

public interface IBusinessService {

	List<CustomerUser> findUser(String id) throws ApplicationException;
}

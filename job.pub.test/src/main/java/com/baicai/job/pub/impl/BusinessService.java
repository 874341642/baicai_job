package com.baicai.job.pub.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.log4j.Logger;
import org.omg.CORBA.portable.ApplicationException;

import com.baicai.job.business.api.IBusinessService;
import com.baicai.job.business.test.dao.ITestDao;
import com.baicai.job.business.test.vo.CustomerUser;

@Named
public class BusinessService implements IBusinessService {

	private static Logger logger = Logger.getLogger(BusinessService.class);

	@Inject
	private ITestDao testDao;

	@Override
	public List<CustomerUser> findUser(String id) throws ApplicationException {
		logger.info("findUser...");
		List<CustomerUser> retList = new ArrayList<>();
		CustomerUser customerUser = testDao.selectByPrimaryKey("1");
		retList.add(customerUser);
		return retList;
	}

}

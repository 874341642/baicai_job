package com.baicai.job.member.login.dao;

import org.apache.ibatis.annotations.Param;

public interface IMemberDao {

	Boolean findUserLogin(@Param("account") String account, @Param("password") String password);

}

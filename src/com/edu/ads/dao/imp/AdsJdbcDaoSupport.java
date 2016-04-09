package com.edu.ads.dao.imp;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdsJdbcDaoSupport extends JdbcDaoSupport {
	
	@Autowired  
	public void setDataSourceOverride(DataSource dataSource) {
		super.setDataSource(dataSource);
	}
}

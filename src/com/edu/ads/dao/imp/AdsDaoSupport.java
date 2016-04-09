package com.edu.ads.dao.imp;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate4.HibernateTemplate;

public class AdsDaoSupport {

	@Autowired
	private AdsHibernateDaoSupport adsHibernateDaoSupport;
	@Autowired
	private AdsJdbcDaoSupport adsJdbcDaoSupport;

	public HibernateTemplate getHibernateTemplate(){
		return adsHibernateDaoSupport.getHibernateTemplate();
	}
	
	public Session getHibernateSession(){
		return adsHibernateDaoSupport.getSessionFactory().openSession();
	}
	
	
	public JdbcTemplate getJdbcTemplate(){
		return adsJdbcDaoSupport.getJdbcTemplate();
	}
	
	public AdsHibernateDaoSupport getAdsHibernateDaoSupport() {
		return adsHibernateDaoSupport;
	}

	public void setAdsHibernateDaoSupport(
			AdsHibernateDaoSupport adsHibernateDaoSupport) {
		this.adsHibernateDaoSupport = adsHibernateDaoSupport;
	}

	public AdsJdbcDaoSupport getAdsJdbcDaoSupport() {
		return adsJdbcDaoSupport;
	}

	public void setAdsJdbcDaoSupport(AdsJdbcDaoSupport adsJdbcDaoSupport) {
		this.adsJdbcDaoSupport = adsJdbcDaoSupport;
	}
	
	
	
	
}

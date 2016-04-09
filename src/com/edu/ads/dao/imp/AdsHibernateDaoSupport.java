package com.edu.ads.dao.imp;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdsHibernateDaoSupport extends HibernateDaoSupport {
	
	@Autowired  
    public void setSessionFactoryOverride(SessionFactory sessionFactory)  
    {  
  
        super.setSessionFactory(sessionFactory);  
    } 
	
}

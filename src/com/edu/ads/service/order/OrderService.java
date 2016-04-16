package com.edu.ads.service.order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.edu.ads.bean.order.Order;
import com.edu.ads.common.page.Page;
import com.edu.ads.dao.imp.DaoSupport;
import com.edu.ads.dao.order.OrderDao;


@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	
	public List<Order> listOrders(Page page,Map<String ,Object> params){
		return orderDao.listOrders(page, params);
	}
	
	public void save(Order o){
		orderDao.save(o);
	}
	
	public long getCount(){
		return orderDao.getCount();
	}
}

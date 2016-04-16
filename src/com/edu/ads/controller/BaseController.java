package com.edu.ads.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.ServletRequestDataBinder;

import com.edu.ads.bean.user.User;

public class BaseController {

	


	/**
	 * 自动绑定request 中bean的属性
	 * @param bean
	 * @param request
	 */
	public void getBean(Object bean,HttpServletRequest request){
		ServletRequestDataBinder binder = new ServletRequestDataBinder(bean);
		binder.bind(request);
	}
	
	public User getLoginUser(HttpServletRequest request){
		return (User)request.getSession().getAttribute("user");
	}
}

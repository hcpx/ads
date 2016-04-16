package com.edu.ads.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.ServletRequestDataBinder;

import com.edu.ads.bean.user.User;
import com.edu.ads.common.page.Page;

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
	
	/**
	 * 获取登录用户
	 * @param request
	 * @return
	 */
	public User getLoginUser(HttpServletRequest request){
		return (User)request.getSession().getAttribute("user");
	}
	

	/**
	 * 创建page
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public Page bulidPage(String currentPage,String pageSize){
		int current = 0;
		int size = 5;
		try{
			 current = Integer.valueOf(currentPage);
			 size = Integer.valueOf(pageSize);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return  new Page(current,size);
	}
}

package com.edu.ads.controller.order;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.bean.order.Order;
import com.edu.ads.bean.user.User;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.common.utils.CommonUtils;
import com.edu.ads.controller.BaseController;
import com.edu.ads.service.order.OrderService;
import com.edu.ads.service.user.UserService;


@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{

	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/loadOrderManger.do")
	public String loadOrderManger(){
		return "/order/orderManger.jsp";
	}
	
	@RequestMapping("/loadOrderAdd.do")
	public String loadOrderAdd(){
		return "/order/orderAdd.jsp";
	}
	
	@RequestMapping("/loadOrderUserList.do")
	public String loadOrderUserList(){
		System.out.println("xxxx");
		return "/order/orderUserList.jsp";
	}
	
	
	@RequestMapping("/loadUserList.do")
	public String loadUserList(HttpServletRequest request, HttpServletResponse response){
		String name =request.getParameter("name");
	    String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    Page page = bulidPage(currentPage, pageSize);
	    Map<String,Object> param = new HashMap<String,Object>();
	    if(name!=null&&!"".equals(name)){
			param.put("name", name);
		}
	    param.put("type", 1);
		String ordery = " order by name desc";
		PageResult<User> pageResult = userService.list(param, page, ordery);
		double totalCount =pageResult.getTotalRecords();
		double perPageSize = page.getPageLength();
		double pageSzie = Math.ceil(totalCount/perPageSize);
		pageResult.setTotPage((int)pageSzie);
		pageResult.setPage(page);
		request.setAttribute("pageResult", pageResult);
		return "/order/userList.jsp";
	}
	private Page bulidPage(String currentPage,String pageSize){
		int current = 1;
		int size = 5;
		try{
			 current = Integer.valueOf(currentPage);
			 size = Integer.valueOf(pageSize);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return  new Page(current,size);
	}
	
	@RequestMapping("/orderAdd.do")
	public String  orderAdd(HttpServletRequest request, HttpServletResponse response){
		Order order = new Order();
		getBean(order, request);
		order.setId(CommonUtils.getUUid());
		//计算订单的价格
		
		
		orderService.save(order);
		return "";
	}
	
	private double getOrderCount(Order order){
		//查询出广告牌
		Date kssj = order.getKssj();
		Date jssj = order.getJssj();
		
		
		
		
		return 0;
	}
	
	@RequestMapping("/listOrder.do")
	public String listOrder(HttpServletRequest request, HttpServletResponse response){
		
		return null;
	}
	
	
}

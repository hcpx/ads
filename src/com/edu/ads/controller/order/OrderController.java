package com.edu.ads.controller.order;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.bean.order.Order;
import com.edu.ads.bean.user.User;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.common.utils.CommonUtils;
import com.edu.ads.controller.BaseController;
import com.edu.ads.service.order.OrderService;
import com.edu.ads.service.user.UserService;
import com.edu.ads.utils.DateUtil;


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
	
	@RequestMapping("/orderAdd.do")
	public String  orderAdd(HttpServletRequest request, HttpServletResponse response){
		Order order = new Order();
		getBean(order, request);
		order.setId(CommonUtils.getUUid());
		//计算订单的价格
    	order.setCount(getOrderCount(order));
    	User user = getLoginUser(request);
    	order.setXsry(user.getId());
		orderService.save(order);
		orderService.updateGgpzt(order.getGgpid(), 2);
		return "/order/loadOrderManger.do";
	}
	
	/**
	 * 得到广告牌的总价
	 * @param order
	 * @return
	 */
	private double getOrderCount(Order order){
		//查询出广告牌
		Date kssj = order.getKssj();
		Date jssj = order.getJssj();
		int day = 0;
		try {
			day = DateUtil.daysBetween(kssj, jssj);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return day*order.getGgpdj();
	}
	
	@RequestMapping("/listOrder.do")
	public String listOrder(HttpServletRequest request, HttpServletResponse response){
		String xsrymc = request.getParameter("syrymc");
		String lxmc = request.getParameter("lxmc");
		String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    Page page = bulidPage(currentPage, pageSize);
	    PageResult<Order> pageResult = new PageResult<Order>();
	    Map<String,Object > params = new HashMap<String, Object>();
	    if(!StringUtils.isEmpty(xsrymc)){
	    	params.put("xsryMc", xsrymc);
	    }
	    if(!StringUtils.isEmpty(lxmc)){
	    	params.put("ggpType", lxmc);
	    }
	    pageResult.setRecords(orderService.listOrders( page, params));
	    pageResult.setPage(page);
	    pageResult.setTotalRecords(orderService.getCount(params));
		request.setAttribute("pageResult", pageResult);
		return "/order/orderList.jsp";
	}
	
	
}

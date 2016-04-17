package com.edu.ads.controller.order;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.edu.ads.bean.ggp.Ggp;
import com.edu.ads.bean.order.Order;
import com.edu.ads.bean.user.User;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.common.utils.CommonUtils;
import com.edu.ads.controller.BaseController;
import com.edu.ads.service.ad.AdService;
import com.edu.ads.service.order.OrderService;
import com.edu.ads.service.user.UserService;
import com.edu.ads.utils.DateUtil;


@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{

	@Autowired
	private AdService adService;
	
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
	
	@RequestMapping("/loadOrderGgpList.do")
	public String loadOrderGgpList(){
		return "/order/gporderGgpList.jsp";
	}
	
	
	
	@RequestMapping("/getGgpList.do")
	public String getGgpList(HttpServletRequest request, HttpServletResponse response){
		String ms =request.getParameter("ms");
		String ggpType =request.getParameter("ggpType");
	    String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    Page page = bulidPage(currentPage, pageSize);
		Map<String,Object> param = new HashMap<String,Object>();
		//param.put("zt", 1);
		if(ms!=null&&!"".equals(ms)){
			param.put("ms", ms);
		}
		if(ggpType!=null&&!"".equals(ggpType)){
			param.put("lx", ggpType);
		}
		String ordery = " order by jg desc";
		PageResult<Ggp> pageResult = adService.ggpList(param, page, ordery);
		double totalCount =pageResult.getTotalRecords();
		double perPageSize = Integer.valueOf(pageSize);
		double pageSzie = Math.ceil(totalCount/perPageSize);
		pageResult.setTotPage((int)pageSzie);
		pageResult.setPage(page);
		request.setAttribute("pageResult", pageResult);
		return "/order/ggpList.jsp";
	}
	
	
	@RequestMapping("/orderAdd.do")
	public String  orderAdd(HttpServletRequest request, HttpServletResponse response){
		Order order = new Order();
		getBean(order, request);
		SimpleDateFormat simp = new SimpleDateFormat("yyyy-MM-dd");
		try{
			String kssj = request.getParameter("kssj");
			String jssj = request.getParameter("jssj");
			order.setKssj(simp.parse(kssj));
			order.setJssj(simp.parse(jssj));
			order.setDdsj(new Date());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		order.setId(CommonUtils.getUUid());
		//计算订单的价格
    	order.setCount(getOrderCount(order));
    	User user = getLoginUser(request);
    	if(user==null){
	    	return "/login/login.jsp";
	    }
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
	    	params.put("khlxr", lxmc);
	    }
	    User loginUser = getLoginUser(request);
	    if(loginUser==null){
	    	return "/login/login.jsp";
	    }
	    params.put("userid", loginUser.getId());
	    pageResult.setRecords(orderService.listOrders( page, params));
	    pageResult.setPage(page);
	    pageResult.setTotalRecords(orderService.getCount(params));
	    double totalCount =pageResult.getTotalRecords();
		double perPageSize = page.getPageLength();
		double pageSzie = Math.ceil(totalCount/perPageSize);
		pageResult.setTotPage((int)pageSzie);
		request.setAttribute("pageResult", pageResult);
		return "/order/orderList.jsp";
	}
	
	@RequestMapping("/deleteOrder.do")
	public String deleteOrder(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		orderService.delet(id);
		
		return "/order/loadOrderManger.do";
	}
	
	@RequestMapping("/updateOrder.do")
	public String updateOrder(HttpServletRequest request, HttpServletResponse response){
		Order order = new Order();
		getBean(order, request);
		try{
			SimpleDateFormat simp = new SimpleDateFormat("yyyy-MM-dd");
			String kssj = request.getParameter("kssj");
			String jssj = request.getParameter("jssj");
			order.setKssj(simp.parse(kssj));
			order.setJssj(simp.parse(jssj));
		}catch(Exception e){
			e.printStackTrace();
		}
		Order oldOrder = orderService.find(order.getId());
		oldOrder.setCount(getOrderCount(order));
		oldOrder.setKhlxr(order.getKhlxr());
		oldOrder.setKhlxrdh(order.getKhlxrdh());
		oldOrder.setKssj(order.getKssj());
		oldOrder.setJssj(order.getJssj());
		User user = getLoginUser(request);
		if(user==null){
	    	return "/login/login.jsp";
	    }
		oldOrder.setXsry(user.getId());
		orderService.updateGgpzt(oldOrder.getGgpid(),1);
		oldOrder.setGgpid(order.getGgpid());
	    //修改新的广告牌状态
		orderService.updateGgpzt(order.getGgpid(), 2);
		orderService.update(oldOrder);
		return "/order/loadOrderManger.do";
		
	}
	
	@RequestMapping("/getOrder.do")
	public String getOrder(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		Order order = orderService.find(id);
		//获取广告牌
		String ggpId  = order.getGgpid();
		Ggp ggp = adService.findggp(ggpId);
		order.setGgplxmc(ggp.getMs());
		order.setGgpdj(ggp.getJg());
		request.setAttribute("order", order);
		return "/order/orderEdit.jsp";
	}
	
}

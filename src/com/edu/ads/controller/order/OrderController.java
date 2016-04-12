package com.edu.ads.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.controller.BaseController;


@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{

	@RequestMapping("/loadOrderManger.do")
	public String loadOrderManger(){
		return "/order/orderManger.jsp";
	}
}

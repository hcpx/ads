package com.edu.ads.controller.ad;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.bean.ggp.GgpType;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.service.ad.AdService;

@Controller
@RequestMapping("/ggp")
public class GgpController {
	@Autowired
	private AdService adService;
	
	@RequestMapping("/loadGgpManger.do")
	public String loadUserManger(){
		return "/ad/ggpManage.jsp";
	}
	
	@RequestMapping("/getGgTypeList.do")
	public String getUserList(HttpServletRequest request, HttpServletResponse response){
		String title =request.getParameter("title");
	    String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    Page page = bulidPage(currentPage, pageSize);
		Map<String,Object> param = new HashMap<String,Object>();
		if(title!=null&&!"".equals(title)){
			param.put("mc", title);
		}
		String ordery = " order by mc desc";
		PageResult<GgpType> pageResult = adService.ggTypeList(param, page, ordery);
		double totalCount =pageResult.getTotalRecords();
		double perPageSize = Integer.valueOf(pageSize);
		double pageSzie = Math.ceil(totalCount/perPageSize);
		pageResult.setTotPage((int)pageSzie);
		pageResult.setPage(page);
		request.setAttribute("pageResult", pageResult);
		return "/ad/ggpTypeList.jsp";
	}
	
	private Page bulidPage(String currentPage,String pageSize){
		return  new Page(Integer.valueOf(currentPage),Integer.valueOf(pageSize));
	}
	
	@RequestMapping("/loadGgpTypeAdd.do")
	public String loadUserAdd(){
		return "/ad/addGgpType.jsp";
	}
}

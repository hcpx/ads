package com.edu.ads.controller.ad;

import java.io.IOException;
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
import com.edu.ads.common.utils.CommonUtils;
import com.edu.ads.controller.BaseController;
import com.edu.ads.service.ad.AdService;

@Controller
@RequestMapping("/ggp")
public class GgpController extends BaseController{
	@Autowired
	private AdService adService;
	
	@RequestMapping("/loadGgpTypeManger.do")
	public String loadGgpManger(){
		return "/ad/ggpTypeManage.jsp";
	}
	
	@RequestMapping("/getGgTypeList.do")
	public String getGgTypeList(HttpServletRequest request, HttpServletResponse response){
		String mc =request.getParameter("mc");
	    String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    Page page = bulidPage(currentPage, pageSize);
		Map<String,Object> param = new HashMap<String,Object>();
		if(mc!=null&&!"".equals(mc)){
			param.put("mc", mc);
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
	public String loadGgpTypeAdd(){
		return "/ad/addGgpType.jsp";
	}
	
	@RequestMapping("/saveGgpType.do")
	public String saveGgpType(HttpServletRequest request, HttpServletResponse response) throws IOException{
		GgpType ggpType = new GgpType();
		getBean(ggpType, request);
		ggpType.setId(CommonUtils.getUUid());
		adService.addggpType(ggpType);
		return "/ggp/loadGgpTypeManger.do";
	}
	
	@RequestMapping("/updateGgpType.do")
	public String updateGgpType(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String mc = request.getParameter("updatemc");
		String ms = request.getParameter("updatems");
		GgpType ggpType = adService.findggpType(id);
		ggpType.setMc(mc);
		ggpType.setMs(ms);
		adService.updateGgp(ggpType);
		return "/ggp/loadGgpTypeManger.do";
	}
	
	@RequestMapping("/showGgpType.do")
	public String showGgpType(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		GgpType ggpType = adService.findggpType(id);
		request.setAttribute("ggpType",ggpType);
		return "/ad/ggpTypeEedit.jsp";
	}
	
	@RequestMapping("/deleteGgpType.do")
	public String deleteGgpType(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		GgpType ggpType = adService.findggpType(id);
		adService.delete(ggpType);
		return "/ggp/loadGgpTypeManger.do";
	}
}

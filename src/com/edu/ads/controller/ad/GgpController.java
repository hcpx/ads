package com.edu.ads.controller.ad;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.edu.ads.bean.ggp.Ggp;
import com.edu.ads.bean.ggp.GgpType;
import com.edu.ads.bean.ggp.Ggptp;
import com.edu.ads.bean.user.User;
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
	
	
	/*=======================================广告牌类型==============================================*/
	@RequestMapping("/loadGgpTypeManger.do")
	public String loadGgpTypeManger(){
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
	
	/*=======================================广告牌==============================================*/
	@RequestMapping("/loadGgpManger.do")
	public String loadGgpManger(HttpServletRequest request, HttpServletResponse response){
		List<GgpType> ggpTypeList=adService.getAllGgType();
		request.setAttribute("ggpTypeList", ggpTypeList);
		return "/ad/ggpManage.jsp";
	}
	
	@RequestMapping("/getGgpList.do")
	public String getGgpList(HttpServletRequest request, HttpServletResponse response){
		String ms =request.getParameter("ms");
		String useInfo =request.getParameter("useInfo");
		String ggpType =request.getParameter("ggpType");
	    String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    Page page = bulidPage(currentPage, pageSize);
		Map<String,Object> param = new HashMap<String,Object>();
		if(ms!=null&&!"".equals(ms)){
			param.put("ms", ms);
		}
		if(useInfo!=null&&!"".equals(useInfo)){
			param.put("zt", Integer.valueOf(useInfo));
		}
		if(ggpType!=null&&!"".equals(ggpType)){
			param.put("lx",adService.findggpType(ggpType));
		}
		String ordery = " order by jg desc";
		PageResult<Ggp> pageResult = adService.ggpList(param, page, ordery);
		double totalCount =pageResult.getTotalRecords();
		double perPageSize = Integer.valueOf(pageSize);
		double pageSzie = Math.ceil(totalCount/perPageSize);
		pageResult.setTotPage((int)pageSzie);
		pageResult.setPage(page);
		request.setAttribute("pageResult", pageResult);
		return "/ad/ggpList.jsp";
	}
	
	@RequestMapping("/loadGgpAdd.do")
	public String loadGgpAdd(HttpServletRequest request, HttpServletResponse response){
		List<GgpType> ggpTypeList=adService.getAllGgType();
		request.setAttribute("ggpTypeList", ggpTypeList);
		return "/ad/addGgp.jsp";
	}
	
	@RequestMapping("/saveGgp.do")
	public String saveGgp(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String lx =request.getParameter("lx");
		User user=(User)request.getSession().getAttribute("user");
		Ggp ggp = new Ggp();
		getBean(ggp, request);
		GgpType type=adService.findggpType(lx);
		ggp.setLx(type);
		ggp.setTjry(user!=null?user.getName():"");
		ggp.setId(CommonUtils.getUUid());
		ggp.setZt(1);
		ggp.setGgptps(new HashSet<Ggptp>());
		adService.addggp(ggp);
		return "/ggp/loadGgpManger.do";
	}
	
	@RequestMapping("/checkGgpLxCount.do")
	public void checkGgpLxCount(HttpServletRequest request, HttpServletResponse response) throws IOException{
		if(adService.getAllTypeCount()==0){
			response.getWriter().write("1");
		}else{
			response.getWriter().write("0");
		}
		response.getWriter().flush();
	}
	
	@RequestMapping("/showGgp.do")
	public String showGgp(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		Ggp ggp = adService.findggp(id);
		List<GgpType> ggpTypeList=adService.getAllGgType();
		request.setAttribute("ggpTypeList", ggpTypeList);
		request.setAttribute("ggp",ggp);
		return "/ad/ggpEedit.jsp";
	}
	
	@RequestMapping("/updateGgp.do")
	public String updateGgp(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String lx = request.getParameter("lx");
		String ms = request.getParameter("updatems");
		String zt = request.getParameter("zt");
		String updatejg = request.getParameter("updatejg");
		Ggp Ggp = adService.findggp(id);
		GgpType type=adService.findggpType(lx);
		Ggp.setLx(type);
		Ggp.setMs(ms);
		Ggp.setZt(Integer.valueOf(zt));
		Ggp.setJg(Double.valueOf(updatejg));
		adService.upGgp(Ggp);
		return "/ggp/loadGgpManger.do";
	}
	
	@RequestMapping("/deleteGgp.do")
	public String deleteGgp(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		Ggp Ggp = adService.findggp(id);
		adService.deleteGgp(Ggp);
		return "/ggp/loadGgpManger.do";
	}
	
	/*=======================================广告牌图片==============================================*/
	
	@RequestMapping("/loadGgpTpManger.do")
	public String loadGgpTpManger(HttpServletRequest request, HttpServletResponse response){
		List<GgpType> ggpTypeList=adService.getAllGgType();
		request.setAttribute("ggpTypeList", ggpTypeList);
		return "/ad/ggpTpManage.jsp";
	}
	
	@RequestMapping("/getGgpTpList.do")
	public String getGgpTpList(HttpServletRequest request, HttpServletResponse response){
		String ms =request.getParameter("ms");
		String useInfo =request.getParameter("useInfo");
		String ggpType =request.getParameter("ggpType");
	    String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    Page page = bulidPage(currentPage, pageSize);
		Map<String,Object> param = new HashMap<String,Object>();
		if(ms!=null&&!"".equals(ms)){
			param.put("ms", ms);
		}
		if(useInfo!=null&&!"".equals(useInfo)){
			param.put("zt", Integer.valueOf(useInfo));
		}
		if(ggpType!=null&&!"".equals(ggpType)){
			param.put("lx",adService.findggpType(ggpType));
		}
		String ordery = " order by jg desc";
		PageResult<Ggp> pageResult = adService.ggpList(param, page, ordery);
		double totalCount =pageResult.getTotalRecords();
		double perPageSize = Integer.valueOf(pageSize);
		double pageSzie = Math.ceil(totalCount/perPageSize);
		pageResult.setTotPage((int)pageSzie);
		pageResult.setPage(page);
		request.setAttribute("pageResult", pageResult);
		return "/ad/ggpList.jsp";
	}
	
	@RequestMapping("/loadGgpTpAdd.do")
	public String loadGgpTpAdd(HttpServletRequest request, HttpServletResponse response){
		List<Ggp> ggpList=adService.getAllGgp();
		request.setAttribute("ggpList", ggpList);
		return "/ad/addGgpTp.jsp";
	}
	
	@RequestMapping("/saveGgpTp.do")
	public String saveGgpTp(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String lx =request.getParameter("lx");
		User user=(User)request.getSession().getAttribute("user");
		Ggp ggp = new Ggp();
		getBean(ggp, request);
		GgpType type=adService.findggpType(lx);
		ggp.setLx(type);
		ggp.setTjry(user!=null?user.getName():"");
		ggp.setId(CommonUtils.getUUid());
		ggp.setZt(1);
		ggp.setGgptps(new HashSet<Ggptp>());
		adService.addggp(ggp);
		return "/ggp/loadGgpManger.do";
	}
	
	@RequestMapping("/checkGgpTpLxCount.do")
	public void checkGgpTpLxCount(HttpServletRequest request, HttpServletResponse response) throws IOException{
		if(adService.getAllGgpCount()==0){
			response.getWriter().write("1");
		}else{
			response.getWriter().write("0");
		}
		response.getWriter().flush();
	}
	
	@RequestMapping("/showGgpTp.do")
	public String showGgpTp(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		Ggp ggp = adService.findggp(id);
		List<GgpType> ggpTypeList=adService.getAllGgType();
		request.setAttribute("ggpTypeList", ggpTypeList);
		request.setAttribute("ggp",ggp);
		return "/ad/ggpEedit.jsp";
	}
	
	@RequestMapping("/updateGgpTp.do")
	public String updateGgpTp(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String lx = request.getParameter("lx");
		String ms = request.getParameter("updatems");
		String zt = request.getParameter("zt");
		String updatejg = request.getParameter("updatejg");
		Ggp Ggp = adService.findggp(id);
		GgpType type=adService.findggpType(lx);
		Ggp.setLx(type);
		Ggp.setMs(ms);
		Ggp.setZt(Integer.valueOf(zt));
		Ggp.setJg(Double.valueOf(updatejg));
		adService.upGgp(Ggp);
		return "/ggp/loadGgpManger.do";
	}
	
	@RequestMapping("/deleteGgpTp.do")
	public String deleteGgpTp(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		Ggp Ggp = adService.findggp(id);
		adService.deleteGgp(Ggp);
		return "/ggp/loadGgpManger.do";
	}
	
	@RequestMapping("/updateImage.do")  
    public void uploadFile(HttpServletResponse response,HttpServletRequest request,@RequestParam(value="file", required=false) MultipartFile file) throws IOException{  
        byte[] bytes = file.getBytes();  
        System.out.println(file.getOriginalFilename());  
        String uploadDir = request.getRealPath("/")+"upload";  
        File dirPath = new File(uploadDir);  
        if (!dirPath.exists()) {  
            dirPath.mkdirs();  
        }  
        String sep = System.getProperty("file.separator");  
        File uploadedFile = new File(uploadDir + sep  
                + file.getOriginalFilename());  
        FileCopyUtils.copy(bytes, uploadedFile);  
        String msg = "true";
        response.getWriter().write(msg);  
    }  
}

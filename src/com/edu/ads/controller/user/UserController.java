package com.edu.ads.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.bean.user.User;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.common.utils.CommonUtils;
import com.edu.ads.service.user.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/loadUserManger.do")
	public String loadUserManger(){
		
		return "/user/userManger.jsp";
	}
	
	
	@RequestMapping("/saveUser.do")
	public void saveUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String name =  request.getParameter("name");
		String userName =  request.getParameter("userName");
		String password =  request.getParameter("password");
		String userType =  request.getParameter("userType");
		User user = new User();
		user.setId(CommonUtils.getUUid());
		user.setName(name);
		user.setPassword(password);
		user.setUserName(userName);
		user.setType(Integer.valueOf(userType));
		userService.addUser(user);
		response.getWriter().write(0);
	}
	
	
	@RequestMapping("/getUserList.do")
	public String getUserList(HttpServletRequest request, HttpServletResponse response){
		String name =request.getParameter("name");
		String usertype = request.getParameter("usertype");
	    String currentPage = request.getParameter("currentPage");
	    String pageSize = request.getParameter("pageSize");
	    
	    Page page = bulidPage(currentPage, pageSize);
		Map<String,Object> param = new HashMap<String,Object>();
		if(name!=null&&!"".equals(name)){
			param.put("name", name);
		}
		int type = 1;
		if(usertype!=null&&!"".equals(usertype)){
			try{
				type =  Integer.valueOf(usertype);
			}catch(Exception e){
				e.printStackTrace();
			}
			param.put("type", type);
		}
		String ordery = " order by name desc";
		PageResult<User> pageResult = userService.list(param, page, ordery);
		double totalCount =pageResult.getTotalRecords();
		double perPageSize = Integer.valueOf(pageSize);
		double pageSzie = Math.ceil(totalCount/perPageSize);
		pageResult.setTotPage((int)pageSzie);
		pageResult.setPage(page);
		request.setAttribute("pageResult", pageResult);
		return "/user/userList.jsp";
	}
	
	
	private Page bulidPage(String currentPage,String pageSize){
		return  new Page(Integer.valueOf(currentPage),Integer.valueOf(pageSize));
	}
	@RequestMapping("/loadUserAdd.do")
	public String loadUserAdd(){
		return "/user/adduse.jsp";
	}
	
}

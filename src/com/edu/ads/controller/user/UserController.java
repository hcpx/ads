package com.edu.ads.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.bean.user.User;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.common.utils.CommonUtils;
import com.edu.ads.controller.BaseController;
import com.edu.ads.service.user.UserService;


@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

	@Autowired
	private UserService userService;
	
	
	
	
	@RequestMapping("/loadUserManger.do")
	public String loadUserManger(){
		return "/user/userManger.jsp";
	}
	
	@RequestMapping("/checkUserNameExsit.do")
	public void checkUserNameExsit(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userName =  request.getParameter("userName");
		if(userService.userNameExist(userName)){
			response.getWriter().write("0");
		}else{
			response.getWriter().write("1");
		}
		response.getWriter().flush();
	}
	
	@RequestMapping("/saveUser.do")
	public String saveUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		User user = new User();
		getBean(user, request);
		user.setId(CommonUtils.getUUid());
		userService.addUser(user);
		return "/user/loadUserManger.do";
	}
	
	
	/**
	 * 更新用户
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateUser.do")
	public String updateUser(HttpServletRequest request, HttpServletResponse response){
		User updateUser = new User();
		getBean(updateUser, request);
		User userDb = userService.findUser(updateUser.getId());
		userDb.setName(updateUser.getName());
		userDb.setType(updateUser.getType());
		userDb.setPassword(updateUser.getPassword());
		userService.updateUser(userDb);
		return "/user/loadUserManger.do";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser (HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		userService.deleleUser(id);
		return "/user/loadUserManger.do";
	}
	
	
	@RequestMapping("/getUserList.do")
	public String getUserList(HttpServletRequest request, HttpServletResponse response){
		String name =request.getParameter("name");
		String usertype = request.getParameter("userType");
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
	
	@RequestMapping("/getUpdateUser.do")
	public String getUpdateUser(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		User user = userService.findUser(id);
		request.setAttribute("user",user);
		return "/user/userEedit.jsp";
	}
	
	@RequestMapping("/showUser.do")
	public String showUser(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		User user = userService.findUser(id);
		request.setAttribute("user",user);
		return "/user/userShow.jsp";
	}
	
}

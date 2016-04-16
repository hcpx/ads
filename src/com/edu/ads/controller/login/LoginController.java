package com.edu.ads.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.bean.user.User;
import com.edu.ads.controller.BaseController;
import com.edu.ads.service.user.UserService;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response){
		User userBean = new User();
		getBean(userBean, request);
		System.out.println("userName :"+userBean.getUserName());
		try{
			User user  = userService.findUserByUserNameAndPwd(userBean.getUserName(), userBean.getPassword());
			if(null==user){
				request.setAttribute("username", userBean.getUserName());
				request.setAttribute("password",userBean.getPassword());
				request.setAttribute("errormessage", "用户名密码错误");
				return "/login/login.jsp";
			}else{
				request.getSession().setAttribute("user", user);
				return "/user/loadUserManger.do";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
	
	
}

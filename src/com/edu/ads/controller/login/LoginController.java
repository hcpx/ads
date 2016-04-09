package com.edu.ads.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.ads.service.user.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response){
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("userName :"+userName);
		try{
			//登录成功后跳转到
			if(userService.userExsist(userName, password)){
				return "/user/getUserList.do";
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

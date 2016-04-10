package com.edu.ads.service.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.ads.bean.user.User;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.dao.user.UserDao;



@Service
public class UserService {

	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 新增人员
	 * @param user
	 */
	public void addUser(User user){
		userDao.save(user);
	}
	
	/**
	 * 更新人员
	 * @param user
	 */
	public void updateUser(User user){
		userDao.update(user);
	}
	
	/**
	 * 查找用户
	 * @param id
	 * @return User
	 */
	public User findUser(String id){
		return userDao.find(id);
	}

	public void deleleUser(String userId){
		userDao.delete(findUser(userId));
	}
	
	public PageResult<User> list(Map<String,Object> params,Page page,String ordery){
		return userDao.getList(page.getStartIndex(), page.getPageLength(), params, ordery);
	}
	
	/**
	 * 根据用户名密码查找用户
	 * @param userName
	 * @param password
	 * @return
	 */
	public User findUserByUserNameAndPwd(String userName,String password){
		return userDao.getUser(userName, password);
	}
	
	/**
	 * 判斷用戶用戶名密碼是不是正確
	 * @param userName
	 * @param password
	 * @return
	 */
	public boolean userExsist(String userName,String password){
		User user = userDao.getUser(userName, password);
		if(null==user){
			return false;
		}
		return true;
	}
	
	public boolean userNameExist(String userName){
		
		return userDao.userNameExist(userName);
	}
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	
}

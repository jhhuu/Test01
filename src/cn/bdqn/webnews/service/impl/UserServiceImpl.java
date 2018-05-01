package cn.bdqn.webnews.service.impl;

import cn.bdqn.webnews.dao.UserDao;
import cn.bdqn.webnews.dao.impl.UserDaoImpl;
import cn.bdqn.webnews.entity.User;
import cn.bdqn.webnews.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao = new UserDaoImpl();
	
	
	public boolean checkName(String name) {
		boolean checkName = userDao.checkName(name);
		return checkName;
	}

	
	public int addUser(User user) {
		int addUser = userDao.addUser(user);
		return addUser;
	}

	
	public String checkLogin(User user) {
		String checkLogin = userDao.checkLogin(user);
		return checkLogin;
	}

}

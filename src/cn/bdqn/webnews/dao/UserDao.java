package cn.bdqn.webnews.dao;

import cn.bdqn.webnews.entity.User;

public interface UserDao {
	
	//判断是否注册过
	public boolean checkName(String name);
	//添加
	public int addUser(User user);
	//判断登录
	public String checkLogin(User user); 
}

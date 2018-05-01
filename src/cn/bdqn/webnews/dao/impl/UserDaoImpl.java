package cn.bdqn.webnews.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.bdqn.webnews.dao.BaseDao;
import cn.bdqn.webnews.dao.UserDao;
import cn.bdqn.webnews.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	private Connection con = getConnection();
	private PreparedStatement pst;
	private ResultSet rs;
	/*
	 * 注意：方法返回true证明不能注册
	 * 
	 */
	
	public boolean checkName(String name) {
		//编写SQL语句
		String sql = "select * from news_users where uname = ?";
		try {
			//预编译
			pst = con.prepareStatement(sql);
			//给占位符赋值
			pst.setString(1, name);
			//执行SQL语句
			rs = pst.executeQuery();
			if(rs.next()){//是否有下一条记录
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			return false;
		}finally{
			CloseAll(con, pst, rs);
		}
		
	}
	
	public int addUser(User user) {
		int res = 0;
		String sql = "insert into news_users(uname,upwd) values(?,?)";
		Object[] params = {user.getUname(),user.getUpwd()};
		res = executeUpdate(sql, params);
		return res;
	}
	
	public String checkLogin(User user) {
		String sql = "select * from news_users where uname = ? and upwd = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getUname());
			pst.setString(2, user.getUpwd());
			rs = pst.executeQuery();
			if(rs.next()){
				return "true";
			}else{
				return "false";
			}
		} catch (SQLException e) {
			return "false";
		}finally{
			CloseAll(con, pst, rs);
		}
	}

}

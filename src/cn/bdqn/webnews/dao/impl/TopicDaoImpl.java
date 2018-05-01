package cn.bdqn.webnews.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.bdqn.webnews.dao.BaseDao;
import cn.bdqn.webnews.dao.TopicDao;
import cn.bdqn.webnews.entity.Topic;

public class TopicDaoImpl extends BaseDao implements TopicDao {
	private Connection con = getConnection();
	private PreparedStatement pst;
	private ResultSet rs;
	
	public boolean checkId(int tid) {
		String sql = "select * from news where ntid = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, tid);
			rs = pst.executeQuery();
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
		}finally{
			CloseAll(con, pst, rs);
		}
	}

	
	public boolean checkName(String name) {
		String sql = "select * from topic where tname = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
		}finally{
			CloseAll(con, pst, rs);
		}
	}
	
	
	public int addTopic(String tname) {
		int res = 0;
		String sql = "insert into topic(tname) values(?)";
		Object[] params = {tname};
		res = executeUpdate(sql, params);
		return res;
	}

	
	public List<Topic> getTopics() {
		List<Topic> tList = new ArrayList<Topic>();
		String sql = "select * from topic";
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				Topic t = new Topic();
				t.setTid(rs.getInt(1));
				t.setTname(rs.getString(2));
				tList.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseAll(con, pst, rs);
		}
		return tList;
	}

	
	public int deleteTopic(int tid) {
		int res = 0;
		String sql = "delete from topic where tid = ?";
		Object[] params = {tid};
		res = executeUpdate(sql, params);
		return res;
	}

	
	public int UpdateTopic(int tid,String tname) {
		int res = 0;
		String sql = "update topic set tname = ? where tid = ?";
		Object[] params = {tname,tid};
		res = executeUpdate(sql, params);
		return res;
	}

	

}

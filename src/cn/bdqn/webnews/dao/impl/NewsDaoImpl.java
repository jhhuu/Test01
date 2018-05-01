package cn.bdqn.webnews.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import cn.bdqn.webnews.dao.BaseDao;
import cn.bdqn.webnews.dao.NewsDao;
import cn.bdqn.webnews.entity.News;

public class NewsDaoImpl extends BaseDao implements NewsDao {

	private Connection con ;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public List<News> getAllNews() {
		con = getConnection();
		List<News> news_list = new ArrayList<News>();
		//构建SQL语句
		String sql = "SELECT topic.tid,topic.tname,news.ntitle,news.nauthor"+
						" FROM news,topic "+
						" WHERE news.ntid = topic.tid";
		//预编译
		try {
			pst = con.prepareStatement(sql);
			//执行SQL语句
			rs = pst.executeQuery();
			while(rs.next()){
				/*
				 * 方法需要返回的是一个带有news对象的集合
				 * 但是我们现在拿到的是属性
				 * 所以：
				 * 	1.把属性封装到对象中
				 * 	2.把对象放入到集合中
				 */
				News news = new News();
				news.setNtid(rs.getInt(1));
				news.setNtname(rs.getString(2));
				news.setNtitle(rs.getString(3));
				news.setNauthor(rs.getString(4));
				news_list.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseAll(con, pst, rs);
		}
		return news_list;
	}

	
	public int getCount() {
		con = getConnection();
		int count = 0;
		String sql = "select count(*) from news";
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseAll(con, pst, rs);
		}
		return count;
	}

	
	public List<News> getPageNews(int curPage,int pageSize) {
		con = getConnection();
		List<News> news_list = new ArrayList<News>();
		//构建SQL语句
		String sql = "SELECT topic.tid,topic.tname,news.ntitle,news.nauthor"+
						" FROM news,topic "+
						" WHERE news.ntid = topic.tid limit ?,?";
		//预编译
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, (curPage - 1) * pageSize);
			pst.setInt(2, pageSize);
			//执行SQL语句
			rs = pst.executeQuery();
			while(rs.next()){
				/*
				 * 方法需要返回的是一个带有news对象的集合
				 * 但是我们现在拿到的是属性
				 * 所以：
				 * 	1.把属性封装到对象中
				 * 	2.把对象放入到集合中
				 */
				News news = new News();
				news.setNtid(rs.getInt(1));
				news.setNtname(rs.getString(2));
				news.setNtitle(rs.getString(3));
				news.setNauthor(rs.getString(4));
				news_list.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseAll(con, pst, rs);
		}
		return news_list;
	}

	
	public void testname() throws Exception {
		con = getConnection();
		List<News> allNews = getPageNews(2,5);
		for (News news : allNews) {
			System.out.println(news.getNtitle());
		}
	}

	public int addNews(News news) {
		int res = 0;
		String sql = "insert into news(ntid,ntitle,nauthor,npicPath,ncontent,nsummary) values(?,?,?,?,?,?)";
		Object[] params = {news.getNtid(),news.getNtitle(),news.getNauthor(),news.getNpicPath(),news.getNcontent(),news.getNsummary()};
		res = executeUpdate(sql, params);
		return res;
	}
	
}























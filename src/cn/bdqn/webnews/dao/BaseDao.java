package cn.bdqn.webnews.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class BaseDao {
	private static String driver;
	private static String url;
	private static String username;
	private static String password;

	private Connection con = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	
	static{
		initial();
	}
	
	public static void initial(){
		//用来读取流中的键值对儿---是java内置对象
		Properties param = new Properties();
		//配置文件的路径---与包平级
		String configFile = "database.properties";
		//把配置文件放入输入流中
		InputStream in = BaseDao.class.getClassLoader().getResourceAsStream(configFile);
		try {
			//把流中的键值对加载出来---类似游戏加载时不消耗流量，加载人物场景....
			param.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//加载出来以后给静态变量赋值---游戏加载完毕可以玩了
		driver = param.getProperty("driver");
		url = param.getProperty("url");
		username = param.getProperty("username");
		password = param.getProperty("password");
	}
	
	// 获取连接
	public Connection getConnection() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			//System.out.println("连接获取成功");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	//执行增删改的通用方法
	/*第一个参数
	 * sql语句不是死的，是由调用者决定要干什么
	 * 赋值的时候两个问题
	 * 	1.赋值几个字段不知道
	 * 	2.每个字段的类型不知道
	 * 	Object是所有类型父类
	 *第二个参数也是调用者给的
	 *调用者给的时候，采用数组的方式
	 *假设调用者是增加
	 *	insert into dog(name,health,love,strain) values(?,?,?,?)
	 *	我们的帮助类需要四个
	 *	update dog set name = ? where id = ?
	 *	需要两个
	 *	delete from dog where id = ?
	 *	需要一个
	 *
	 *	所以我们把调用者的需求参数，全部放在一个Object类型的数组里
	 *	只要我们把数组的值拿出来赋值即可
	 */
	public int executeUpdate(String sql,Object[] params){
		int res = 0;
		//获取连接
		con = getConnection();
		try {
			//预编译
			pst = con.prepareStatement(sql);
			for(int i = 0; i < params.length; i ++){
				if(params != null){
					//给占位符赋值
					pst.setObject((i+1), params[i]);
				}
			}
			//执行
			res = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseAll(con, pst, null);
		}
		return res;
	}
	
	// 关闭连接
	public void CloseAll(Connection con, PreparedStatement pst, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

package cn.bdqn.webnews.dao;

import java.util.List;

import cn.bdqn.webnews.entity.Topic;

public interface TopicDao {

	//查询---根据姓名
	public boolean checkName(String name);
	
	//查询---根据id
	public boolean checkId(int tid);
	
	//增加
	public int addTopic(String tname);
	
	//查询所有的主题
	public List<Topic> getTopics();
	
	//删除
	public int deleteTopic(int tid);
	
	//修改
	public int UpdateTopic(int tid,String tname);
}

package cn.bdqn.webnews.service;

import java.util.List;

import cn.bdqn.webnews.entity.Topic;

public interface TopicService {
	//修改
	public int UpdateTopic(int tid,String tname);
	
	//查询所有的主题
	public List<Topic> getTopics();
}

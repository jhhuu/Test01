package cn.bdqn.webnews.service.impl;

import java.util.List;

import cn.bdqn.webnews.dao.TopicDao;
import cn.bdqn.webnews.dao.impl.TopicDaoImpl;
import cn.bdqn.webnews.entity.Topic;
import cn.bdqn.webnews.service.TopicService;

public class TopicServiceImpl implements TopicService {

	private TopicDao topicDao = new TopicDaoImpl();

	
	public int UpdateTopic(int tid, String tname) {
		int updateTopic = topicDao.UpdateTopic(tid, tname);
		return updateTopic;
	}

	
	public List<Topic> getTopics() {
		List<Topic> topics = topicDao.getTopics();
		return topics;
	}

}

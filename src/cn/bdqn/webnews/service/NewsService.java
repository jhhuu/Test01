package cn.bdqn.webnews.service;

import java.util.List;

import cn.bdqn.webnews.entity.News;

public interface NewsService {
	//查询总记录数
	public int getCount();
	
	//分页查询方法
	public List<News> getPageNews(int curPage,int pageSize);
	
	//增加
	public int addNews(News news);
}

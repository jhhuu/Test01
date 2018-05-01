package cn.bdqn.webnews.service.impl;

import java.util.List;

import cn.bdqn.webnews.dao.NewsDao;
import cn.bdqn.webnews.dao.impl.NewsDaoImpl;
import cn.bdqn.webnews.entity.News;
import cn.bdqn.webnews.service.NewsService;

public class NewsServiceImpl implements NewsService {

	private NewsDao newsDao = new NewsDaoImpl();
	
	
	public int getCount() {
		int count = newsDao.getCount();
		return count;
	}

	
	public List<News> getPageNews(int curPage, int pageSize) {
		List<News> pageNews = newsDao.getPageNews(curPage, pageSize);
		return pageNews;
	}

	
	public int addNews(News news) {
		int addNews = newsDao.addNews(news);
		return addNews;
	}

}

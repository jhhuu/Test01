package cn.bdqn.webnews.tools;

import java.util.List;

import cn.bdqn.webnews.entity.News;

public class Page {

	//当前页
	private int curPage = 1;
	//每页显示条数
	private int pageSize = 5;
	//总记录数
	private int totalCount;
	//总页数
	private int totalPageCount;
	//存放每页的数据
	private List<News> news;
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	
	
	//给总记录数赋值的方法----只有总记录数有值了以后，总页数才能得到
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//是用来获取总页数
		/*if(this.totalCount % this.pageSize == 0){
			
			this.totalPageCount = this.totalCount / this.pageSize;
			
		}else if(this.totalCount % this.pageSize != 0){
			
			this.totalPageCount = this.totalCount / this.pageSize + 1;
			
		}*/
		
		this.totalPageCount = this.totalCount % this.pageSize == 0 ? 
				this.totalCount / this.pageSize : 
					this.totalCount / this.pageSize + 1; 
	}
	
	
	
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
		
	}
	public List<News> getNews() {
		return news;
	}
	public void setNews(List<News> news) {
		this.news = news;
	}
}

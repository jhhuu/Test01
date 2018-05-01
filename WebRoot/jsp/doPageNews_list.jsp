<%@page import="cn.bdqn.webnews.entity.News"%>
<%@page import="java.util.List"%>
<%@page import="cn.bdqn.webnews.service.impl.NewsServiceImpl"%>
<%@page import="cn.bdqn.webnews.service.NewsService"%>
<%@page import="cn.bdqn.webnews.tools.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>
<body>
	<%
		/*
			登录成功后，跳转到此页面，用来判断是第几页，而且把相应的
			数据查询出来，保存到session中，最后跳转到news_list.jsp
		*/
		NewsService newsService = new NewsServiceImpl();
		Page pages = new Page();
		//获取当前页
		String reqPage = request.getParameter("pageIndex");
		if(reqPage == null){
			reqPage = "1";
		}
		int curPage = Integer.parseInt(reqPage);
		//int curPage = pages.getCurPage();
		//获取每页显示条数
		int pageSize = pages.getPageSize();
		//获取总记录数
		int totalCount = newsService.getCount();
		//总页数
		pages.setTotalCount(totalCount);
		int totalPageCount = pages.getTotalPageCount();
		
		List<News> news = newsService.getPageNews(curPage, pageSize);
		
		//控制首页和尾页
		if(curPage < 1){
			curPage = 1;
		}
		if(curPage > totalPageCount){
			curPage = totalPageCount;
		}
		
		pages.setCurPage(curPage);
		pages.setPageSize(pageSize);
		pages.setTotalPageCount(totalPageCount);
		pages.setNews(news);
		
		session.setAttribute("p",pages);
		response.sendRedirect(request.getContextPath()+"/jsp/news_list.jsp");
		
	%>
</body>
</html>
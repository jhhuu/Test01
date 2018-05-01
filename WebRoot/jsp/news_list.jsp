<%@page import="cn.bdqn.webnews.tools.Page"%>
<%@page import="cn.bdqn.webnews.entity.News"%>
<%@page import="java.util.List"%>
<%@page import="cn.bdqn.webnews.dao.NewsDao"%>
<%@page import="cn.bdqn.webnews.dao.impl.NewsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#list{
		//border:1px solid red;
		width:800px;
		background:#FEF1B8;
		margin: 0 auto;
		//margin-top: 150px;
		padding: 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="list">
		<h1 align="center">新闻列表</h1>
		<table border="1"  align="center">
			<tr align="center">
				<td>主题名称</td>
				<td>新闻标题</td>
				<td>作者</td>
				<td colspan="3">操作</td>
			</tr>
			
			<%
				//用来获取新闻集合
				/* NewsDao newsDao = new NewsDaoImpl();
				List<News> news_list = newsDao.getAllNews(); */
				Page pages = (Page)session.getAttribute("p");
				for(News news : pages.getNews()){
			%>
					<tr align="center">
						<td><%=news.getNtname()%></td>
						<td><%=news.getNtitle()%></td>
						<td><%=news.getNauthor()%></td>
						<td><a href="news_add.jsp">增加</a></td>
						<td><a href="topic_delete.jsp">删除</a></td>
													<%-- ?：传参 --%>
						<td><a href="topic_update.jsp?tid=<%=news.getNtid()%>">修改</a></td>
					</tr>
				<%}%>
		</table>
		<span>
			当前页是【<%=pages.getCurPage()%>】/【<%=pages.getTotalPageCount()%>】
			
		<%
			if(pages.getCurPage() > 1){
		%>
			<a href="<%=request.getContextPath()%>/jsp/doPageNews_list.jsp?pageIndex=1">首页</a>
			<a href="<%=request.getContextPath()%>/jsp/doPageNews_list.jsp?pageIndex=<%=pages.getCurPage() - 1%>">上一页</a>
		<%}%>
		<%
			if(pages.getCurPage() < pages.getTotalPageCount()){
		%>	
			<a href="<%=request.getContextPath()%>/jsp/doPageNews_list.jsp?pageIndex=<%=pages.getCurPage() + 1%>">下一页</a>
			<a href="<%=request.getContextPath()%>/jsp/doPageNews_list.jsp?pageIndex=<%=pages.getTotalPageCount()%>">尾页</a>
		<%}%>
		</span>
	</div>
</body>
</html>
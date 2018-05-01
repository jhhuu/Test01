<%@page import="cn.bdqn.webnews.dao.impl.TopicDaoImpl"%>
<%@page import="cn.bdqn.webnews.dao.TopicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String tname = request.getParameter("tname");
		TopicDao tDao = new TopicDaoImpl();
		boolean flag = tDao.checkName(tname);
		if(!flag){
			//判断输入的主题名在数据库是否已经存在
			int res = tDao.addTopic(tname);
			if(res == 1){
				response.sendRedirect("news_list.jsp");
			}
		}
	%>
</body>
</html>
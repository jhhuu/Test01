<%@page import="cn.bdqn.webnews.entity.User"%>
<%@page import="cn.bdqn.webnews.dao.impl.UserDaoImpl"%>
<%@page import="cn.bdqn.webnews.dao.UserDao"%>
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
		//设置请求的编码格式
		request.setCharacterEncoding("utf-8");
		//获取用户输入的信息
		String name = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		//接下来拿着name去数据库进行判断
		UserDao userDao = new UserDaoImpl();
		boolean flag = userDao.checkName(name);
		if(flag){
			response.sendRedirect(request.getContextPath()+"/jsp/register.jsp");
		}else{
			User user = new User();
			user.setUname(name);
			user.setUpwd(pwd);
			int res = userDao.addUser(user);
			if(res == 1){
				response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
			}else{
				response.sendRedirect(request.getContextPath()+"/jsp/register.jsp");
			}
		}
	%>
</body>
</html>
<%@page import="cn.bdqn.webnews.service.impl.UserServiceImpl"%>
<%@page import="cn.bdqn.webnews.service.UserService"%>
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
		//UserDao userDao = new UserDaoImpl();
		UserService userService = new UserServiceImpl();
		User user = new User();
		user.setUname(name);
		user.setUpwd(pwd);
		String flag = userService.checkLogin(user);
		if (flag.equals("true")) {
			response.sendRedirect(request.getContextPath()+"/jsp/doPageNews_list.jsp");
		} else {
			
		}
	%>
</body>
</html>
package cn.bdqn.webnews.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bdqn.webnews.entity.User;
import cn.bdqn.webnews.service.UserService;
import cn.bdqn.webnews.service.impl.UserServiceImpl;

public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserService userService = new UserServiceImpl();
		
		String flag = request.getParameter("action");
		
		if(flag.equals("register")){
			
			String name = request.getParameter("username");
			String pwd = request.getParameter("pwd");
			
			boolean isReg = userService.checkName(name);
			if(!isReg){
				User user = new User();
				user.setUname(name);
				user.setUpwd(pwd);
				userService.addUser(user);
				response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
			}
		}else if(flag.equals("login")){
			String name = request.getParameter("username");
			String pwd = request.getParameter("pwd");
			boolean islog = userService.checkName(name);
			if(islog){
				User user = new User();
				user.setUname(name);
				user.setUpwd(pwd);
				userService.addUser(user);
				response.sendRedirect(request.getContextPath()+"/jsp/doPageNews_list.jsp");
			
		}else{
			response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
			
		}
	}

	}
}

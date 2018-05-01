<%@page import="cn.bdqn.webnews.service.impl.TopicServiceImpl"%>
<%@page import="cn.bdqn.webnews.service.TopicService"%>
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
		//获取主题名称
		String tname = request.getParameter("tname");
		//获取隐藏域里边的主题id
		String reqId = request.getParameter("tid");
		int tid = Integer.parseInt(reqId);
		TopicService topicService = new TopicServiceImpl();
		int res = topicService.UpdateTopic(tid, tname);
		if(res == 1){
			response.getWriter().print("<script type=\"text/javascript\">alert('修改成功');window.location.href=\"news_list.jsp\"</script>");
			//response.sendRedirect("");
		}else{
			
		}
	%>
</body>
</html>
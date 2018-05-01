<%@page import="cn.bdqn.webnews.dao.impl.TopicDaoImpl"%>
<%@page import="cn.bdqn.webnews.dao.TopicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String reqId = request.getParameter("opt");
		int tid = Integer.parseInt(reqId);
		//根据id查询该主题下是否有新闻列表---查的是news表
		TopicDao tDao = new TopicDaoImpl();
		boolean flag = tDao.checkId(tid);
		if(flag){
			//如果该主题下有新闻那么不能删除
			response.getWriter().print("<script type=\"text/javascript\">alert('不能删除');window.location.href=\"topic_delete.jsp\"</script>");
		}else{
			int res = tDao.deleteTopic(tid);
			if(res ==1){
				response.getWriter().print("<script type=\"text/javascript\">alert('删除成功');window.location.href=\"news_list.jsp\"</script>");
			}
		}
	%>
</body>
</html>
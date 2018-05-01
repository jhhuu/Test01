<%@page import="cn.bdqn.webnews.entity.Topic"%>
<%@page import="java.util.List"%>
<%@page import="cn.bdqn.webnews.dao.TopicDao"%>
<%@page import="cn.bdqn.webnews.dao.impl.TopicDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="doTopic_delete.jsp" method="post">
		请选择删除的主题:<select name="opt">
						<%
							TopicDao tDao = new TopicDaoImpl();
							List<Topic> tList = tDao.getTopics();
							for(Topic t : tList){
						%>
								<option value="<%=t.getTid()%>"><%=t.getTname()%></option>
						<%} %>
					</select>
					<br/><br/>
		<input name="sum" type="submit" value="删除"/>
	</form>
</body>
</html>
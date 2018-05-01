<%@page import="cn.bdqn.webnews.entity.Topic"%>
<%@page import="java.util.List"%>
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
	<h3>添加新闻</h3>
	<form action="doNews_add.jsp" method="post" enctype="multipart/form-data">
		主题：
			<select name="opt">
				<%
				TopicService tService = new TopicServiceImpl();
				List<Topic> topics = tService.getTopics();
				for(Topic t : topics){
				%>
				<option value="<%=t.getTid()%>"><%=t.getTname()%></option>
				<%} %>
			</select>
		<br><br>
		标题：<input name="title" type="text"/>
		<br><br>
		作者：<input name="author" type="text"/>
		<br><br>
		摘要：<textarea name="summary" rows="2" cols="16"></textarea>
		<br><br>
		内容：<textarea name="content" rows="8" cols="26"></textarea>
		<br><br>
		上传图片：<input name="file" type="file"/>
		<br><br>
		<input name="sub" type="submit" value="提交"/>
		<input name="res" type="reset" value="重置"/>
		<br><br>
	</form>
</body>
</html>
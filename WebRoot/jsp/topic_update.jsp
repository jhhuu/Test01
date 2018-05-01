<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%=request.getParameter("tid") %> --%>
	<form action="doTopic_update.jsp" method="post">
		请输入主题名称：<input name="tname" type="text"/>
		<input name="tid" type="hidden" value="<%=request.getParameter("tid") %>"/>
		<br><br>
		<input name="sub" type="submit" value="修改"/>
	</form>
</body>
</html>
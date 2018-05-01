<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/UserServlet?action=register" method="post">
		用户名：<input name="username" type="text"/><br/><br/>
		密码：<input name="pwd" type="password"/><br/><br/>
		确认密码：<input name="rePwd" type="password"/><br/><br/>
		<input name="sub" type="submit" value="注册"/><br/><br/>
	</form>
</body>
</html>
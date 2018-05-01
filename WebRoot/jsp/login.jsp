<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<style type="text/css">
	#main{
		//border:1px solid red;
		width:228px;
		background:aqua;
		margin: 0 auto;
		margin-top: 150px;
		padding: 5px;
	}
</style>
</head>
<body>
	<div id="main">
		<form action="<%=request.getContextPath()%>/UserServlet?action=login" method="post">
			用户名：<input name="username" type="text"/><br/><br/>
			密&emsp;码：<input name="pwd" type="password"/><br/><br/>
			<input name="sub" type="submit" value="登录"/><br/><br/>
		</form>
	</div>
</body>
</html>
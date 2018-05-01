<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
	   <form action="doUpload_01.jsp" method="post" enctype="multipart/form-data">
	   		用户名：<input name="username" type="text"/>
	   		<br><br>
			上传图片：<input name="file" type="file"/>
			<br><br>
			<input name="sub" type="submit" value="上传"/>
	   </form>
  </body>
</html>

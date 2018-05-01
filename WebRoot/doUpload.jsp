<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
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
		//创建工厂
		//父类的引用指向子类的对象
		FileItemFactory factory = new DiskFileItemFactory();
		//解析form表单
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		//解析request请求
		List<FileItem> items = fileUpload.parseRequest(request);
		
		//遍历集合
		for(FileItem fi : items){
			if(fi.isFormField()){//是普通表单字段
				/*
					通过name属性值，获取用户输入的信息
					String name = request.getParameter("username");
					当form表单中添加enctype="multipart/form-data"属性时，
					以上获取用户输入内容的方法就不能使用了
					enctype="multipart/form-data"是多部件提交方式
					
					多部件提交的方式是以：
						-----------------------------7e27a283070e
					分隔符来
					把每个提交的数据分割开来
				*/
				//仅仅是获取name属性值
				if(fi.getFieldName().equals("username")){
					//如果name属性值和“username”一样，那么我们使用getString()方法获取用户输入的信息
					String name = fi.getString("utf-8");
					out.print(name);
				}
			}else{//文件表单字段
				
			}
		}
	%>
</body>
</html>
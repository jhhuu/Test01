<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileUploadBase"%>
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
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		
		//设置上传图片的大小限制---30kb
		fileUpload.setSizeMax(1024*3000);
		
		try{
			
			List<FileItem> items = fileUpload.parseRequest(request);
		
			for(FileItem fi : items){
				if(fi.isFormField()){//是普通表单字段
					if(fi.getFieldName().equals("username")){
						String name = fi.getString("utf-8");
						out.print(name);
						out.print("<br><br>");
					}
				}else{//文件表单字段
					
					String path = fi.getName();
					File file = new File(path);
					//获取文件名称
					String picName = file.getName();
					//out.print(pciName);
					String[] str = {"gif","bmp","jpg","png"};
					//把数组转换成集合
					List<String> fileType = Arrays.asList(str);
					//截取文件的类型---后缀名
					//获取.所在的位置
					int dot = picName.lastIndexOf(".");
					//获取后缀名---一个参数，包括开始，一直到结束
					String exm = picName.substring(dot + 1);
					//集合中是否包含
					if(!fileType.contains(exm)){
						out.print("文件上传的格式有误");
					}
				}
			}
			
		}catch(FileUploadBase.SizeLimitExceededException ex){
			out.print("文件超出限制");
		}
		
	%>
</body>
</html>
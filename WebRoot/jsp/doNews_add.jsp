<%@page import="java.io.File"%>
<%@page import="cn.bdqn.webnews.service.impl.NewsServiceImpl"%>
<%@page import="cn.bdqn.webnews.service.NewsService"%>
<%@page import="cn.bdqn.webnews.entity.News"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
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
		int tid = 0;//主题id
		String title = "";//标题
		String author = "";//作者
		String summary = "";//摘要
		String content = "";//内容
		String picPath = "";//图片路径
		
		News news = new News();
		NewsService newsService = new NewsServiceImpl();
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		List<FileItem> items = fileUpload.parseRequest(request);
		
		for(FileItem fi : items){
		
			if(fi.isFormField()){
				
				if(fi.getFieldName().equals("opt")){//主题id
				
					String reqTid = fi.getString("utf-8");
					tid = Integer.parseInt(reqTid);
					news.setNtid(tid);
					
				}else if(fi.getFieldName().equals("title")){//标题
					
					news.setNtitle(fi.getString("utf-8"));
					
				}else if(fi.getFieldName().equals("author")){//作者
					
					news.setNauthor(fi.getString("utf-8"));
					
				}else if(fi.getFieldName().equals("summary")){//摘要
					
					news.setNsummary(fi.getString("utf-8"));
					
				}else if(fi.getFieldName().equals("content")){//内容
					
					news.setNcontent(fi.getString("utf-8"));
					
				}
			
				
			}else{
			
				//获取图片的名称
				String path = fi.getName();
				File file = new File(path);
				String fileName = file.getName();
				//获取服务器的真实路径
				String serverPath = getServletContext().getRealPath("upload");
				//判断upload文件夹是否存在
				File filePath = new File(serverPath);
				if(!filePath.exists()){//是否存在
					filePath.mkdirs();//多层创建
				}
				
				
				String str = serverPath + "/" + fileName;
				//out.print(serverPath);
				news.setNpicPath(str);
				
				//首先把图片上传至服务器
				fi.write(new File(serverPath + "/" + fileName));
				//out.print(serverPath + "/" + fileName);
				//把数据插入到数据库
				newsService.addNews(news);
				
				//重定向到doPageNews_list.jsp
				response.sendRedirect("doPageNews_list.jsp");
			}
		}
	%>
</body>
</html>
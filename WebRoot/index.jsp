<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("path",request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>首页</title>
 </head>
  
  <body>
    <a href="${path }/student/studentAdd.action">新增学生</a> 
     <!--  直接进入后台，由后台跳转到指定页面  -->
  </body>
</html>

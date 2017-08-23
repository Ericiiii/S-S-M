<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
    pageContext.setAttribute("ctx", path);
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文件上传</title>
<link rel="stylesheet" href="${ctx}/resources/xheditor/css/xheditor.css" type="text/css" media="screen" />
<script type="text/javascript" src="${ctx}/resources/scripts/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/resources/xheditor/xheditor-1.1.13-zh-cn.min.js"></script>

<script type="text/javascript">
$(function(){
	$('#elm1').xheditor({
		upLinkUrl:".${ctx}/xheditorServlet?type=ajax",
		upImgUrl:"${ctx}/xheditorServlet?type=ajax",
		upImgExt:"jpg,jpeg,gif,png"
	});
	
	$('#elm2').xheditor({skin:'vista'});
});
	

</script>
</head>
<body>

<form id="frmDemo" method="post" action="${ctx}/xheditorServlet">
	<h3>文件上传</h3>
	<input type='hidden' name="type" value="info" />
	标题:<input type='text' name="title" /><br>	
	姓名:<input type='text' name="author" /><br>
	班级:<input type='text' name="cls" /><br>

	面试资料:<br />
	<textarea id="elm1" name="jobInfo" rows="12" cols="80" style="width: 80%"></textarea>
	<br/>
	上传:<br/>
	<textarea id="elm2" name="elm2" rows="12" cols="80" style="width: 90%">
	</textarea><br />
	
	<input type="submit" value="提交"> 
</form>
</body>
</html>
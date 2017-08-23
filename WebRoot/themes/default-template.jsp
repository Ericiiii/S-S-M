<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><sitemesh:write property="title" /></title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	
	<!-- 系统默认的资源配置信息 -->
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/default.theme.css" media="screen"></link>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery-1.8.3.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.cookie-1.8.0.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.autocomplete-1.1.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.datepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.ztree-3.4.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.form-3.14.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.flexigrid-1.1.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.pagination-2.2.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.validate-1.9.0.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.dialog-4.1.6.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctx}/resources/scripts/jquery.common-1.0.0.js" charset="UTF-8"></script>
	
	<!-- 映射到访问页面的首部(header)资源 -->
	<sitemesh:write property="head" />
	
</head>
<body id="body">
	<div id="body-wrapper">
	  <!-- Wrapper for the radial gradient background -->
	  <div id="sidebar">
	    <div id="sidebar-wrapper">
	      <div id="body-content">
			    <!-- Page Head -->
			    <div class="body-title">
			    	<spring:message code="screen.welcome.title" />
			    </div>
		    </div>
	      <!-- Sidebar Profile links -->
	      <div id="profile-links"> Hello&nbsp; <b>${user.username}</b>, you have <a href="#messages" rel="modal" title="3 Messages">3 Messages</a><br />
	        <br />
	        <a href="#" title="View the Site">View the Site</a> | 
	        <a href="#" title="Sign Out">Sign Out</a> 
	      </div>
	      <ul id="main-nav">
	        <!-- Accordion Menu -->
	        <li><a href="${user.attributes.menus.menuUrl}" class="nav-top-item" 
	        	title="${user.attributes.menus.grouped}"> 首页 </a></li>
	      <li><a href="#" class="nav-top-item" title="学生管理"> 学生管理 </a>
        		<ul style="display: none;">
        			<li><a href="${ctx}/student/studentAdd.action" name="新增学生"> 新增学生 </a></li>
        			<li><a href="${ctx}/student/findStudent.action" name="管理学生"> 管理学生 </a></li>
        		</ul>
	       </li>
	       
	      </ul>
	      <!-- End #main-nav -->
	    </div>
	  </div>
	  <!-- Page Head -->
  	<div id="main-header">
	     	<p class="main-timer"><b>${user.attributes.realname }</b>&nbsp;亲,<span id="show-timer" ></span></p>
	  </div>
	  <!-- End #sidebar -->
	  <div id="main-content">
	  	<div class="clear"></div>
	    <!-- 映射到访问页面的内容(body)资源 -->
			<sitemesh:write property="body" />
	    <div class="clear"></div>
	    <div id="footer"><small>
	    	<p>Powered by <a href="#">Lxitedu Single Sign On</a></p>
	      <!-- Remove this notice or replace it with whatever you want -->
	      &#169; Copyright 2010-2013 Your Company | Powered by <a href="http://www.lxitedu.com">Home page</a> | <a href="#">Top</a></small></div>
	    <!-- End #footer -->
	  </div>
	  <!-- End #main-content -->
	</div>
</body>
</html>
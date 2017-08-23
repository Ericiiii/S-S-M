<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../resources/taglibs.jsp" %>
<html>
  <head>
    <title>新增学生</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${ctx}/resources/xheditor/css/xheditor.css" type="text/css" media="screen" />
	<script type="text/javascript" src="${ctx}/resources/xheditor/xheditor-1.1.13-zh-cn.min.js"></script>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		 /* 验证表单信息. */
		  $("form[name=addUsersForm]").validate({
		    submitHandler: function(form){
		   	  $(form).ajaxSubmit({
		   		  success:function(response) {
		   			  alert("---su:"+response);
		   			  if (response.success) {
		   				  $.dialog.tips(response.message);
		   				} else {
		   					$.dialog.error(response.message);
		   				}
		   			},
		   			error:function(response){
			   			  alert("---error:"+response);
			   			  
		   				$.dialog.error(response.message);
		   			}
		   		});
		    }
		  });
		  
		   /*出生日期*/
		 $('input[name=birthday]').datepicker();
		 
		 //文本编辑框插件 
		 $("textarea[name=explain]").xheditor();
		  
	});
	</script>
  </head>
  
  <body>
  <div class="notification title">
    <div class="title-next">当前操作：学生管理&nbsp;<span>&nbsp;创建学生</span></div>
	</div>
	<div class="content-box">
	  <div class="content-box-header"><h3>创建学生信息</h3></div>
	  <div class="content-box-content">
	    <form name="addUsersForm" action="${ctx}/student/studentAdd.action" method="post">
	      <p class="align-right">
	        <label>学号</label>
	        <input type="text" name="stuId" class="text-input medium-input required number {messages:{required:'学号不能为空.'}}" />
	        <br><small>必输项，只能输入数字字符[1-10000].</small></p>
	      <p class="align-left">
	        <label>学生姓名</label>
	        <input type="text" name="name" class="text-input medium-input required chinese {rangelength:[2,20],messages:{required:'姓名不能为空'}}"
	        	/>
	        <br><small>必输项.请输入中文姓名</small></p>
	        <p class="clear"></p>
	      <p class="align-left">
	        <label>年龄</label>
	        <input type="text" name="age" class="text-input medium-input required number {rangelength:[1,3],messages:{required:'年龄不能为空'}}" />
	        <br><small>必输项</small></p>
	   
	      <p class="align-left">
	        <label>出生日期</label>
	        <input type="text" name="birthday" readonly="readonly" class="date-input medium-input required number{messages:{required:'请选择出生日期'}}"  style="width: 100px"/>
          <p class="align-right">
	        <label>性别</label>
	        <select name="sex" >
	          <option value="男">男</option>
	          <option value="女">女</option>
	        </select>
	        
	      <p class="clear"></p>
	       <p class="align-left">
	        <label>手机号码</label>
	        <input type="text" name="phone" class="text-input medium-input required phone {rangelength:[8,11],messages:{required:'手机号码不能为空'}}"/>
	        <br><small>必输项,输入8-11位电话号码</small></p>
	      <p class="align-right">
	        <label>邮箱</label>
	        <input type="text" name="email"  class="text-input medium-input required email {messages:{required:'请输入邮箱'}}"/>
	      <p class="clear"></p>
	         <p class="align-left">
	        <label>备注</label>
	       <input name="remark" type="text" class="text-input medium-input remark}" />
	      <p class="align-right">
	      <p class="clear"></p>
	        <label>个人说明</label>
	        <textarea rows="10" cols="40" name="explain"  style="width: 90%;hight:200px"></textarea>
	        
	      <p class="clear"></p>
	      <p>
	      	<button class="button" type="submit">创建</button>
	      </p>
	    </form>
	  </div>
	</div>
    
  </body>
</html>

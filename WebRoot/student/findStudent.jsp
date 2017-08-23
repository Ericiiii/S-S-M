<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../resources/taglibs.jsp" %>
<html>
  <head>
    <title>新增学生</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
	$(document).ready(function(){
		/* 查询表单数据信息. */
		$("#findUsersGrid").flexigrid({
			url : '${ctx}/student/findStudent.action',
			
			colModel : [{
				display:'学号', name:'stuId', width:30, sortable:true, hide: false
			}, {
				display:'学生姓名', name:'name', width:50, sortable:true, align:'left'
			}, {
				display:'性别', name:'sex', width:30, sortable:true, align:'left'
			}, {
				display:'年龄', name:'age', width:50, sortable:true, align:'left'
			}, {
				display:'出生日期', name:'birthday', width:80, sortable:true, align:'left'
			}, {
				display:'学生电话', name:'phone', width:80, sortable:true, align:'left'
			}, {
				display:'邮箱', name:'email', width:120, sortable:true, align:'left'
			}, {
				display:'备注', name:'remark', width:120, sortable:true, align:'left'
			}, {
				display:'个人说明', name:'explain', width:100, sortable:true, align:'left'
			}],
			buttons : [ {
                        name : '删除',
                        bclass : 'delete',
                        onpress : function(){
                        //判断是否选择目标 
                       if($(".trSelected").size()==1){
                          //提示是否删除，如果点确认进入下面的方法 
                          $.dialog.confirm("你确定要删除本条数据？",function(){
                           //拿到要删除的学号 
                          var val=$(".trSelected").find("td[abbr=stuId]").text();
                           //进入后台删除数据 
                          $.post("studentDelete.action",{'stuId':val,'t':new Date()},function(date){
                            //如果删除成功，显示信息并刷新
                            if (date.success) {
		   				  $.dialog.tips(date.message);
		   				  query();
		   				  } else {
		   					$.dialog.error(date.message);
		   				     }
		   			    });
                          
                          });
                       
                        } else { //如果没有选择学生 
                        $.dialog("请选择一行你要删除的学生 ！");
                        return;
                       }
                    }
                        },
                        
                     {
                        name : '修改',
                        bclass : 'edit',
                        onpress : function(){ 
                          //判断是否选择目标 
                       if($(".trSelected").size()==1){
                         //如果单击修改，隐藏查询的信息
                         $("#showUser").hide();
                         //显示选择的学生的信息
                         $("#updateSession").show();
                         
                        //这种方法可以得到选中学生的信息，并把值赋到修改的表单
                        /*  $("input[name=stuId]").val($(".trSelected").find("td[abbr=stuId]").text());
                         $("input[name=name]").val($(".trSelected").find("td[abbr=name]").text()); */
                       
                        
                         
                         $("[name=updateUsersForm] *").each(function(){
                          //把选中的学生的所有值赋到修改的表单上显示 , *代表显示指定name下的所有后代 
                           
                          $(this).val($(".trSelected").find("td[abbr="+$(this).attr('name')+"]").text());
                           
                          /*  var sex=$(".trSelected").find("td[abbr=sex]").text(); */
                          
                           //性别赋值 
							/*  $("#sex").val(sex); */
                           //刷新
                         
                         });
                         
                         var sex=$(".trSelected").find("td[abbr=sex]").text();
                         //alert("sex"+sex);
                         
                         $("select[name=sex] option")[1];
                         /*	//$("select[name=sex]").selectedIndex= 2;
                          if(sex=="男        "){
                          	$("select[name=sex] option")[0].text="男";
                          	//$("select[name=sex]").option[0] = true;
                          }else if(sex=="男        "){
                          	//$("select[name=sex]").selectIndexed = 1;
                          	$("select[name=sex] option")[1].text="nm ";
                          }*/
                         
                        }else {
                          $.dialog("请选择一行你要修改的学生 ！");
                           return;
                        }
                        
                       }
                  
                    },
                    {
                        name : '刷新',
                        bclass : 'flush',
                        onpress : function(){
                          //当点击刷新时，调用查询方法刷新
                          query();
                        }
                    },
                      {
                        separator : true
                 } ]
			
		});
		
		//单击查询按钮
		$("button[name=submit]").click(function(){
			query();
		});
		
		function query(){
			$("#findUsersGrid").flexOptions({
				params : [{
					name:'name', value:$("input[name=name]").val()
				}]
			}).flexReload();
		}
		
		
	  //返回方法 
	  $("#back").click(function(){
	     //如果返回到查询页面，那么查询的内容显示，修改表单隐藏 
	     $("#showUser").show();
	     $("#updateSession").hide();	  
	  
	  });
	  
	  $("form[name=updateUsersForm]").validate({
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
		  
		  
	});
	
	</script>
  </head>
  
  <body>
 
<div class="notification title">
	<div class="title-next">当前操作：用户管理&nbsp;<span>&nbsp;查询用户</span></div>
</div>
<div class="content-box"  id="showUser">
  <div class="content-box-header"><h3>查询用户信息</h3></div>
  <form class="content-box-content">
		用户名：<input type="text" name="name" class="text-input" />
		<button class="button" name="submit" type="button">查询</button>
		<button class="button" name="reset" type="reset">清空</button>
  </form>
  <table id="findUsersGrid"></table>
</div>

<div id="updateSession" class="content-box-content" style="display:none;">
	    <form name="updateUsersForm" action="studentUpdate.action" method="post">
	      <p class="align-right">
	        <label>学号</label>
	        <input type="text" name="stuId" class="text-input medium-input required number {messages:{required:'学号不能为空.'}}" readonly="readonly"/>
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
	        <select name="sex" id="sex">
	          <option value="男">男</option>
	          <option value="女">女</option>
	        </select>
	        
	        
	        
	 <!--男<input id="sex" type="radio" name="sex" checked="true" value="男"/>
	         女<input type="radio" name="sex" value="女"/> -->
	        
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
	       <textarea rows="10" cols="40" name="remark"></textarea>
	      <p class="align-right">
	        <label>个人说明</label>
	        <textarea rows="10" cols="40" name="explain"></textarea>
	        
	      <p class="clear"></p>
	      <p>
	      	<button class="button" type="submit">修改</button>
	      	<button class="button" type="button" id="back">返回</button>
	      </p>
	    </form>
	  </div>
  </body>
</html>

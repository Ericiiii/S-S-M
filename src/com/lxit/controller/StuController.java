package com.lxit.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxit.bean.StudentBean;
import com.lxit.service.StuService;

/*
 * 学生管理控制层
 * */
@Controller
// 控制层的服务类
@RequestMapping("/student")
// 请求的地址
public class StuController {

	// 打印日志信息
	private Log log = LogFactory.getLog(StuController.class);

	// 获取service实例
	@Autowired
	private StuService stuService;

	/*
	 * 跳转到新增学生的页面
	 */
	@RequestMapping(value = "/studentAdd.action", method = RequestMethod.GET)
	public String studentAddPage() {
        log.info("111000:Kaihsi tiaohzunag  !");
		return "/student/studentAdd.jsp";
	}

	/*
	 * 学生增加方法
	 */ 
/*	@RequestMapping(value = "/studentAdd.action", method = RequestMethod.POST)
	public void studentAdd(StudentBean bean, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("新增学生的业务实现，得到参数 ：" + bean);

		boolean flag = stuService.stuAdd(bean);
		response.setContentType("text/json;charset=utf-8");
		try {
			PrintWriter pw = response.getWriter();
			if (flag) {
				pw.print("{\"success\":\"true\",\"message\":\"新增成功\"}");
			} else {
				pw.print("{\"message\":\"新增失败\"}");
			}
			pw.flush();
			pw.close();

		} catch (IOException e) {

			e.printStackTrace();
		}

	}*/
	
	//学生增加方法  ResponseBody 响应内容的注解
	@RequestMapping(value = "/studentAdd.action", method = RequestMethod.POST)
	public @ResponseBody  StudentBean studentAdd(StudentBean bean, HttpServletRequest request,
		  HttpServletResponse response){
		log.info("11001:学生增加业务开始 "+bean);
		  
		   try {
			stuService.studentAdd(bean);
			 
			  if(bean.isSuccess()){
				  bean.setMessage("学生增加成功");
			  }else {
				  bean.setMessage("学生增加失败");
			  }
		} catch (Exception e) {
			e.printStackTrace();
			bean.setError("新增业务失败");
		}
	
		  return bean;
	}
	
    /*
	 * 跳转到管理学生的页面
	 */
	@RequestMapping(value = "/findStudent.action", method = RequestMethod.GET)
	public String studentFind() {

		return "/student/findStudent.jsp";

	}

	// 学生查询方法
/*	@RequestMapping(value = "/findStudent.action", method = RequestMethod.POST)
	public void studentQuery(StudentBean bean, HttpServletResponse response) throws IOException {
		
		log.info("1002:前台接收到的参数是:"+bean);
		
		List<StudentBean> list =(List<StudentBean>)stuService.stuQuery(bean);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml;charset:utf-8");
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<rows>");
		sb.append("<page>1</page>");
		sb.append("<total>20</total>");
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				StudentBean stu = list.get(i);
				System.out.println("stu============"+stu);
				sb.append("<row id='"+stu.getStuId()+"'>");
				sb.append("<cell>"+stu.getStuId()+"</cell>");
				sb.append("<cell>"+stu.getName()+"</cell>");
				sb.append("<cell>"+stu.getSex()+"</cell>");
				sb.append("<cell>"+stu.getAge()+"</cell>");
				sb.append("<cell>"+stu.getBirthday()+"</cell>");
				sb.append("<cell>"+stu.getPhone()+"</cell>");
				sb.append("<cell>"+stu.getEmail()+"</cell>");
				sb.append("<cell>"+stu.getRemark()+"</cell>");
				sb.append("<cell>"+stu.getExplain()+"</cell>");
				sb.append("</row>");
			}
			sb.append("</rows>");
			PrintWriter out = response.getWriter();
			log.info("1004:toString结果:"+sb.toString());
			out.print(sb.toString());
			out.flush();
			out.close();
		}
	}*/
	
	//学生分页查询方法  
	@RequestMapping(value = "/findStudent.action", method = RequestMethod.POST)
	public @ResponseBody StudentBean studentQuery(StudentBean bean, HttpServletResponse response) throws IOException {
		log.info("1002:查询学生的业务实现,得到参数:"+bean);
		bean=stuService.studentQuery(bean);
		
		return bean;
	}
	
	/*
	 * 跳转到管理学生的页面
	 */

	//学生删除方法 
	@RequestMapping(value = "/studentDelete.action", method = RequestMethod.POST)
	public @ResponseBody StudentBean studentDelete(StudentBean bean, HttpServletResponse response) throws IOException {
		log.info("1002:查询学生的业务实现,得到参数:"+bean);
		try {
			bean=stuService.stuDelete(bean);
			if(bean.isSuccess()){
				  bean.setMessage("学生删除成功");
			  }else {
				  bean.setMessage("学生删除失败");
			  }
		} catch (Exception e) {
			
			e.printStackTrace();
			bean.setError("学生删除失败");
		}
		return bean;
	}
	
	//学生修改方法 
	@RequestMapping(value = "/studentUpdate.action", method = RequestMethod.POST)
	public @ResponseBody StudentBean studentUpdate(StudentBean bean, HttpServletResponse response) throws IOException {
		log.info("1001：进入学生修改方法"+bean);
		bean=stuService.stuUpdate(bean);
		if(bean.isSuccess()){
			bean.setMessage("修改成功");
		}else {
			bean.setMessage("修改失败");
		}
		return bean;
	}

	
	
	
}

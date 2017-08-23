package com.lxit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.lxit.bean.StudentBean;
import com.lxit.dao.StuDao;

/*
 *  学生服务层 
 * */

@Service
public class StuService {
	@Autowired
	private  StuDao stuDao;
	
	
	/*public void setStuDao(StuDao stuDao) {
		this.stuDao = stuDao;
	}*/

	//学生增加方法 
	/*public  boolean stuAdd(StudentBean bean){
		boolean  flag;
		flag=stuDao.stuAdd("model.stu.stuAdd",bean);
		return flag;
    }*/
	
	//学生增加方法 
	public StudentBean studentAdd(StudentBean bean){
		stuDao.stuAdd("model.stu.stuAdd", bean);
		bean.setSuccess(true);
		return bean;
	} 
	
	/*//学生查询方法
	public List<?> stuQuery(StudentBean bean){
		return stuDao.stuQuery("model.stu.stuQuery",bean);
	}*/
	
	//学生分页查询 
	public StudentBean studentQuery(StudentBean bean){
		 //查询总数据量 
		 Long count=(Long)stuDao.stuQueryCount("model.stu.queryStudentCount", bean);
		 //查询数据 
		 List rows=stuDao.stuQuery("model.stu.queryStudent", bean);
		 bean.setRows(rows);
		 bean.setTotalCount(count);
		 bean.setSuccess(true);
		 
		return bean;
	} 
	
	//学生修改方法
	public StudentBean stuUpdate(StudentBean bean){
		stuDao.stuUpdate("model.stu.stuUpdate",bean);
		bean.setSuccess(true);	
		return bean;
	}
	//学生删除方法 
	public StudentBean  stuDelete(StudentBean bean){
		stuDao.studentDelete("model.stu.stuDelete", bean);
		bean.setSuccess(true);
		return bean;
		
	}
	
	

}

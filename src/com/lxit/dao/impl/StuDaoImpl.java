package com.lxit.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lxit.dao.StuDao;

@Repository

public class StuDaoImpl implements StuDao{
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
	/*public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
*/
	//学生增加方法 
	public boolean stuAdd(String name, Object obj) {
		try {
			sqlSessionTemplate.insert(name,obj);
			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return false;
	}
    
	//学生分页查询方法 
	public List<?> stuQuery(String name, Object obj) {
		return sqlSessionTemplate.selectList(name, obj);
	}
	//查询学生总数据量
	public  Object stuQueryCount(String name,Object obj){
		return sqlSessionTemplate.selectOne(name, obj);
	}
	
	//学生修改方法 
	public void stuUpdate(String name,Object obj){
		sqlSessionTemplate.update(name, obj);
	}
	
	//学生删除方法
	public void studentDelete(String name,Object obj){
		sqlSessionTemplate.delete(name, obj);
	}

}

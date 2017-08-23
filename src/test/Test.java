package test;

import java.util.List;

import org.junit.Before;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lxit.bean.StudentBean;
import com.lxit.service.StuService;

public class Test {
	
	private StuService stuService;
	@Before
	public void init(){
		BeanFactory  bf=new ClassPathXmlApplicationContext("classpath:spring.xml");
		stuService=(StuService)bf.getBean("stuService");
		
	}
	//@org.junit.Test
	/*public void add(){
	
		StudentBean  bean=new StudentBean();
		bean.setStuId(7L);
		bean.setName("艾翔");
		bean.setAge(22L);
		
		bean.setSex('男');
		bean.setPhone("13522563135");
		bean.setEmail("947481841@qq.com");
		bean.setRemark("湖南省");
		bean.setExplain("成熟稳重，内外兼修");
		boolean flag=stuService.stuAdd(bean);
		System.out.println("flag==="+flag);
		
	}*/
	/*@org.junit.Test
	public void query(){
		StudentBean bean=new StudentBean();
		List list=stuService.stuQuery(bean);
		System.out.println("list"+list);
		
	}*/
	
	/*@org.junit.Test
	public void update(){
		StudentBean bean=new StudentBean();
		bean.setStuId(2L);
		bean.setName("stussy");
		boolean flag=stuService.stuUpdate(bean);
		System.out.println("flag============="+flag);
	}*/
	
/*	@org.junit.Test
    public void delete(){
		StudentBean bean=new StudentBean();
		bean.setStuId(2L);
		System.out.println(stuService.stuDelete(bean));
	}*/
	
	/*
	 * 学生查询测试 
	 * */
	
	@org.junit.Test
	public void stuQuery(){
		System.out.println("测试查询开始");
		StudentBean bean=new StudentBean ();
		bean=stuService.studentQuery(bean);
		
	System.out.println("model"+bean);
		
	}
 
	//学生删除测试 
	/*public void studentDelete(){
		StudentBean bean=new StudentBean ();
		bean.setStuId(13L);
		bean=stuService.stuDelete(bean);
		System.out.println("结果为:"+bean);
		
	}*/
}

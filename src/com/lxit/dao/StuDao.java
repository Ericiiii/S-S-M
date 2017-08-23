package com.lxit.dao;

import java.util.List;

public interface StuDao {
	 public  boolean stuAdd(String name,Object obj);
     public  List<?> stuQuery(String name,Object obj);
     public  Object stuQueryCount(String name,Object obj);
     public  void stuUpdate(String name,Object obj);
     public void studentDelete(String name,Object obj);
}

package com.lxit.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.lxit.util.CustomDateSerializer;



/**
 * 系统持久化对象基类，通过泛型类设计进行扩展，所有持久层的类都应该继承自Pojo类.
 * 
 */
public class Pojo<T> implements Serializable {

	/**
	 * 序列化编号.
	 */
	private static final long serialVersionUID = -4658799939880991528L;

	/**
	 * 所有子类的流水号.
	 */
	private String sid;

	/**
	 * 所有子类的创建日期.
	 */
	private Date created;

	/**
	 * 所有业务操作成功的状态.
	 */
	private boolean success;

	/**
	 * 所有业务方法处理消息.
	 */
	private String message;

	/**
	 * 所有错误方法处理消息.
	 */
	private String error;

	/**
	 * 所有表单请求参数.
	 */
	private String json;

	/**
	 * 所有子类存放的数据集合对象.
	 */
	private List<T> rows = new ArrayList<T>();

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	@JsonSerialize(using = CustomDateSerializer.class)
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	@JsonIgnore
	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	/**
	 * 通过反射方式实现，输出对象的所有属性。
	 * 
	 * @ReflectionToStringBuilder.toString(),通过反射方式实现。
	 */
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
}

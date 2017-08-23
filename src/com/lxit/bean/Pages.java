package com.lxit.bean;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * 分页类
 * 
 * @param <T>
 */
public class Pages<T> extends Pojo<T> {
	/**
	 * 序列化编号.
	 */
	private static final long serialVersionUID = 3885702483311119528L;
	
	private static int DEFAULT_PAGE_SIZE = 30;// 默认页记录数
	private int pageSize = DEFAULT_PAGE_SIZE; // 每页的记录数
	private long totalCount; 		// 总记录数
	private int page = 1; 			// 页数
	private int start; 			    // 当前页第一条数据在List中的位置,从0开始
	private int limit; 			    // 当前页结束条数据在List中的位置,从0开始
	private String sortname="sid"; 		// 排序字段
	private String sortorder="desc"; 		// 排序方式
	/**
	 * 取数据库中包含的总记录数
	 */
	@JsonProperty("total")
	public long getTotalCount() {
		return this.totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * 取总页数
	 */
	public long getTotalPageCount() {
		pageSize = (pageSize <= 0) ? DEFAULT_PAGE_SIZE : pageSize;
		if (totalCount % pageSize == 0)
			return totalCount / pageSize;
		else
			return totalCount / pageSize + 1;
	}

	/**
	 * 取每页数据容量
	 */
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStart() {
		this.start=(page-1)*pageSize;
		return this.start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLimit() {
		this.limit=(page-1)*pageSize+pageSize;
		return this.limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getSortname() {
		return sortname;
	}

	public void setSortname(String sortname) {
		this.sortname = sortname;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}

}

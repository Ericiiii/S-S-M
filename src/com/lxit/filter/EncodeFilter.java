package com.lxit.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*
 * 
 * 过滤器
 */
public class EncodeFilter implements javax.servlet.Filter{
private String charSet;
	
	public void destroy() {
		
	}
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		/*设置请求编码*/
		req.setCharacterEncoding(charSet);
		/*设置响应编码*/
		resp.setCharacterEncoding(charSet);
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig fconfig) throws ServletException {
		System.out.println("编码过滤器开始运转...");
		charSet = fconfig.getInitParameter("charSet");
	}

}

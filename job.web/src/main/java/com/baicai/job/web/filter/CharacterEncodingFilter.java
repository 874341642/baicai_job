package com.baicai.job.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 
 * com.shoubao.filter
 * 
 * @author 刘小军
 * @date 2016-1-26
 */
public class CharacterEncodingFilter implements Filter {

	String encoding = "utf-8";

	public void destroy() {
		encoding = null;
	}

	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (encoding != null) {
			// 设置request字符编码
			request.setCharacterEncoding(encoding);
			// 设置response字符编码
			response.setContentType("text/html;charset=" + encoding);
			// response.setCharacterEncoding(encoding);
			// response.setContentType("text/html");
		}
		//System.out.println("CharacterEncodingFilter");
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding");
	}
}

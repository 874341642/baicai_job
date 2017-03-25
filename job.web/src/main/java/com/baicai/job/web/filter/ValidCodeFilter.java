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
public class ValidCodeFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse rep, FilterChain filterChain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// HttpServletRequest request = (HttpServletRequest) req;
		// HttpServletResponse response = (HttpServletResponse) rep;
		/*
		 * String code = request.getParameter("j_valid"); HttpSession session =
		 * request.getSession(); String s_code = (String)
		 * session.getAttribute("J_CODE"); if
		 * (request.getHeader("Referer").contains("/html/ssologin") ||
		 * code.equalsIgnoreCase(s_code)) { filterChain.doFilter(req, rep); }
		 * else { response.sendRedirect(request.getContextPath()+
		 * "/index.jsp?login_error=2"); }
		 */
		System.out.println("ValidCodeFilter");
		filterChain.doFilter(req, rep);
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}

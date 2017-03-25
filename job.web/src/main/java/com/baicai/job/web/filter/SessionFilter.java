package com.baicai.job.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * com.shoubao.filter
 * 
 * @author 刘小军
 * @date 2016-1-26
 */
public class SessionFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String strUrl = request.getRequestURI();
		if (strUrl.toLowerCase().indexOf("/admindb") < 0 && strUrl.toLowerCase().indexOf("/test") < 0) {
			// HttpSession session = request.getSession();
			// String access_token = request.getParameter("access_token");
			// String timestamp = request.getParameter("timestamp");
			// String params = request.getParameter("params");
			// if (StringUtil.isNullAndBlank(access_token)) {
			// writeToJson(false,
			// ReqResultState.INVALID_TOKEN.code(),"无效的TOKEN", request,
			// response);
			// return;
			// }
			// if (StringUtil.isNullAndBlank(timestamp)) {
			// writeToJson(false, ReqResultState.FAIL.code(),
			// "无效的TIMESTAMP",request, response);
			// return;
			// }
			// String accessTokenDecrypt =
			// AES256Encryption.decrypt(access_token);
			// if (StringUtil.isNullAndBlank(accessTokenDecrypt)) {
			// writeToJson(false, ReqResultState.FAIL.code(),
			// "无效的TOKEN",request, response);
			// return;
			// }
			// if (accessTokenDecrypt.indexOf(timestamp) == -1) {
			// writeToJson(false, ReqResultState.FAIL.code(),
			// "无效的TIMESTAMP",request, response);
			// return;
			// }
		}

		filterChain.doFilter(request, response);
	}

	// private void writeToJson(Boolean success, int code, String msg,
	// HttpServletRequest request, HttpServletResponse response) {
	// DefaultResp<Map<String, Object>> dr = new DefaultResp<Map<String,
	// Object>>();
	// dr.setSuccess(success);
	// dr.setResultCode(code);
	// dr.setResultMsg(msg);
	// dr.setData(new HashMap<String, Object>());
	// JSONObject jsonBr = JSONObject.fromBean(dr);
	// StringView sv = new StringView(jsonBr.toString());
	// sv.render(null, request, response);
	// }

	public void init(FilterConfig arg0) throws ServletException {
	}
}

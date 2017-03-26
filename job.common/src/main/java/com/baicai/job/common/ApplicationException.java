package com.baicai.job.common;


public class ApplicationException extends RuntimeException {

	private static final long serialVersionUID = 2585847744599629981L;

	// 默认错误代码
	public static final Integer GENERIC = 1000000;
	// 错误代码
	private Integer errorCode;

	public ApplicationException(Integer errorCode, Throwable cause) {
		this(errorCode, null, cause);
	}

	public ApplicationException(String message, Throwable cause) {
		// 利用通用错误代码
		this(GENERIC, message, cause);
	}

	public ApplicationException(Integer errorCode, String message, Throwable cause) {
		super(message, cause);
		this.errorCode = errorCode;
	}

	public Integer getErrorCode() {
		return errorCode;
	}

}
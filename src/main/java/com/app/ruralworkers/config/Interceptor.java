package com.app.ruralworkers.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class Interceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object handler) throws Exception {

//		String apiKey = httpServletRequest.getHeader("X-Auth-Token");
//
//		if (apiKey == null) {
//
//			httpServletResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//
//			return false;
//		}
//
//		ApiKey apiKeyData = userService.getUserIdByApiSecret(apiKey);
//
//		if (apiKeyData == null) {
//
//			httpServletResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//
//			return false;
//		}
//
//		if (!apiKeyData.getIsActive().equals("Y")) {
//
//			httpServletResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//
//			return false;
//		}
//
//		if(httpServletRequest.getRequestURL().toString().contains("/v1/admin/")) {
//
//			if(apiKeyData.getRoleId() == null) {
//				return false;
//			}
//
//		}
//
//		 httpServletRequest.setAttribute("userId", apiKeyData.getUserId());
//		httpServletRequest.setAttribute("X-Auth-Token", apiKeyData.getKeySecret());
//		httpServletRequest.setAttribute("tenantId", apiKeyData.getTenantId());
//		httpServletRequest.setAttribute("compId", apiKeyData.getCompId());

		return true;

	}

}

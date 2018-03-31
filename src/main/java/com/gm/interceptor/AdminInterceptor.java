package com.gm.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gm.base.model.sys.User;
import com.xiaoleilu.hutool.util.ArrayUtil;

/**
 * 后台拦截器
 *
 */
@Component
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = (User) request.getSession().getAttribute("curUser");
		if (user != null) {
			if (handler instanceof HandlerMethod) {
				HandlerMethod method = (HandlerMethod) handler;
				RequiresPermissions permision = method.getMethodAnnotation(RequiresPermissions.class);
				if (permision == null) {
					return true;
				} else {
					String[] codes = permision.value();
					List<String> ress = (List<String>) request.getSession().getAttribute("ress");
					if (ress == null) {
						return false;
					} else {
						boolean b = ress.stream().anyMatch(p -> ArrayUtil.contains(codes, p));
						if (!b) {
							response.sendRedirect("/error/403");
						}
						return b;
					}
				}
			}
			return true;
		} else {
			response.sendRedirect("/admin/login.htm");
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
package com.gm.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gm.utils.IPUtil;

/**
 * app会员拦截器
 *
 */
@Component
public class AppMemberInterceptor implements HandlerInterceptor {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// System.out.println(">>>MyInterceptor1>>>>>>>在请求处理之前进行调用（Controller方法调用之前）");

		System.err.println("请求：" + request.getRequestURI() + "，mid:" + request.getParameter("mid"));

		String mid = request.getParameter("mid");
		if ("".equals(mid) || mid == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.append("{\"info\":\"NotLogged\"}");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (out != null) {
					out.close();
				}
			}
			return false;
		}
		String deviceCode = request.getParameter("deviceCode");
		String deviceName = request.getParameter("deviceName");
		ServletContext servletContext = request.getSession(true).getServletContext();
		String ip = IPUtil.getIpAddr(request);
	/*	Member member = new Member();
		if (servletContext.getAttribute(mid) == null) {
			member = memberService.get(memberService.idDecrypted(mid));
			MemberLoginLog.Builder builder = new MemberLoginLog.Builder();
			MemberLoginLog loginLog = builder.memberToken(mid).ip(ip).deviceCode(deviceCode).deviceName(deviceName)
					.member(member).build();

			memberLoginLogService.add(loginLog);
			servletContext.setAttribute(mid, loginLog);
		} else {
			member = ((MemberLoginLog) servletContext.getAttribute(mid)).getMember();
		}*/
	//	request.setAttribute(Const.CUR_MEMBER, member);

		return true;// 只有返回true才会继续向下执行，返回false取消当前请求
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// System.out.println(">>>MyInterceptor1>>>>>>>请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// System.out.println(">>>MyInterceptor1>>>>>>>在整个请求结束之后被调用，也就是在DispatcherServlet
		// 渲染了对应的视图之后执行（主要是用于进行资源清理工作）");
	}

}
package com.gm.interceptor;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 拦截器配置
 * 
 * @author ying
 *
 */

@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {
	@Resource
	private AppInterceptor appInterceptor;
	@Resource
	private AppMemberInterceptor appMemberInterceptor;
	@Resource
	private AdminInterceptor adminInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		// 后台
		registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**").excludePathPatterns("/admin/login")
				.excludePathPatterns("/admin/aplogin").excludePathPatterns("/admin/login.htm")
				.excludePathPatterns("/admin/login.html").excludePathPatterns("/admin/qrLogin")
				.excludePathPatterns("/admin/loginAction");

		// app
		registry.addInterceptor(appInterceptor).addPathPatterns("/app/**");

		// 会员app
		registry.addInterceptor(appMemberInterceptor).addPathPatterns("/app/member/**")
				.excludePathPatterns("/app/member/reg.json").excludePathPatterns("/app/member/login.json")
				.excludePathPatterns("/app/member/getMobileCode.json")
				.excludePathPatterns("/app/member/ckeckMobileCode.json")
				.excludePathPatterns("/app/member/updatePassword.json")
				.excludePathPatterns("/app/member/chaceMobile.json")
				.excludePathPatterns("/app/member/comment/getComment").excludePathPatterns("/app/member/quit.json");

		super.addInterceptors(registry);
	}

}
package com.app.ruralworkers.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableTransactionManagement
@EnableAutoConfiguration(exclude = HibernateJpaAutoConfiguration.class)
@ComponentScan(basePackages = { "com.*" })
public class Config implements WebMvcConfigurer {

	@Autowired
	private Environment env;

	@Autowired
	private Interceptor interceptor;


	@Override
	public void addInterceptors(InterceptorRegistry registry) {

//		registry.addInterceptor(interceptor)
//				.addPathPatterns("/v1/auth/**", "/v1/admin/**", "/v1/invite/**", "/v1/blog/comment/add/**",
//						"/v1/blog/comment/like/add/**")
//				.excludePathPatterns("/v1/auth/user/login", "/v1/admin/login", "/v1/auth/user/forgot/password",
//						"/v1/auth/user/otp/verify", "/v1/invite/open/status/**");

	}

//	@Bean("filestoreAccountsBeans")
//	public static PropertiesFactoryBean getFileStoreManager() {
//		PropertiesFactoryBean ppc = new PropertiesFactoryBean();
//		Resource[] resources = new ClassPathResource[] { new ClassPathResource("filestore.properties") };
//		ppc.setLocations(resources);
//		return ppc;
//	
//	}

}

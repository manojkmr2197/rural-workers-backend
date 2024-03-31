package com.app.ruralworkers.config;

import com.app.ruralworkers.Entity.City;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@PropertySource("classpath:db.properties")
@EnableTransactionManagement
@EnableAutoConfiguration(exclude = HibernateJpaAutoConfiguration.class)
@ComponentScan(basePackages = { "com.*" })
public class DatabaseConfig implements WebMvcConfigurer {

	@Autowired
	private Environment env;

	@Autowired
	private Interceptor interceptor;

	@Bean
	public DataSource getDBDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(env.getProperty("db.driver"));
		dataSource.setUrl(env.getProperty("db.url"));
		dataSource.setUsername(env.getProperty("db.username"));
		dataSource.setPassword(env.getProperty("db.password"));
		return dataSource;
	}

	@Bean
	public LocalSessionFactoryBean getDBSessionFactory() {
		LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
		factoryBean.setDataSource(getDBDataSource());

		Properties props = new Properties();
		props.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
		props.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
		props.put("hibernate.dialect", env.getProperty("hibernate.dialect"));

		factoryBean.setHibernateProperties(props);
		factoryBean.setAnnotatedClasses(City.class);

		return factoryBean;
	}

	@Bean
	public HibernateTransactionManager getSMTransactionManager() {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(getDBSessionFactory().getObject());
		return transactionManager;
	}

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

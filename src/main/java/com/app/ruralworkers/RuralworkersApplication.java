package com.app.ruralworkers;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

import javax.sql.DataSource;

@SpringBootApplication
public class RuralWorkersApplication {

	public static void main(String[] args) {
		SpringApplication.run(RuralWorkersApplication.class, args);
	}
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(dataSource);
		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		vendorAdapter.setDatabasePlatform("org.hibernate.dialect.MySQL5Dialect");
		em.setJpaVendorAdapter(vendorAdapter);
		em.setPackagesToScan("com.app.ruralworkers.entity"); // Package where your JPA entities are located
		return em;
	}
}

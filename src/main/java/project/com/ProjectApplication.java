package project.com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
//import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.support.SpringBootServletInitializer;

//import project.com.properties.FileStorageProperties;


@SpringBootApplication
//@EnableConfigurationProperties({
//    FileStorageProperties.class
//})
public class ProjectApplication extends SpringBootServletInitializer{

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ProjectApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(ProjectApplication.class, args);
	}
}

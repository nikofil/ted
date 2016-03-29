package gr.uoa.di;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
public class TedApplication {

	public static void main(String[] args) {
		SpringApplication.run(TedApplication.class, args);
	}
}

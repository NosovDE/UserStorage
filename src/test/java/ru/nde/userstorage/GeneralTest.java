package ru.nde.userstorage;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

/**
 * Author:      Dmitriy E. Nosov <br>
 * Date:        10.02.14, 22:05 <br>
 * Company:     Korus Consulting IT<br>
 * Description:  <br>
 */
@Configuration
@ComponentScan("ru.nde.userstorage")
@EnableWebMvc
public class GeneralTest {

    @Bean
    public UrlBasedViewResolver setupViewResolver() {
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);
        return resolver;
    }

}

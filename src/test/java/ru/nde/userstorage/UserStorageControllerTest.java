package ru.nde.userstorage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

/**
 * Author:      Dmitriy E. Nosov <br>
 * Date:        10.02.14, 22:02 <br>
 * Company:     Korus Consulting IT<br>
 * Description:  <br>
 */
//@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = GeneralTest.class)
//@ContextConfiguration(locations = {"classpath:/META-INF/spring/applicationContext.xml"})
public class UserStorageControllerTest {
    @Autowired
    private WebApplicationContext wac;

    private MockMvc mock;

    @Before
    public void init() {
        mock = MockMvcBuilders.webAppContextSetup(wac).build();
    }

//    @Test
//    public void testSlashPage() throws Exception {
//        mock.perform(get("/"))
//                .andExpect(status().isOk())
//                .andExpect(view().name("index"));
//    }

//    @Test
//    public void testIndexPage() throws Exception {
//        mock.perform(get("/index"))
//                .andExpect(status().isOk())
//                .andExpect(view().name("index"));
//    }

}

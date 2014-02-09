package ru.nde.userstorage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: Dmitriy E. Nosov <br>
 * @date: 09.02.14, 11:34 <br>
 * @description: <br>
 */
@Controller
//@RequestMapping(value = "/")
public class UserStorageController {
    private static final Logger logger = LoggerFactory.getLogger(UserStorageController.class);


    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();

        mav.getModel().put("id", "11111111");

        return mav;
    }
}

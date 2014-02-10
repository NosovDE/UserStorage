package ru.nde.userstorage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.nde.userstorage.dao.UserDao;
import ru.nde.userstorage.entity.User;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: Dmitriy E. Nosov <br>
 * @date: 09.02.14, 11:34 <br>
 * @description: <br>
 */
@Controller
public class UserStorageController {
    private static final Logger logger = LoggerFactory.getLogger(UserStorageController.class);

    @Autowired
    private UserDao userDao;

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.getModel().put("userList", userDao.getUserList());
        mav.getModel().put("user", new User());
        return mav;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") final User user, HttpServletRequest request) {
        final User u = new User(
                request.getParameter("name"),
                request.getParameter("lastname"),
                Double.parseDouble(request.getParameter("salary"))
        );
        userDao.addUser(u);
        return "redirect:/index";
    }

    @RequestMapping(value = "/edit/{userId}")
    public String editUser(@PathVariable("userId") final Integer userId) {
        ModelAndView modelAndView = new ModelAndView();

        final User user = userDao.getUser(userId);


        modelAndView.addObject("user", user);
        return "redirect:/index";
    }

    @RequestMapping(value = "/user/add/process")
    public ModelAndView addingTeam(@ModelAttribute final User user) {
        ModelAndView modelAndView = new ModelAndView();
//        teamService.addTeam(user);
        String message = "Team was successfully added.";
        modelAndView.addObject("message", message);
        return modelAndView;
    }


    @RequestMapping("/delete/{userId}")
    public String deleteUser(@PathVariable("userId") Integer userId) {
        userDao.deleteUser(userId);
        return "redirect:/index";
    }
}

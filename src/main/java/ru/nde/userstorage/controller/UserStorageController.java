package ru.nde.userstorage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.nde.userstorage.dao.UserDao;
import ru.nde.userstorage.model.SortType;
import ru.nde.userstorage.model.User;
import ru.nde.userstorage.service.UserStorageService;

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
    private UserStorageService service;

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public ModelAndView index(final HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        final SortType sortType;
        final String sortBy = request.getParameter("sortBy");
        if (sortBy != null) {
            sortType = SortType.valueOf(sortBy);
        } else {
            sortType = SortType.id;
        }

        mav.getModel().put("userList", service.getAllUserByOrder(sortType, 0, 100));
        mav.getModel().put("user", new User());
        return mav;
    }

    @RequestMapping("/index/{sortBy}")
    public ModelAndView index(@PathVariable("sortBy") final String sortBy, final HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("index");
        final SortType sortType;
        // sortBy = request.getParameter("sortBy");
        if (sortBy != null) {
            sortType = SortType.valueOf(sortBy);
        } else {
            sortType = SortType.id;
        }

        mav.getModel().put("userList", service.getAllUserByOrder(sortType, 0, 100));
        mav.getModel().put("user", new User());
        return mav;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(final User user, final HttpServletRequest request) {
        final User u = new User(
                request.getParameter("name"),
                request.getParameter("lastname"),
                Double.parseDouble(request.getParameter("salary"))
        );
        service.addUser(u);
        return "redirect:/index";
    }

    @RequestMapping(value = "/edit/{userId}")
    public ModelAndView editUser(@PathVariable("userId") final Integer userId) {
        ModelAndView modelAndView = new ModelAndView("edit");

        final User user = service.getUser(userId);
        if (user != null) {
            modelAndView.addObject("user", user);
            modelAndView.addObject("name", user.getName());
            modelAndView.addObject("lastname", user.getLastname());
            modelAndView.addObject("salary", user.getSalary());
            modelAndView.addObject("id", user.getId());
        } else {
            return new ModelAndView("index");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/index/{userId}", method = RequestMethod.POST)
    public ModelAndView editUser(final User user, final HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("index");
        //userDao.getUser(Integer.parseInt(request.getParameter("id")));
        final User u = new User(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("name"),
                request.getParameter("lastname"),
                Double.parseDouble(request.getParameter("salary"))
        );
        service.updateUser(u);
        return modelAndView;
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
    public String deleteUser(@PathVariable("userId") final Integer userId) {
        service.removeUser(userId);
        return "redirect:/index";
    }

//    @RequestMapping("/sort/{type}")
//    public String sortUser(@PathVariable("type") final String type) {
//
//
//        return "redirect:/index";
//    }
}

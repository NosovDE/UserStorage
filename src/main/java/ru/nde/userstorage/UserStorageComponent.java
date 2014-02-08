package ru.nde.userstorage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import ru.nde.userstorage.dao.UserDao;
import ru.nde.userstorage.entity.User;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.List;

/**
 * @author: Dmitriy E. Nosov <br>
 * @date: 08.02.14, 18:28 <br>
 * @description: <br>
 */
@Component
public class UserStorageComponent {
    private static final Logger logger = LoggerFactory.getLogger(UserStorageComponent.class);

    @Autowired
    private UserDao userDao;

    public UserStorageComponent() {
    }

    @PostConstruct
    public void start() {

        final List<User> userList = userDao.getUserList();

        System.out.println("User List: " + userList);

    }


}

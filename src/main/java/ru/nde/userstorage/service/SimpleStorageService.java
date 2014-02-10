package ru.nde.userstorage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.nde.userstorage.dao.UserDao;
import ru.nde.userstorage.model.SortType;
import ru.nde.userstorage.model.User;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Dmitriy E. Nosov <br>
 * @date: 10.02.14, 23:08 <br>
 * @description: <br>
 */
@Service
@Transactional
public class SimpleStorageService implements UserStorageService {
    private static final Logger logger = LoggerFactory.getLogger(SimpleStorageService.class);

    @Autowired
    private UserDao userDao;

    /**
     * Add user
     *
     * @param user user object
     */
    @Override
    public void addUser(final User user) {
        logger.info("Add {}", user);
        try {
            userDao.addUser(user);
            logger.info("Successfully add {}", user);
        } catch (DataAccessException e) {
            logger.error("DataAccessException: " + e, e);
        }
    }

    /**
     * Update user model
     *
     * @param user user object
     */
    @Override
    public void updateUser(final User user) {
        logger.info("Update {}", user);
        try {
            userDao.updateUser(user);
            logger.info("Successfully update {}", user);
        } catch (DataAccessException e) {
            logger.error("DataAccessException: " + e, e);
        }
    }

    /**
     * Get user by ID
     *
     * @param id identify of user
     * @return user user object or null if user is not found
     */
    @Nullable
    @Override
    public User getUser(final int id) {
        logger.info("get user by id [{}]", id);
        try {
            final User user = userDao.getUser(id);
            logger.info("Successfully getUser {}", user);
            return user;
        } catch (DataAccessException e) {
            logger.error("DataAccessException: " + e, e);
        }
        return null;
    }

    /**
     * Get all users with sort and paging
     *
     * @param sortBy enum of sort type: NAME, LASTNAME, SALARY
     * @param skip   skip record
     * @param limit  limit of record
     * @return
     */
    @Nonnull
    @Override
    public List<User> getAllUserByOrder(final SortType sortBy, final int skip, final int limit) {
        logger.info("get all user by order {}, skip {}, limit {}", new Object[]{sortBy, skip, limit});
        try {
            final List<User> userList = userDao.getUserList(sortBy, skip, limit);
            logger.info("Successfully getAllUserByOrder {} item(s)", userList.size());
            return userList;
        } catch (DataAccessException e) {
            logger.error("DataAccessException: " + e, e);
        }
        return new ArrayList<User>(0);
    }

    /**
     * Delete user frob db
     *
     * @param userId
     */
    @Override
    public void removeUser(int userId) {
        logger.info("remove user id [{}]", userId);
        try {
            userDao.deleteUser(userId);
            logger.info("Successfully deleted {}", userId);
        } catch (DataAccessException e) {
            logger.error("DataAccessException: " + e, e);
        }
    }


    @PostConstruct
    public void start() {
        logger.info("init service...");
        final List<User> userList = userDao.getUserList(SortType.name, 0, 100);
        logger.info("user list {}", userList);

    }
}

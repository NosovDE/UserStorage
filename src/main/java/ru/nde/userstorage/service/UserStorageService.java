package ru.nde.userstorage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.nde.userstorage.model.SortType;
import ru.nde.userstorage.model.User;

import java.util.List;

/**
 * @author: Dmitriy E. Nosov <br>
 * @date: 10.02.14, 22:59 <br>
 * @description: <br>
 */
public interface UserStorageService {

    /**
     * Add user
     *
     * @param user user object
     */
    void addUser(User user);

    /**
     * Update user model
     *
     * @param user user object
     */
    void updateUser(User user);

    /**
     * Get user by ID
     *
     * @param id identify of user
     * @return user user object
     */
    User getUser(int id);

    /**
     * Get all users with sort and paging
     *
     * @param sortBy enum of sort type: NAME, LASTNAME, SALARY
     * @param skip   skip record
     * @param limit  limit of record
     * @return
     */
    List<User> getAllUserByOrder(SortType sortBy, int skip, int limit);

    /**
     * Delete user frob db
     */
    void removeUser(int userId);
}

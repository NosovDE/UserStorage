package ru.nde.userstorage.dao;

import ru.nde.userstorage.model.SortType;
import ru.nde.userstorage.model.User;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.List;

/**
 * Author:      Dmitriy E. Nosov <br>
 * Date:        12.02.14, 15:06 <br>
 * Company:     Korus Consulting IT<br>
 * Description:  <br>
 */
public interface UserDao {
    /**
     * Get all users with sorting and paging
     *
     * @param sortBy
     * @param skip
     * @param limit
     * @return
     */
    @Nonnull
    List<User> getUserList(@Nonnull SortType sortBy, int skip, int limit);

    /**
     * Get user by id
     *
     * @param id
     * @return
     */
    @Nullable
    User getUser(int id);

    /**
     * Add user
     *
     * @param user
     * @return
     */
    User addUser(@Nonnull User user);

    /**
     * Update user
     *
     * @param user
     */
    void updateUser(@Nonnull User user);

    /**
     * Delete user
     *
     * @param userId
     */
    void deleteUser(int userId);
}

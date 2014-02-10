package ru.nde.userstorage.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Component;
import ru.nde.userstorage.entity.User;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Dmitriy E. Nosov <br>
 * @date: 08.02.14, 18:18 <br>
 * @description: <br>
 */
@Component
public class UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDao.class);

    @Autowired
    @Qualifier(value = "dataSource")
    private DataSource dataSource;

    /**
     * @return
     */
    @Nonnull
    public List<User> getUserList() {
        final List<User> userList = new ArrayList<>();
        new JdbcTemplate(dataSource).query(
                "SELECT * FROM users", new Object[0], new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                final User user = new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("lastname"),
                        rs.getDouble("salary"));
                userList.add(user);
            }
        });
        return userList;
    }

    /**
     * @param id
     * @return
     */
    @Nullable
    public User getUser(final int id) {
        final User[] user = new User[1];
        new JdbcTemplate(dataSource).query(
                "SELECT * FROM users WHERE id=?", new Object[]{id}, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                user[0] = new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("lastname"),
                        rs.getDouble("salary"));
            }

        });
        return user[0];
    }

    /**
     * @param user
     * @return
     */
    public User addUser(final User user) {
        if (user != null && user.getName() != null && user.getLastname() != null) {
            new JdbcTemplate(dataSource).update(new PreparedStatementCreator() {
                @Override
                public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                    final PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, lastname, salary) values (?, ?, ?)");
                    ps.setString(1, user.getName());
                    ps.setString(2, user.getLastname());
                    ps.setDouble(3, user.getSalary());
                    return ps;
                }
            });
        }
        return user;
    }

    /**
     * @param user
     */
    public void updateUser(final User user) {
        if (user != null) {
            new JdbcTemplate(dataSource).update(new PreparedStatementCreator() {
                @Override
                public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                    final PreparedStatement ps = con.prepareStatement("UPDATE users SET name =?, lastname=?, salary=? WHERE id=?");
                    ps.setString(1, user.getName());
                    ps.setString(2, user.getLastname());
                    ps.setDouble(3, user.getSalary());
                    ps.setDouble(4, user.getId());
                    return ps;
                }
            });
        }
    }


    /**
     * @param userId
     */
    public void deleteUser(final int userId) {
        new JdbcTemplate(dataSource).update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                final PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id=?");
                ps.setInt(1, userId);
                return ps;
            }
        });
    }
}
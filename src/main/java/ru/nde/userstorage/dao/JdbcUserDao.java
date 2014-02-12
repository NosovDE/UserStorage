package ru.nde.userstorage.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Component;
import ru.nde.userstorage.model.SortType;
import ru.nde.userstorage.model.User;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.PostConstruct;
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
public class JdbcUserDao implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(JdbcUserDao.class);

    @Autowired
    @Qualifier(value = "dataSource")
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;

    @PostConstruct
    void init() {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Nonnull
    public List<User> getUserList(@Nonnull final SortType sortBy, final int skip, final int limit) {
        final List<User> userList = new ArrayList<>();

        jdbcTemplate.query(new PreparedStatementCreator() {
                               @Override
                               public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                                   final PreparedStatement ps = con.prepareStatement(
                                           "SELECT * FROM users ORDER BY " + sortBy.name() + " LIMIT " + skip + "," + limit);
                                   return ps;
                               }
                           }, new RowCallbackHandler() {
                               @Override
                               public void processRow(ResultSet rs) throws SQLException {
                                   final User user = new User(
                                           rs.getInt("id"),
                                           rs.getString("name"),
                                           rs.getString("lastname"),
                                           rs.getDouble("salary"));
                                   userList.add(user);
                               }
                           }
        );
        return userList;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Nullable
    public User getUser(final int id) {
        final User[] user = new User[1];
        jdbcTemplate.query(
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
     * {@inheritDoc}
     */
    @Override
    public User addUser(final User user) {
        if (user != null && user.getName() != null && user.getLastname() != null) {
            jdbcTemplate.update(new PreparedStatementCreator() {
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
     * {@inheritDoc}
     */
    @Override
    public void updateUser(final User user) {
        final User findUser = getUser(user.getId());
        if (findUser != null) {
            jdbcTemplate.update(new PreparedStatementCreator() {
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
     * {@inheritDoc}
     */
    @Override
    public void deleteUser(final int userId) {
        jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                final PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id=?");
                ps.setInt(1, userId);
                return ps;
            }
        });
    }
}
package ru.nde.userstorage.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Component;
import ru.nde.userstorage.entity.User;

import javax.annotation.Nonnull;
import javax.sql.DataSource;
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
     *
     * @return
     */
    @Nonnull
    public List<User> getUserList(){
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

}
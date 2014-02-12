package ru.nde.userstorage.dao;

import org.springframework.jdbc.core.RowCallbackHandler;
import ru.nde.userstorage.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Author:      Dmitriy E. Nosov <br>
 * Date:        12.02.14, 15:21 <br>
 * Company:     Korus Consulting IT<br>
 * Description:  <br>
 */
public class RowCallback implements RowCallbackHandler {

    @Override
    public void processRow(ResultSet rs) throws SQLException {
        final User user = new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("lastname"),
                rs.getDouble("salary"));
       // userList.add(user);
    }
}

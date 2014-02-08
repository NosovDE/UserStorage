package ru.nde.userstorage.entity;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author: Dmitriy E. Nosov <br>
 * @date: 08.02.14, 18:31 <br>
 * @description: <br>
 */
public class User {
    private static final Logger logger = LoggerFactory.getLogger(User.class);
    /**
     *
     */
    private int id;
    /**
     *
     */
    private String name;
    /**
     *
     */
    private String lastname;
    /**
     *
     */
    private double salary;


    public User(int id, String name, String lastname, double salary) {
        this.id = id;
        this.name = name;
        this.lastname = lastname;
        this.salary = salary;
    }

    public User(String name, String lastname, double salary) {
        this.name = name;
        this.lastname = lastname;
        this.salary = salary;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getLastname() {
        return lastname;
    }

    public double getSalary() {
        return salary;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("User{");
        sb.append("id=").append(id);
        sb.append(", name='").append(name).append('\'');
        sb.append(", lastname='").append(lastname).append('\'');
        sb.append(", salary=").append(salary);
        sb.append('}');
        return sb.toString();
    }
}

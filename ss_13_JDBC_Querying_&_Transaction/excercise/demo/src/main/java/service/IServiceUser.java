package service;

import model.User;

import java.util.List;

public interface IServiceUser {
    List<User> findAll();

    boolean updateUser(User user);

    boolean deleteUser(int id);

    boolean insertUser(User user);

    User selectUser(int id);

    List<User> searchByCountry(String countryName);

    List<User> sortByName();
    public String addUserTransaction(User user);
}

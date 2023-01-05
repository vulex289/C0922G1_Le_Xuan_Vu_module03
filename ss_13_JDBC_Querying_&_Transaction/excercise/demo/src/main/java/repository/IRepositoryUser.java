package repository;

import model.User;

import java.util.List;

public interface IRepositoryUser {
    List<User> findAll();

    boolean updateUser(User user);

    boolean deleteUser(int id);

    boolean insertUser(User user);

    User selectUser(int id);

    public List<User> searchByCountry(String countryName);

    public List<User> sortByName();
    public String addUserTransaction(User user);
}

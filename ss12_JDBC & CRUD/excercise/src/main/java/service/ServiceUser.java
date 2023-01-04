package service;

import model.User;
import repository.IRepositoryUser;
import repository.impl.RepositoryUser;

import java.util.List;

public class ServiceUser implements IServiceUser {
    IRepositoryUser iRepositoryUser = new RepositoryUser();

    @Override
    public List<User> findAll() {
        return iRepositoryUser.findAll();
    }

    @Override
    public boolean updateUser(User user) {
        return iRepositoryUser.updateUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return iRepositoryUser.deleteUser(id);
    }

    @Override
    public boolean insertUser(User user) {
        return iRepositoryUser.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iRepositoryUser.selectUser(id);
    }

    public List<User> searchByCountry(String countryName) {
        return iRepositoryUser.searchByCountry(countryName);
    }

    public List<User> sortByName() {
        return iRepositoryUser.sortByName();
    }
}
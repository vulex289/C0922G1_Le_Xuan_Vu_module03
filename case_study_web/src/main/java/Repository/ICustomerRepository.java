package Repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    Customer findById(int id);
    boolean createCustomer(Customer customer);
    boolean editCustomer(Customer customer);
    boolean deleteCustomer(int id);
    List<Customer>searchByName(String name , String customerType);
}

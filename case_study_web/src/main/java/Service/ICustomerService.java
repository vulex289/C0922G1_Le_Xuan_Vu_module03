package Service;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAll();
    Customer findById(int id);
    Map<String,String> createCustomer(Customer customer);
    boolean editCustomer(Customer customer);
    boolean deleteCustomer(int id);
    List<Customer>searchByName(String name, String customerType);
}

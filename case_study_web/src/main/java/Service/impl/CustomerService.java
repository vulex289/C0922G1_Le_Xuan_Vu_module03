package Service.impl;

import Repository.impl.CustomerRepository;
import Repository.ICustomerRepository;
import Service.ICustomerService;
import model.Customer;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public boolean createCustomer(Customer customer) {
        return customerRepository.createCustomer(customer);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return false;
    }
}

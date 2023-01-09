package Service.impl;

import Repository.impl.CustomerRepository;
import Repository.ICustomerRepository;
import Service.ICustomerService;
import model.Customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        Map<String, String>maps= new HashMap<>();
        return customerRepository.findAll();
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public boolean createCustomer(Customer customer) {
        return customerRepository.createCustomer(customer);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return customerRepository.editCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public List<Customer> searchByName(String name,int customerType) {
        return customerRepository.searchByName(name,customerType);
    }

}

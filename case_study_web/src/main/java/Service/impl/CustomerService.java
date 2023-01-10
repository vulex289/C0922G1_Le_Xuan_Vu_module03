package Service.impl;

import Repository.impl.CustomerRepository;
import Repository.ICustomerRepository;
import Service.ICustomerService;
import model.Customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    private static final String nameValidate = "^[A-Z][a-z]+( [A-Z][a-z]+)*$";
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public Map<String,String> createCustomer(Customer customer) {
        Map<String,String> mapCustomer = new HashMap<>();
        if (!checkInput(customer.getCustomerName(), nameValidate)){
    mapCustomer.put("name","Chưa đúng định dạng");
        }
        if(mapCustomer.isEmpty()){
            customerRepository.createCustomer(customer);
        }
        return mapCustomer;
    }
    boolean checkInput(String value,String regex){
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(value);
        return matcher.matches();
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
    public List<Customer> searchByName(String name,String customerType) {
        return customerRepository.searchByName(name,customerType);
    }

}

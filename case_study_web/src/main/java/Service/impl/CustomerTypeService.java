package Service.impl;

import Repository.ICustomerTypeRepository;
import Repository.impl.CustomerTypeRepository;
import Service.ICustomerTypeService;
import model.CustomerType;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }
}

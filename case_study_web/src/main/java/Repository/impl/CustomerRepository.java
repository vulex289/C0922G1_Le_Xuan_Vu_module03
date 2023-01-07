package Repository.impl;

import Repository.BaseRepository;
import Repository.ICustomerRepository;
import model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String FIND_ALL = "select * from customer";
    private static final String INSERT_CUSTOMER = "insert into customer(customer_name,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id) values(?,?,?,?,?,?,?,?)";

    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                String customerName = resultSet.getString("customer_name");
                String dateOfBirth = resultSet.getString("date_of_birth");
               int gender = resultSet.getInt("gender");
                int idCard = resultSet.getInt("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                Customer customer = new Customer(customerId,customerName,dateOfBirth,gender,idCard,phoneNumber,email,address,customerTypeId);
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public boolean createCustomer(Customer customer) {
       Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setString(1,customer.getCustomerName());
            preparedStatement.setString(2,customer.getDateOfBirth());
            preparedStatement.setInt(3,customer.getGender());
            preparedStatement.setInt(4,customer.getIdCard());
            preparedStatement.setString(5,customer.getPhoneNumber());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getCustomerTypeId());
           return preparedStatement.executeUpdate() >0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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

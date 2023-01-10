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
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id = ?";
    private static final String SEARCH_CUSTOMER_BY_NAME = " select* from customer c join customer_type ct on c.customer_type_id = ct.customer_type_id where c.customer_name like ? and ct.customer_type_name like ?";
    private static final String DELETE_CUSTOMER_BY_ID = "delete from customer where customer_id = ?";
    private static final String UPDATE_CUSTOMER = "update customer set customer_name = ?,date_of_birth=?,gender=?,id_card = ?," +
            "phone_number=?,email=?,address=?,customer_type_id=? where customer_id = ?";

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
        Connection connection = BaseRepository.getConnectDB();
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String customerName = resultSet.getString("customer_name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                int gender = resultSet.getInt("gender");
                int idCard = resultSet.getInt("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                 customer = new Customer(customerName,dateOfBirth,gender,idCard,phoneNumber,email,address,customerTypeId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
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
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1,customer.getCustomerName());
            preparedStatement.setString(2,customer.getDateOfBirth());
            preparedStatement.setInt(3,customer.getGender());
            preparedStatement.setInt(4,customer.getIdCard());
            preparedStatement.setString(5,customer.getPhoneNumber());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getCustomerTypeId());
            preparedStatement.setInt(9,customer.getCustomerId());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> searchByName(String name, String customerType) {
        Connection connection = BaseRepository.getConnectDB();
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_BY_NAME);
            preparedStatement.setString(1,"%"+name+"%");
            preparedStatement.setString(2,"%"+customerType+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int customerId = resultSet.getInt("customer_id");
                String customerName = resultSet.getString("customer_name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                int gender = resultSet.getInt("gender");
                int idCard = resultSet.getInt("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                Customer customer1 = new Customer(customerId,customerName,dateOfBirth,gender,idCard,phoneNumber,email,address,customerTypeId);
                customers.add(customer1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
}

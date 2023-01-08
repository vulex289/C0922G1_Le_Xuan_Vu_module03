package controller.customer;

import Service.ICustomerService;
import Service.ICustomerTypeService;
import Service.impl.CustomerService;
import Service.impl.CustomerTypeService;
import model.Customer;
import model.CustomerType;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    ICustomerTypeService customerTypeService = new CustomerTypeService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreatForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "search":
                searchByName(request,response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                break;
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAll();
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/customer.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreatForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String message = "Thêm Mới thành công";
        String customerName = request.getParameter("customerName");
        String dayOfBirth = request.getParameter("dayOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(customerName, dayOfBirth, gender, idCard, phoneNumber, email, address, customerTypeId);
        boolean check = customerService.createCustomer(customer);
        if (!check) {
            message = "Không thành công";
        }
        request.setAttribute("message", message);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        String message = "Sửa thành công";
        int customerId = Integer.parseInt(request.getParameter("id"));
        String customerName = request.getParameter("customerName");
        String dayOfBirth = request.getParameter("dayOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(customerId, customerName, dayOfBirth, gender, idCard, phoneNumber, email, address, customerTypeId);
        boolean check = customerService.editCustomer(customer);
        if (!check) {
            message = "Không thành công";
        }
        request.setAttribute("message", message);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        customerService.deleteCustomer(id);
        showList(request, response);
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int customerType = Integer.parseInt(request.getParameter("customerType"));
    List<Customer> customerList = customerService.searchByName(name,customerType);
    List<CustomerType> customerTypeList = customerTypeService.findAll();
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/customer.jsp");
    request.setAttribute("customerList",customerList);
    request.setAttribute("customerTypeList",customerTypeList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }
    }

}

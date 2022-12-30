package com.ex1_show_list_customer;

import model.Customer;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
   private static List<Customer> customerList = new ArrayList<>();
   static {
       customerList.add(new Customer("Lê Xuân Vũ","28/09/1997","79 Nguyễn Thiệt","https://thanhxuaan.com/wp-content/uploads/2020/11/1270445513713171908111072729996585811029427n-1606261388075533287962.jpg"));
       customerList.add(new Customer("Trương Quyền","28/02/1995","79 Nguyễn Thao","https://phunugioi.com/wp-content/uploads/2020/08/anh-cuc-hoa-mi-va-be-gai.jpg"));

   }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }


}
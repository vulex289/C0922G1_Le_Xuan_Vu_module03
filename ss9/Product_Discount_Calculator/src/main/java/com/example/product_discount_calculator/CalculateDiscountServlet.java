package com.example.product_discount_calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = " Calculate Discount", value = "/Discount-Calculator")
public class CalculateDiscountServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
     double  listPrice = Integer.parseInt(request.getParameter("List Price"));
     double discountPercent = Integer.parseInt(request.getParameter("Discount Percent"));
     double discountAmount = listPrice * discountPercent * 0.01;
     double discountPrice = listPrice - discountAmount;
        request.setAttribute("listPrice",listPrice);
        request.setAttribute("discountPercent",discountPercent);
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("display-discount.jsp");
        requestDispatcher.forward(request,response);
    }

    public void destroy() {
    }
}
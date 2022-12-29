package com.example.demo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "SumServlet", urlPatterns = "/sum")
public class ServerTimeServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        Date today = new Date();
//        writer.println("<h1>" + today + "</h1>");
//        writer.println("</html>");
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num1= Integer.parseInt(request.getParameter("n1"));
        int num2= Integer.parseInt(request.getParameter("n2"));
        int sum= num1+num2;
        request.setAttribute("n1",num1);
        request.setAttribute("n2",num2);
        request.setAttribute("tong",sum);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request,response);
    }

}
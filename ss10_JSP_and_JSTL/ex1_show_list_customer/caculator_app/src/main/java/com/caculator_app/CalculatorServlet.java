package com.caculator_app;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "vu", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("operand_1"));
        double secondOperand = Double.parseDouble(request.getParameter("operand_2"));

        double addition = firstOperand + secondOperand;
        double subtraction = firstOperand - secondOperand;
        double multiplication = firstOperand * secondOperand;
        double division = firstOperand / secondOperand;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("firstOperand", firstOperand);
        request.setAttribute("secondOperand", secondOperand);
        request.setAttribute("addition", addition);
        request.setAttribute("subtraction", subtraction);
        request.setAttribute("multiplication", multiplication);
        request.setAttribute("division", division);

        requestDispatcher.forward(request, response);
    }
}
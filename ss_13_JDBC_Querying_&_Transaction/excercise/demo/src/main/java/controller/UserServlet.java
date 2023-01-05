package controller;

import model.User;
import service.IServiceUser;
import service.ServiceUser;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/user")
public class UserServlet extends HttpServlet {
    IServiceUser iServiceUser = new ServiceUser();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateUser(request, response);
                break;
            case "edit":
                showEditUser(request, response);
                break;
            case "delete":
                showDeleteUser(request, response);
                break;
            case "searchByCountry":
                searchByCountry(request, response);
                break;
            case "orderByName":
                orderByName(request, response);
                break;
            default:
                showListUser(request, response);
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
                createUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "view":
                break;
            default:
                break;
        }
    }


    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = iServiceUser.findAll();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("view/user/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateUser(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/user/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        boolean check = iServiceUser.insertUser(user);
        String mes = "Successfull";
        if (!check) {
            mes = "Sorry,try!";
        }
        request.setAttribute("mes", mes);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("view/user/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditUser(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iServiceUser.selectUser(id);
        request.setAttribute("user", user);
        requestDispatcher = request.getRequestDispatcher("view/user/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email,country);
        iServiceUser.updateUser(user);
        requestDispatcher = request.getRequestDispatcher("view/user/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iServiceUser.selectUser(id);
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("view/user/delete.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iServiceUser.deleteUser(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        String countryName = request.getParameter("countryName");
        List<User> userList = iServiceUser.searchByCountry(countryName);
        request.setAttribute("userList", userList);
        requestDispatcher = request.getRequestDispatcher("view/user/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void orderByName(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        List<User> userList = iServiceUser.sortByName();
        request.setAttribute("userList", userList);
        requestDispatcher = request.getRequestDispatcher("view/user/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
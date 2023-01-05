<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/4/2023
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="view/user/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="view/user/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
<link rel="stylesheet" href="view/user/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
<html>
<head>
    <title>List User</title>
</head>
<body>
<h1>List User</h1>
<h4><a href="/user?action=create">Create new user</a></h4>
<h4>
    <form action="/user" method="get">
        <input type="text" name="countryName">
        <input type="submit" name="action" value="searchByCountry" placeholder="Tìm Kiếm">
    </form>
</h4>
<h4>
    <form action="/user" method="get">
        <input type="submit" name="action" value="orderByName" placeholder="Sắp xếp">
    </form>
</h4>
<table class=" table table-primary table-hover text-center">
    <tr class="table-danger">
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Country</th>
        <th colspan="2" scope="col">Actions</th>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a href="/user?action=edit&id=${user.getId()}">Edit</a></td>
            <td><a href="/user?action=delete&id=${user.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

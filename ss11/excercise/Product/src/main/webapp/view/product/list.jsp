<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/2/2023
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="view/product/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="view/product/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
<link rel="stylesheet" href="view/product/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
<html>
<head>
    <title>ListProduct</title>
</head>
<body>
<p>
    <a href="/product?action=create">
        Add new product
    </a>
</p>
<form action="/product" method="get">
    <table>
        <tr>
            <td>Search</td>
            <td><input type="text" name="nameSearch"></td>
        </tr>
        <tr>
            <td><input type="submit" name="action" value="search" placeholder="Tìm Kiếm"></td>
        </tr>
    </table>
</form>

<table class=" table table-primary table-hover text-center">
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Cost</th>
        <th scope="col">Description</th>
        <th scope="col">Producer</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    <c:forEach varStatus="status" var="product" items='${productList}'>
        <tr>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getCost()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/2/2023
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="view/product/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="view/product/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
<link rel="stylesheet" href="view/product/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
<html>
<head>
    <title>Detail Product</title>
</head>
<p>
    <a href="/product">Back to Product List</a>
</p>
<body>
<table table-primary text-center>
    <tr>
        <td >Name:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Cost:</td>
        <td>${product.getCost()}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>Producer:</td>
        <td>${product.getProducer()}</td>
    </tr>
</table>
</body>
</html>

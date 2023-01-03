<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/2/2023
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="view/product/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="view/product/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
<link rel="stylesheet" href="view/product/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
<html>
<head>
    <title>Delete</title>
</head>
<body>
<p>
    <a href="/product">Back to List Product</a>
</p>
<p>

</p>
<form method="post">
    <fieldset>
        <legend>
            Product Information
        </legend>
        <table>
            <tr>
                <td>Name:</td>
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
            <tr>
                <td>
                    <input type="submit" value="Delete">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

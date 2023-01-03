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
    <title>Edit Product</title>
</head>
<body>
<p>
    <a href="/product">Back to productList</a>
</p>
<p>
    <c:if test='${requestScope["message"] !=null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
</p>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table table-primary>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="${product.getName()}"></td>
            </tr>
            <td>Cost</td>
            <td><input type="text" name="cost" value="${product.getCost()}"></td>
            </tr>
            <td>Description</td>
            <td><input type="text" name="description" value="${product.getDescription()}"></td>
            </tr>
            <td>Producer</td>
            <td><input type="text" name="producer" value="${product.getProducer()}"></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="update">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
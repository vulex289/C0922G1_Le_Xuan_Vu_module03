<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 12/30/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table dark" >
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Address</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
       <tr>
        <td>${status.count}</td>
        <td>${customer.name}</td>
        <td>${customer.birthday}</td>
        <td>${customer.address}</td>
        <td><img src=${customer.imageLink} style: height="70px"></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>

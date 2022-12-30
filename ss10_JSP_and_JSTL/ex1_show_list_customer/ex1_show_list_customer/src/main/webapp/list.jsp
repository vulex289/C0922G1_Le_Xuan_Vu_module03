<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 12/30/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
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
        <td>${status.address}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>

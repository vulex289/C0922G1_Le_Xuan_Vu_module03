<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/4/2023
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create User</title>
</head>
<body>
<a href="/user">Back To User List</a>
<p style="color: #0a53be">
    <c:if test="${mes!=null}">
        <span>${mes}</span>
    </c:if>
</p>
<form method="post">
    <table>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Country</td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Insert"></td>
        </tr>
    </table>
</form>
</body>
</html>

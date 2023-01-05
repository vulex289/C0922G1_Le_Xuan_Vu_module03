<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/4/2023
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User</title>
</head>
<body>
<a href="/user">Back To User List</a>
<form method="post">
    <fieldset>
        <legend>User Information</legend>

        <table>
            <tr>
                <td>Name:</td>
                <td>${user.getName()}</td>
            <tr>
                <td>Email:</td>
                <td>${user.getEmail()}</td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${user.getCountry()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/4/2023
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<p>
    <a href="/user">Back To User List</a>
</p>
<form method="post">
    <fieldset>
        <legend>User Information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="${user.getName()}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" value="${user.getEmail()}"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" name="country" value="${user.getCountry()}"></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Edit">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/7/2023
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="../../bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
<style>
    body {
        background-image: url("https://image.winudf.com/v2/image/Y29tLlJlc29ydHdhbGxwYXBlcnMucGljdHVyZXMuYmFja2dyb3VuZHMucGhvdG9zLmltYWdlcy5oZC5mcmVlLmJlYXV0aWZ1bF9zY3JlZW5fMl8xNTMzODgyMTk0XzA4OQ/screen-2.jpg?fakeurl=1&type=.webp");
    }

    input:invalid {
        border-color: red;
    }

    input:valid {
        border-color: green;
    }
</style>
<html>
<head>
    <title>CREATE CUSTOMER</title>
</head>
<body>
<h2 class="text-center">CUSTOMER INFORMATION</h2>
<a href="/customer">
    <button class="btn btn-primary">Back to CustomerList</button>
</a>
<%--<h3 class="btn-warning">${message}</h3>--%>
<%--pattern="^[A-Z][a-z]+( [A-Z][a-z]+)*$" title="Nhập chưa đúng"--%>

<%--<span style="color: red">${namMap.get("name")}</span>--%>
<%--<c:out value="${namMap['name']}"></c:out>--%>


<div class="d-flex justify-content-center">
    <form class="w-50 border border-2 border-success p-3 rounded" method="post">
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Tên Khách Hàng:</label>
            <input type="text" class="form-control" name="customerName" id="recipient-name" required><c:if test="${nameMap!=null}">
            <span style="color: red">${nameMap.get('name')}</span>
        </c:if>
        </div>
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Ngày Sinh</label>
            <input type="date" min="${minAge}" max="${maxAge}" class="form-control" name="dayOfBirth">
        </div>
        <div class="mb-3">
            <label class="form-label" class="d-block me-4">Giới tính</label>
            <%--                <input type="radio" value="1" name="gender" checked> Male--%>
            <%--                <input type="radio" value="0" name="gender"> Female--%>
            <div class="form-check">
                <input value="1" name="gender" class="form-check-input" checked type="radio" name="flexRadioDefault"
                       id="flexRadioDefault1">
                <label class="form-check-label" for="flexRadioDefault1">
                    Male
                </label>
            </div>
            <div class="form-check">
                <input value="0" name="gender" class="form-check-input" type="radio" name="flexRadioDefault"
                       id="flexRadioDefault2" checked>
                <label class="form-check-label" for="flexRadioDefault2">
                    Female
                </label>
            </div>
            <div class="mb-3">
                <label for="recipient-name" class="col-form-label">CMND</label>
                <input oninput="checkCMND(this.value,REGEX_CMND)" required type="text" class="form-control" name="idCard">
                <span style="color: red" id="errorCMND"></span>
            </div>
            <div class="mb-3">
                <label for="recipient-name" class="col-form-label" >Số điện thoại</label>
                <input oninput="checkName(this.value,REGEX_PHONE_NUMBER)" type="text" class="form-control" name="phoneNumber" required title="Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx">
                <span style="color: red" id="errorName"></span>
            </div>
            <div class="mb-3">
                <label for="recipient-name" class="col-form-label">Email</label>
                <input required oninput="checkEmail(this.value,REGEX_EMAIL)" type="text" class="form-control" name="email">
                <span id="errorEmail" style="color: red"></span>
            </div>
            <div class="mb-3">
                <label for="recipient-name" class="col-form-label">Địa chỉ</label>
                <input type="text" required pattern="^\w+$" class="form-control" name="address">
            </div>
            <div class="mb-3">
                <label class="form-label">Loại khách hàng</label>
                <select class="form-select" aria-label="Default select example" name="customerTypeId">
                    <c:forEach var="customerType" items="${customerTypeList}">
                        <option value="${customerType.getCustomerTypeId()}">${customerType.getCustomerTypeName()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3 ">
                <input type="submit" id="btnSave"
                       class=" form-control btn btn-info btn-outline-success btn-sm border border-2 border-success text-dark "
                       value="SAVE">
            </div>
    </form>
</div>
</body>
<script>
    let REGEX_PHONE_NUMBER = /((090)|(091)|([(]84[)]+090)|([(]84[)][+]091))\d{7}$/;
    let REGEX_EMAIL = /^\w+[@](\w+.\w+){1,2}$/;
    let REGEX_CMND = /^[1-9]\d{8}$/;
    function checkName(name,regName) {
        let checkedName = regName.exec(name);
        if (!checkedName) {
            document.getElementById("errorName").innerText = "Chưa đúng định dạng"
            document.getElementById("btnSave").disabled = true;
        } else {
            document.getElementById("btnSave").disabled = false;
            document.getElementById("errorName").innerText = ""
        }
    }
    function checkEmail(name,regName) {
        let checkedName = regName.exec(name);
        if (!checkedName) {
            document.getElementById("errorEmail").innerText = "Email sai định dạng"
            document.getElementById("btnSave").disabled = true;
        } else {
            document.getElementById("btnSave").disabled = false;
            document.getElementById("errorEmail").innerText = ""
        }
    }
    function checkCMND(name,regName) {
        let checkedName = regName.exec(name);
        if (!checkedName) {
            document.getElementById("errorCMND").innerText = "CMND sai định dạng"
            document.getElementById("btnSave").disabled = true;
        } else {
            document.getElementById("btnSave").disabled = false;
            document.getElementById("errorCMND").innerText = ""
        }
    }
</script>
</html>

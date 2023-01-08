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
    <title>CREATE FACILITY</title>
</head>
<body>
<h2 class="text-center">FACILITY INFORMATION</h2>
<a href="/facility">
    <button class="btn btn-primary">Back to FacilityList</button>
</a>
<h3 class="btn-warning">${message}</h3>
<div class="d-flex justify-content-center">
    <form class="w-50 border border-2 border-success p-3 rounded" method="post">
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label" >Tên Dịch Vụ:</label>
            <input type="text" value="${facility.getFacilityName()}" class="form-control" name="facilityName" id="recipient-name" >
        </div>
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Diện tích</label>
            <input type="number"value="${facility.getArea()}" class="form-control" name="area">
        </div>
            <div class="mb-3">
                <label for="recipient-name" class="col-form-label">Giá Tiền</label>
                <input type="number"value="${facility.getCost()}" class="form-control" name="cost">
            </div>
            <div class="mb-3">
                <label for="recipient-name" class="col-form-label">Số lượng người tối đa</label>
                <input type="number" value="${facility.getMaxPeople()}" class="form-control" name="maxPeople">
            </div>
        <div class="mb-3">
            <label class="form-label">Kiểu Thuê</label>
            <select class="form-select" aria-label="Default select example" name="rentTypeId">
                <c:forEach var="rentType" items="${rentTypeList}">
                    <option value="${rentType.getRentTypeId()}">${rentType.getRentTypeName()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Lọai dịch vụ</label>
            <select class="form-select" aria-label="Default select example" name="facilityTypeId">
                <c:forEach var="facilityType" items="${facilityTypeList}">
                    <option value="${facilityType.getFacilityTypeId()}">${facilityType.getFacilityTypeName()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Tiêu Chuẩn Phòng</label>
            <input type="text"value="${facility.getStandardRoom()}"class="form-control" name="standardRoom">
        </div>
            <div class="mb-3">
                <label for="recipient-name" class="col-form-label">Mô tả tiện nghi</label>
                <input type="text"value="${facility.getDescriptionOtherConvenience()}"class="form-control" name="descriptionOtherConvenience">
            </div>
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Diện tích hồ bơi</label>
            <input type="number"value="${facility.getPoolArea()}"class="form-control" name="poolArea">
        </div>
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Số tầng</label>
            <input type="number"value="${facility.getNumberOfFloors()}"class="form-control" name="numberOfFloors">
        </div>
        <div class="mb-3">
        <label for="recipient-name" class="col-form-label">Dich vụ miễn phí</label>
        <input type="text"value="${facility.getFacilityFree()}"class="form-control" name="facilityFree">
    </div>
            <div class="mb-3 ">
                <input type="submit"
                       class=" form-control btn btn-info btn-outline-success btn-sm border border-2 border-success text-dark "
                       value="SAVE">
            </div>

    </form>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/2/2023
  Time: 8:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer</title>

    <link rel="stylesheet" href="../../bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
    <script src="../../jquery/jquery-3.5.1.min.js"></script>
    <script src="../../datatables/js/jquery.dataTables.min.js"></script>
    <script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
    <script src="../../bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
</head>
<body class=" vh-100">
<div class="row container-fluid">
    <img src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png" alt="abc">
    <p class="id2 text-lg-end my-5"><span class="badge bg-success">Lê Xuân Vũ</span></p>
</div>
<div class="row">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid ">
            <div class="col-md-2 ms-3">
                <a class="navbar-brand" href="/index.jsp">HOME</a>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse col-md-8 justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Employee
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Customer
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/facility">List Customer</a></li>
                            <li><a class="dropdown-item" href="/facility?action=create">Create Customer</a></li>

                        </ul>
                    </li>
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Contract
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex mx-3" role="search" method="get">
                    <input class="form-control me-2" type="search" name="name" placeholder="Search" aria-label="Search">
                    <label class="form-label">Loại dịch vụ</label>
                    <select class="form-select" aria-label="Default select example" name="facilityTypeId1">
                        <c:forEach var="facilityType" items="${facilityTypeList}">
                            <option value="${facilityType.getFacilityTypeId()}">${facilityType.getFacilityTypeName()}</option>
                        </c:forEach>
                    </select>
                    <select class="form-select" aria-label="Default select example" name="rentTypeId1">
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <option value="${rentType.getRentTypeId()}">${rentType.getRentTypeName()}</option>
                        </c:forEach>
                    </select>
                    <button class="btn btn-outline-success" type="submit" name="action" value="search">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<h1 class="text-center my-3">LIST FACILITY </h1>
<a href="/facility?action=create">
    <button class="btn btn-primary">ADD NEW FACILITY</button>
</a>
<table class="table table-striped table-bordered text-center" style="width:100%" id="tableFacility">
    <thead>
    <tr>
        <th scope="col">Number</th>
        <th scope="col">Name</th>
        <th scope="col">Area(m2)</th>
        <th scope="col">Cost</th>
        <th scope="col">Max_People</th>
        <th scope="col">Rent_Type</th>
        <th scope="col">Facility_Type</th>
        <th scope="col">Standard_Room</th>
        <th scope="col">description_Other_Convenience</th>
        <th scope="col">Pool_Area(m2)</th>
        <th scope="col">FloorNumber</th>
        <th scope="col">Facility_Free</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody class="table-group-divider">
    <c:forEach var="facility" items="${facilityList}" varStatus="status">
        <tr>
            <td>${facility.getFacilityId()}</td>
            <td>${facility.getFacilityName()}</td>
            <td>${facility.getArea()}</td>
            <td>${facility.getCost()}</td>
            <td>${facility.getMaxPeople()}</td>
            <c:forEach var="rentType" items="${rentTypeList}">

                <c:if test="${rentType.getRentTypeId() == facility.getRentTypeId()}">
                    <td>
                            ${rentType.getRentTypeName()}
                    </td>
                </c:if>
            </c:forEach>
            <c:forEach var="facilityType" items="${facilityTypeList}">

                <c:if test="${facilityType.getFacilityTypeId() == facility.getFacilityTypeId()}">
                    <td>
                            ${facilityType.getFacilityTypeName()}
                    </td>
                </c:if>
            </c:forEach>
            <td>${facility.getStandardRoom()}</td>
            <td>${facility.getDescriptionOtherConvenience()}</td>
            <c:if test="${facility.getPoolArea()==null}"><td>0</td>
            </c:if>
            <c:if test="${facility.getPoolArea()!=null}"><td>${facility.getPoolArea()}</td>
            </c:if>
            <c:if test="${facility.getNumberOfFloors()==null}"><td>0</td>
            </c:if>
            <c:if test="${facility.getNumberOfFloors()!=null}"><td>${facility.getNumberOfFloors()}</td>
            </c:if>
            <c:if test="${facility.getFacilityFree()==null}"><td>-</td>
            </c:if>
            <c:if test="${facility.getFacilityFree()!=null}"><td>${facility.getFacilityFree()}</td>
            </c:if>
            <td>
                <a href="/facility?action=edit&id=${facility.getFacilityId()}">
                    <button type="button" class="btn btn-primary">EDIT</button>
                </a>
            </td>
            <td>
                <!-- Button trigger modal -->

                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="deleteFacility('${facility.getFacilityId()}','${facility.getFacilityName()}')">
                    DELETE
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="/facility?action=delete">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">DELETE FACILITY</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="idDelete" hidden id="idDelete">
                    <strong>Facility: </strong>
                    <span id="nameDelete" class="text-danger"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCEL</button>
                    <button type="submit"  class="btn btn-primary">OK</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function deleteFacility(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>

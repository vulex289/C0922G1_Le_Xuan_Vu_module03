<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 12/31/2022
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Facility</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.3.0-alpha1-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
    <script src="bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
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
                <a class="navbar-brand" href="#">HOME</a>
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
                <form class="d-flex mx-3" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<h1 class="text-center my-3">LIST FACILITY </h1>
<button type="button" class="btn btn-primary">ADD NEW FACILITY</button>
<table class="table text-center">
    <thead>
    <tr>
        <th scope="col">Number</th>
        <th scope="col">Name</th>
        <th scope="col">Area</th>
        <th scope="col">Cost</th>
        <th scope="col">Max-People</th>
        <th scope="col">Rent-Type</th>
        <th scope="col">Standard</th>
        <th scope="col">Description</th>
        <th scope="col">Pool-Area</th>
        <th scope="col">Num-Of-Floors</th>
        <th scope="col">Facility-Free</th>
    </tr>
    </thead>
    <tbody class="table-group-divider">
    <tr>
        <th scope="row">1</th>
        <td>Villa</td>
        <td>100m2</td>
        <td>500 USD</td>
        <td>10</td>
        <td>Month</td>
        <td>4 stars</td>
        <td>Full options</td>
        <td>15m2</td>
        <td>4</td>
        <td>Massage, Karaoke, BBQ</td>
        <td>
            <button type="button" class="btn btn-primary">EDIT</button>
        </td>
        <td>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                DELETE
            </button>
            <!-- Modal -->
            <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure, baby?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <th scope="row">2</th>
        <td>Room</td>
        <td>30m2</td>
        <td>100 USD</td>
        <td>3</td>
        <td>Day</td>
        <td>3 stars</td>
        <td>Full options</td>
        <td>None</td>
        <td>0</td>
        <td>Massage, Karaoke, BBQ</td>
        <td>
            <button type="button" class="btn btn-primary">EDIT</button>
        </td>
        <td>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                DELETE
            </button>
            <!-- Modal -->
            <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure, baby?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <th scope="row">3</th>
        <td>House</td>
        <td>50m2</td>
        <td>300 USD</td>
        <td>10</td>
        <td>Year</td>
        <td>3 stars</td>
        <td>Full options</td>
        <td>15m2</td>
        <td>3</td>
        <td>Massage, Karaoke, BBQ</td>
        <td>
            <button type="button" class="btn btn-primary">EDIT</button>
        </td>
        <td>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                DELETE
            </button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure, baby?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
    <script src="bootstrap-5.3.0-alpha1-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
    <script src="bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
    <style>
        .id1 {
            color: wheat;
            font-size: 20px;
        }

        .id2 {
            font-size: 20px;
            position: absolute;
        }
    </style>
</head>
<body>
<div class="row container-fluid">
    <img src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png" alt="">
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
                            <li><a class="dropdown-item" href="/Employee.jsp">Action</a></li>
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
                            <li><a class="dropdown-item" href="/customer.jsp">Action</a></li>
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
                            <li><a class="dropdown-item" href="/facility.jsp">Action</a></li>
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
                            <li><a class="dropdown-item" href="/contract.jsp">Action</a></li>
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
<div class="row my-4 container-fluid">
    <div class="col-md-3">
        <div class="card" style="width: 18rem;">
            <img src="https://q-xx.bstatic.com/xdata/images/hotel/300x240/100235855.jpeg?k=5b6e6cff16cfd290e953768d63ee15f633b56348238a705c45759aa3a81ba82b&o="
                 class="card-img-top" alt="...">
            <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
            </div>
        </div>
        <div class="card" style="width: 18rem;">
            <img src="https://r-xx.bstatic.com/xdata/images/xphoto/300x240/45450084.jpeg?k=f8c2954e867a1dd4b479909c49528531dcfb676d8fbc0d60f51d7b51bb32d1d9&o="
                 class="card-img-top" alt="...">
            <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
            </div>
        </div>
        <div class="card" style="width: 18rem;">
            <img src="https://r-xx.bstatic.com/xdata/images/hotel/300x240/119467716.jpeg?k=f3c2c6271ab71513e044e48dfde378fcd6bb80cb893e39b9b78b33a60c0131c9&o="
                 class="card-img-top" alt="...">
            <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="row my-1">
            <img src="https://www.furama.com/images/nh_sgstrip.jpg " class="card-img-top" alt="...">
        </div>
        <div class="row my-1">
            <img src="https://www.furama.com/images/nh_kl.jpg" class="card-img-top" alt="...">
        </div>
        <div id="carouselExampleCaptions" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>

            </div>
            <div class="carousel-inner my-5">
                <div class="carousel-item active">
                    <div class="row m-3">
                        <div class="card">
                            <div class="row">
                                <div class="col-3 mt-3">
                                    <img src="https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4GyKc?ver=f8b8"
                                         class="d-block w-100" alt="...">
                                </div>
                                <div class="col-6">
                                    <div class="card-body">
                                        <p class="h4 fw-light">Up to $100 off Surface Laptop Go 2</p>
                                        <p class="h5 fw-light">Take your lessons to go with the perfect balance of
                                            style,
                                            portability, and performance.</p>
                                    </div>
                                </div>
                                <div class="col-3 text-center mt-4">
                                    <a class="btn btn-primary  h6"
                                       href="https://www.microsoft.com/en-us/d/surface-laptop-4/946627fb12t1?icid=surface-carousel-4&activetab=pivot:overviewtab">Buy
                                        now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="row m-2">
                        <div class="card">
                            <div class="row ">
                                <div class="col-3 mt-3">
                                    <img src="https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RWNWSt?ver=5fd7"
                                         class="d-block w-100" alt="...">
                                </div>
                                <div class="col-6">
                                    <div class="card-body">
                                        <p class="h4 fw-light">Save up to $500 on Surface Pro 8
                                        </p>
                                        <p class="h5 fw-light">
                                            Unwrap possibility with laptop power, tablet portability, and a large
                                            display
                                            designed for pen and touch.</p>
                                    </div>
                                </div>
                                <div class="col-3 text-center mt-4">
                                    <a class="btn btn-primary  h6"
                                       href="https://www.microsoft.com/en-us/d/surface-laptop-4/946627fb12t1?icid=surface-carousel-4&activetab=pivot:overviewtab">Buy
                                        now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon btn btn-dark" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon btn btn-dark" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>
<div class="row text-center container-fluid bg-primary">
    <p class="id1">FURAMA - FURAMA HOTELS INTERNATIONAL.
    </p>
    <p class="id1" style="color: #2b3035">OUR HOTELS | PROMOTIONS | MEETINGS & OCCASIONS | BRAND STORY | CORPORATE INFO
        | MEDIA CENTRE | LOYALTY</p>
    <p class="id1">1997</p>
</div>
</body>
<%--<script src="bootstrap-5.3.0-alpha1-dist/js/bootstrap.min.js"--%>
<%--        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/js/bootstrap.min.js"></script>--%>
<%--<script src="bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>--%>
<%--<script src="../bootstrap-5.3.0-alpha1-dist/js/bootstrap.js"></script>--%>

<script src="bootstrap-5.3.0-alpha1-dist/js/bootstrap.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</html>
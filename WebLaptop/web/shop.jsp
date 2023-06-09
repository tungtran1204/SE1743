<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>LaptopHub - Best Laptop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="assets/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/price.css" rel="stylesheet">
        <style>
            .product-name {
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
            }
            /*            .header {
                            background-color: black;
                        }*/
        </style>
    </head>

    <body>
        <!-- Topbar Start -->
        <%@include file="component/header-shop.jsp" %>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <%@include file="component/header-category.jsp" %>
        <!-- Navbar End -->


        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="/WebLaptop">Home</a>
                        <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Shop Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-4">

                    <form action="shop" method="get">
                        <!-- Price Start -->
                        <c:if test="${requestScope.categoryId != 0}">
                            <input type="hidden" name="categoryId" value="${requestScope.categoryId}">
                        </c:if>
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price (VND)</span></h5>
                        <div class="bg-light p-4 mb-30">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div id="slider-range"></div>
                                </div>
                            </div>
                            <div class="row slider-labels d-flex justify-content-between">
                                <div class="col-xs-6 caption">
                                    <strong>Min:</strong> <span id="slider-range-value1"></span>
                                </div>
                                <div class="col-xs-6 text-right caption">
                                    <strong>Max:</strong> <span id="slider-range-value2"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12"> 
                                    <input type="hidden" id="priceFrom" name="priceFrom" value="0">
                                    <input type="hidden" id="priceTo" name="priceTo" value="1000000000">
                                </div>
                            </div>
                        </div>
                        <!-- Price End -->

                        <!-- Size Start -->
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Type:</span></h5>
                        <div class="bg-light p-4 mb-30">
                            <c:forEach items="${requestScope.lstType}" var="s">
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input <c:if test="${Helper.contains(requestScope.typeIds, s.typeId)}"> checked=""</c:if> name="typeId" value="${s.typeId}" type="checkbox" class="custom-control-input" id="type-${s.typeId}">
                                    <label class="custom-control-label" for="type-${s.typeId}">${s.typeValue}</label>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- Size End -->
                        <button type="submit" class="btn btn-primary px-5 w-100"><i class="fa fa-filter mr-1"></i> Filter</button>
                    </form>
                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-8">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="">
                                    <form action="shop" method="get" class="input">
                                        <label for="sortBy"></label>
                                        <select name="sortBy" id="sortBy" onchange="this.form.submit()">
                                            <option value="none">Order by</option>
                                            <option value="price ASC">Price ASC</option>
                                            <option value="price DESC">Price DESC</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${requestScope.lstProduct}" var="p">
                            <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                                <div class="product-item bg-light mb-4">
                                    <div class="product-img position-relative overflow-hidden">
                                        <img class="img-fluid w-100" src="${p.productImg}" alt="">
                                        <a href="product-detail?productId=${p.productId}">
                                            <div class="product-action">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="text-center py-4">
                                        <a class="h6 text-decoration-none product-name" href="product-detail?productId=${p.productId}">${p.productName}</a>
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <fmt:formatNumber value="${p.productPrice}" pattern="#,###" var="formattedPrice" />
                                            <h5>${formattedPrice} ₫</h5>
                                            <!--<h6 class="text-muted ml-2"><del>$123.00</del></h6>-->
                                        </div>
                                        <div class="d-flex align-items-center justify-content-center mb-1">
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small>(99)</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-12">
                            <nav>
                                <ul class="pagination justify-content-center">
                                    <!--<li class="page-item disabled"><a class="page-link" href="#">Previous</span></a></li>-->
                                    <li class="page-item <c:if test="${pageCur eq 1}"> disabled </c:if>"><a class="page-link" href="${requestScope.href}page=${requestScope.pageCur - 1}">Previous</span></a></li>
                                        <c:forEach items="${requestScope.lstPage}" var="p">
                                        <li class="page-item <c:if test="${p eq requestScope.pageCur}"> active </c:if> "><a class="page-link" href="${requestScope.href}page=${p}">${p}</a></li>
                                        </c:forEach>
                                    <li class="page-item <c:if test="${requestScope.pageCur eq requestScope.totalPage}"> disabled </c:if>"><a class="page-link" href="${requestScope.href}page=${requestScope.pageCur + 1}">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- Shop Product End -->
                </div>
            </div>
            <!-- Shop End -->


            <!-- Footer Start -->   
        <%@include file="component/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="assets/lib/easing/easing.min.js"></script>
        <script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="assets/mail/jqBootstrapValidation.min.js"></script>
        <script src="assets/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="assets/js/main.js"></script>


        <script>
                                            $(document).ready(function () {
                                                $('.noUi-handle').on('click', function () {
                                                    $(this).width(50);
                                                });
                                                var rangeSlider = document.getElementById('slider-range');
                                                var moneyFormat = wNumb({
                                                    decimals: 0,
                                                    thousand: ','
//    prefix: '$'
                                                });
                                                noUiSlider.create(rangeSlider, {
                                                    start: [${requestScope.priceFrom}, ${requestScope.priceTo}],
                                                    step: 200000,
                                                    range: {
                                                        'min': [10000000],
                                                        'max': [200000000]
                                                    },
                                                    format: moneyFormat,
                                                    connect: true
                                                });

                                                // Set visual min and max values and also update value hidden form inputs
                                                rangeSlider.noUiSlider.on('update', function (values, handle) {
                                                    document.getElementById('slider-range-value1').innerHTML = values[0];
                                                    document.getElementById('slider-range-value2').innerHTML = values[1];
                                                    document.getElementById('priceFrom').value = moneyFormat.from(values[0]);
                                                    document.getElementById('priceTo').value = moneyFormat.from(values[1]);
                                                });
                                            });
        </script>
        <script src="assets/js/price.js"></script>
    </body>

</html>
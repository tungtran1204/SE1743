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
    </head>
    <style>
        pre{
            font-family: "Roboto", sans-serif;
            font-size: 1.3rem;
            font-weight: 400;
            color: #6C757D;
        }
    </style>

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
                        <span class="breadcrumb-item active">Shop Detail</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Shop Detail Start -->
        <div class="container-fluid pb-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 mb-30">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner bg-light">
                            <c:forEach items="${requestScope.lstProductImgDetail}" var="i" varStatus="theCount">
                                <div class="carousel-item <c:if test="${theCount.count eq 1}">active</c:if>">
                                    <img class="w-100 h-100" src="${i.productImgDetailPath}" alt="Image">
                                </div>
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>

                <div class="col-lg-7 h-auto mb-30">
                    <div class="h-100 bg-light p-30">
                        <h3>${requestScope.product.productName}</h3>
                        <div class="d-flex mb-3">
                            <div class="text-primary mr-2">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star-half-alt"></small>
                                <small class="far fa-star"></small>
                            </div>
                            <small class="pt-1">(99 Reviews)</small>
                        </div>
                        <fmt:formatNumber value="${requestScope.product.productPrice}" pattern="#,###" var="formattedPrice" />
                        <h3 class="font-weight-semi-bold mb-4">${formattedPrice} ₫</h3>

                        <div class="d-flex mb-3">
                            <p class="mb-4" style="white-space: pre;"><pre>${requestScope.product.productDescription}</pre></p>
                        </div>
                        
                        <form action="product-detail" method="post">
                            <input type="hidden" name="productId" value="${requestScope.product.productId}"> 
                            <input type="hidden" name="orderDetailProductImg" value="${requestScope.product.productImg}"> 
                            <input type="hidden" name="orderDetailProductName" value="${requestScope.product.productName}"> 
                            <input type="hidden" name="orderDetailPriceProduct" value="${requestScope.product.productPrice}"> 

                            
                            
                            <div class=" align-items-center mb-4 pt-2">
                                <div class="d-flex">
                                    <div class="input-group quantity mr-3 mb-3" style="width: 130px;">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-primary btn-minus">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input name="orderDetailQuantity" type="text" class="form-control bg-secondary border-0 text-center" value="1">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-primary btn-plus">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center mb-3">
                                        ${requestScope.product.quantity} product
                                    </div>
                                </div>
                                <c:if test="${sessionScope.accountCur != null}">
                                    <button type="submit" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To
                                        Cart</button>
                                    </c:if>   
                                    <c:if test="${sessionScope.accountCur == null}">    
                                    <a href="sign-in">
                                        <button type="button" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i>
                                            Add To Cart</button>
                                    </a>
                                </c:if>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>

        </div>
        <!-- Shop Detail End -->


        <!-- Products Start -->
        <div class="container-fluid py-5">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">You May Also Like</span></h2>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel related-carousel">
                        <c:forEach items="${requestScope.lstRandProduct}" var="p">
                            <div class="product-item bg-light">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" src="${p.productImg}" alt="">
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none" href="product-detail?productId=${p.productId}">${p.productName}</a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <fmt:formatNumber value="${p.productPrice}" pattern="#,###" var="formattedPrice" />
                                        <h5>${formattedPrice} ₫</h5>
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
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- Products End -->


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
    </body>

</html>
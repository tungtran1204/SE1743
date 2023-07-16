<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" href="assets/img/logo1.png" type="image/x-icon" />
        <title>LaptopHub</title>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet"
            />
        <!--Bootstrap-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <!--FontAwesome-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link 
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            />
        <!--css file-->
        <link rel="stylesheet" href="assets/css/profile.css" />
        <link href="assets/css/style.css" rel="stylesheet" />
    </head>
    <style>
        body{       
            background: url(assets/img/background-xam-dep-sang-tao-va-an-tuong-nhat.jpg);
        }
        .nav-link{
            color: #FFD333;
        }
    </style>
    <body>

        <!-- Topbar End -->
        <div class="container emp-profile">
            <div class="row">
                <div class="col-9">
                    <div class="profile-head">
                        <h4 style="margin-bottom: 20px; margin-left: 20px">${sessionScope.accountDetail.accountDetailName}</h4>
                        <!--<h6>Email: ${sessionScope.accountCur.accountEmail}</h6>-->
                    </div>
                </div>
                <div class="col-3">
                    <a
                        class="profile-edit-btn"
                        data-toggle="modal"
                        data-target="#changeInformModal"
                        href="javascript:void(0)"
                        >Edit profile</a>
                </div>
                <div style="margin-top: -50px;">
                    <ul
                        class="nav nav-tabs"
                        id="myTab"
                        role="tablist"
                        style="margin-top: 50px"
                        >
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                id="home-tab"
                                data-toggle="tab"
                                href="#home"
                                role="tab"
                                aria-controls="home"
                                aria-selected="true"
                                style="color: #5d768d"
                                >About</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                id="address-tab"
                                data-toggle="tab"
                                href="#address"
                                role="tab"
                                aria-controls="address"
                                aria-selected="false"
                                style="color: #5d768d"
                                >Address Contact</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                id="delivering-tab"
                                data-toggle="tab"
                                href="#delivering"
                                role="tab"
                                aria-controls="delivering"
                                aria-selected="false"
                                style="color: #5d768d"
                                >Delivering</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                id="done-order-tab"
                                data-toggle="tab"
                                href="#done-order"
                                role="tab"
                                aria-controls="done-order"
                                aria-selected="false"
                                style="color: #5d768d"
                                >Done Order</a
                            >
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <!----------------Start About------------->
                        <%@include file="tab/profile/tab-about.jsp" %>
                        <!----------------START ADDRESS------------->
                        <%@include file="tab/profile/tab-address.jsp" %>
                        <!------------------delivering----------------------->
                        <%@include file="tab/profile/tab-delivering.jsp" %>
                        <!------------------Order Done----------------------->
                        <%@include file="tab/profile/tab-done-order.jsp" %>

                    </div>
                </div>
            </div>
            <A HREF="javascript:javascript:history.go(-1)"><i class="fa-sharp fa-solid fa-circle-arrow-left fa-xl" style="margin-left: 50px; font-size: 250%; margin-top:50px; color: #5d768d"></i></A>            
            <a href="/WebLaptop"><i class="fa-solid fa-house fa-xl" style="margin-left: 50px; font-size: 250%; color: #5d768d"></i></a>   
        </div>
                        

        <!------------------------MODAL CHANGE PASSWORD-------------------------->
        <%@include file="modal/profile/modal-change-password.jsp" %>

        <!------------------------MODAL CHANGE INFORMATION-------------------------->
        <%@include file="modal/profile/modal-change-infomation.jsp" %>

        <!-------------------------------MODAL ORDER DETAIL------------------------------------->
        <%@include file="modal/profile/modal-order-detail.jsp" %>

    </body>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script>
        $("#home-tab").addClass("active");
        $("#home").addClass("show active");
    </script>
    <script>
        const addressTab = '<%= session.getAttribute("addressTab") %>';
        if (addressTab !== 'null') {
            $("#home-tab").removeClass("active");
            $("#home").removeClass("show active");
            $("#address-tab").addClass("active");
            $("#address").addClass("show active");
        }
    </script>
    <script>
        const message = '<%= session.getAttribute("msg") %>';
        if (message !== 'null') {
            var myModal = new bootstrap.Modal(document.getElementById("changePasswordModal"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>
    <script>
        function getAllOrderDetail(orderId) {
            const request = new XMLHttpRequest();
            request.open("GET", "api/orderDetail?orderId=" + orderId, true);
            request.onload = function () {
                if (this.readyState === 4 && this.status === 200) {
                    let lstOrderDetailHtml = '';
                    const lstOrderDetail = JSON.parse(this.responseText);
                    let sum = 0;
                    for (let orderDetail of lstOrderDetail) {
                        lstOrderDetailHtml += `
                            <div class="d-flex flex-row mb-4 pb-2">
                                <div class="flex-fill">
                                    <h5 class="bold"><a class="text-danger" href="product-detail?productId=` + orderDetail.productId + `">` + orderDetail.orderDetailProductName + `</a></h5>
                                    <p class="text-muted"> Qt: ` + orderDetail.orderDetailQuantity + ` item</p> 
                                    <p class="text-muted"> Color: ` + orderDetail.orderDetailColorValue + `</p> 

                                    <h4 class="mb-3"><span class="small text-muted"> Unit Price: </span> ` + orderDetail.orderDetailPriceProduct + ` VND</h4>
                                </div>
                                <div>
                                    <img class="align-self-center img-fluid"
                                         src="` + orderDetail.orderDetailProductImg + `" width="250">
                                </div>
                            </div>
                            <hr>
                        `;
                        sum = sum + orderDetail.orderDetailPriceProduct * orderDetail.orderDetailQuantity;
                    }   
                    document.getElementById('modal-order-detail-body').innerHTML = lstOrderDetailHtml;
                    document.querySelector('#modal-order-detail .modal-footer').innerHTML = '<h3>Total Money: '+ sum + 'VND</h3>';
                } else {
                    console.log(2);
                }
            };
            request.send(null);
            let myModal = new bootstrap.Modal(document.getElementById("modal-order-detail"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>
    <%
        request.getSession().removeAttribute("msg");
        request.getSession().removeAttribute("addressTab");
    %>
</html>

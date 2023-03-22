<%-- 
    Document   : checkout
    Created on : Mar 18, 2023, 9:27:08 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/order.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <style>
        body{
            overflow-x: hidden;
        }
        #button-style {
            display: inline-block;
            text-align: center;
            padding: 10px;
            font: 14px 'Dosis';
            color: white;
            text-transform: uppercase;
            background-color: #FF4655;
            transition: 0.5s;
        }
        #button-style:hover{
            color: yellow;
        }
        .breadcrumb {
            padding: 8px 15px;
            margin-bottom: 20px;
            list-style: none;
            background-color: #f5f5f5;
            border-radius: 4px;
            margin-top: 20px;
        }

    </style>
    <body>
        <nav class="navbar bg-body-tertiary" style="background-color: #003034">
            <div class="container text-center" style="font-family:'Dosis', sans-serif">
                <ul class="col-8 row">
                    <li class="col-3" >
                        <a href="MainController?action=Main">TRANG CHỦ</a>
                    </li>
                    <li class="col-3">
                        <a href="MainController?action=Account">TÀI KHOẢN</a>
                    <li class="col-3">
                        <a href="deposite.jsp">HƯỚNG DẪN MUA</a>                    
                    </li>
                    <li class="col-3">
                        <a href="https://www.facebook.com/ankhoa2003" target="_blank">LIÊN HỆ</a>
                    </li>
                </ul>
                <c:if test="${LOGIN_USER.getRole() == null}">
                    <div class="col-4 row">
                        <form action="MainController" class="col-4">
                            <button type="submit" class="btn btn-sm btn-danger" name="action" value="GetCart">GIỎ HÀNG 
                                <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                        </form>
                        <div class="col-4">
                            <button class="btn btn-sm btn-danger">
                                <a href="login.jsp" style="text-decoration: none; width: 100%; color: #fff">ĐĂNG NHẬP</a>
                                <i class="fa-solid fa-user"></i>
                            </button>
                        </div>

                        <div class="col-4">
                            <button  class="btn btn-sm btn-danger">
                                <a href="signup.jsp" style="text-decoration: none;  width: 100%; color: #fff">ĐĂNG KÝ</a>
                                <i class="fa-solid fa-user-plus"></i>
                            </button>
                        </div>

                    </div>
                </c:if>
                <div class="col-4 row">
                    <c:if test="${LOGIN_USER.getRole() != null}">
                        <form action="MainController" class="col-5">
                            <button type="submit" class="btn btn-sm btn-danger" name="action" value="GetCart">GIỎ HÀNG 
                                <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                        </form> 
                        <form action="MainController" method="POST" class="col-4">
                            <button class="btn btn-sm btn-danger" type="submit" name="action" value="LogOut">ĐĂNG XUẤT
                                <i class="fa-solid fa-right-from-bracket"></i>
                            </button>
                        </form>
                    </c:if>
                </div>
            </div>
        </nav>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <ol class="breadcrumb">
                    <li style="padding-top: 0"><a href="MainController?action=Main" style="
                                                  font-size: 16px;
                                                  text-decoration: none;
                                                  margin-top: 12px;" >Trang chủ </a><span style="font-size: 16px; color: #777777">/ Thanh Toán</span>
                    </li>
                </ol>
            </div>
            <div class="col-2"></div>
        </div>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">

                <div class="row">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-danger">Đơn hàng của bạn</span>
                            <span class="badge bg-primary rounded-pill">${cart.size()}</span>
                        </h4>
                        <c:forEach var="account" items="${cart}">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">${account.accountName}</h6>
                                        <small class="text-muted">${account.description}</small>
                                    </div>
                                    <span class="text-muted">${account.price}</span>
                                </li>
                            </ul>
                        </c:forEach>
                        <div>
                            <form action="MainController">
                                <button type="submit" id="button-style" name="action" value="GetCart">CHỈNH SỬA ĐƠN HÀNG</button>
                            </form>
                        </div>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (VND)</span>
                            <strong>${total}</strong>
                        </li>
                    </div>  
                    <div class="col-md-7 col-lg-8">
                        <form  action="MainController">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">Họ & tên</label>
                                    <input type="text" class="form-control" id="name" required="" name="name">
                                </div>

                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="lastName"required="" name="email">
                                </div>
                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">Điện thoại</label>
                                    <input type="text" class="form-control" id="firstName" required="" name="phone">
                                </div>

                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Facebook URL</label>
                                    <input type="text" class="form-control" id="lastName"required="" name="urlFB">
                                </div>

                                <div class="col-12">
                                    <label for="lastName" class="form-label">Ghi chú đơn hàng</label>
                                    <input type="text" class="form-control" id="lastName" name="note"  rows="2" style="height: auto">
                                </div>
                            </div>
                            <hr class="my-4">
                            <div >
                                <div class="_title-ttck">Thông tin chuyển khoản: </div>
                                <p><span style="line-height:2;"><span style="font-family:Dosis"><span style="font-size:16px;"></span></span><span style="color:#003333;"><span style="font-size:20px;"><span style="font-family:Dosis"><u>TÀI KHOẢN MOMO</u></span></span></span><span style="font-family:Dosis"><span style="font-size:16px;"></span></span></span></p>
                                <ul>
                                    <li><span style="line-height:2;"><span style="color:#ff3366;"><span style="font-family:Dosis"><span style="font-size:16px;">Tên Tài Khoản</span></span></span><span style="font-family:Dosis"><span style="font-size:16px;">:&nbsp;</span></span><span style="font-size:18px;"><span style="font-family:Dosis">NGUYỄN VÕ AN KHOA</span></span></span></li>
                                    <li><span style="line-height:2;"><span style="color:#ff3366;"><span style="font-family:Dosis"><span style="font-size:16px;">Số Momo</span></span></span><span style="font-family:Dosis"><span style="font-size:16px;">: </span></span><span style="font-size:18px;"><span style="font-family:Dosis">000000000</span></span></span></li>
                                </ul>
                                <p><font face="Dosis"><span style="font-family:Dosis"><span style="font-size:16px;">NỘI DỤNG CHUYỂN KHOẢN: ACC_()_SĐT</span></span></font><br>
                                    <span style="font-size:16px;"><span style="font-family:Dosis">VD: ACC_01_0123456789<br>
                                            SAU KHI CHUYỂN KHOẢN THÀNH CÔNG&nbsp;QUÝ KHÁCH VUI LÒNG CHỤP LẠI THÔNG TIN CHUYỂN KHOẢN RỒI GỬI VỀ FACEBOOK:&nbsp;<a href="https://www.facebook.com/ankhoa2003" target="_blank">Shop Account Valorant Uy tín | Facebook</a>&nbsp;ĐỂ ĐƯỢC CẤP TÀI KHOẢN VÀ HƯỚNG DẪN THAY ĐỔI THÔNG TIN ACCOUNT NHÉ.</span></span></p>
                            </div>
                            <button id="button-style" type="submit" value="Checkout" name="action">Gửi đơn hàng</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-2"></div>
    </div>

</body>
</html>

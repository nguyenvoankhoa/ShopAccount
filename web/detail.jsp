<%-- 
    Document   : detail
    Created on : Feb 6, 2023, 12:16:01 PM
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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/detail.css">
    </head>
    <style>
        body{
            overflow-x: hidden;
            position: relative;
        }
               
    </style>
    <body>
        <nav class="navbar bg-body-tertiary" style="background-color: #003034; min-width: 1230px;">
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

        <div class="_bg-ctsp w-100" name="${account}">
            <div class="pagewrap">
                <div class="row">
                    <div class="container col-8" style="background: rgba(0, 48, 52, 0.6);">
                        <div class="row">
                            <div class="col-5 align-items-center justify-content-center">
                                <div class="_namepr-ct">Tên Account: <span>${account.accountName}</span></div>
                                <div class="_tinhtrang-ct">Mô tả: <span style="color: yellow">${account.description}</span></div>
                            </div>
                            <div class="col-5 align-items-center justify-content-center">
                                <div class="_pricekm-ct">Giá hiện tại: <span>${account.price}</span></div>
                                <div class="_pricekm-ct">Rank: <span>${account.rank}</span></div>
                            </div>
                            <div class="col-2 mt-3">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="id" value="${account.id}">
                                    <button class="btn btn-lg buttonSignUp btn-danger" name="action" value="Buy">MUA NGAY</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="image w-100" name="${account}">
                <div class="col-8  container">
                    <img src="${account.imageLink}">
                </div> 
            </div>
        </div>

        <div class="_foot" style="background-image: url('https://accvalorant.com/backend/web/uploads/images/bgf.png');">
            <div class="pagewrap">
                <div class="row _add-foot" >
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 contact">
                        <div class="_dmfoot">GIỚI THIỆU VỀ ACCVALORANT.COM</div>
                        <div class="_desab">Chúng tôi đã có thời gian dài hoạt động trong lĩnh vực mua bán Acc Valorant và xin cam kết sẽ mang đến cho quý khách sản phẩm tốt nhất , dịch vụ tốt nhất , giá cả tốt nhất.</div>
                        <div class="_dmfoot">Hướng Dẫn</div>
                        <div class="_menuf">
                            <ul class="_nostyle">
                                <li><a href="deposit.jsp" title="Hướng Dẫn ">Hướng Dẫn </a></li>
                                <li><a href="https://www.facebook.com/ankhoa2003" title="Liên Hệ Hỗ Trợ" target="_blank">Liên Hệ Hỗ Trợ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 contact">
                        <div class="_dmfoot">Liên Hệ</div>
                        <div class="_add-foot"><p style="text-align: justify;"><span style="line-height:1;">Địa chỉ: TP. HCM</span></p>
                            <p style="text-align: justify;"><span style="line-height:1;">Hotline: 0000.000.000</span></p>
                            <p style="text-align: justify;"><span style="line-height:1;">Email: valorant.info@gmail.com</span></p>
                            <p style="text-align: justify;"><span style="line-height:1;">Website:&nbsp;</span>www.valorant.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

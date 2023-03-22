<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/deposit.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <style>
        body{
            overflow-x: hidden;
            background-image: url("https://tophinhanhdep.com/wp-content/uploads/2021/10/Valorant-Logo-Wallpapers.jpg");
        }
        .breadcrumb {
            padding: 8px 15px;
            margin-bottom: 20px;
            list-style: none;
            background-color: #f5f5f5;
            border-radius: 4px;
            margin-top: 20px;
        }
        li{
            padding-top: 0;
        }

    </style>
    <body>
        <nav class="navbar bg-body-tertiary" style="background-color: #003034">
            <div class="container text-center my-3" style="font-family:'Dosis', sans-serif">
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
        <div class="pagewrap">
            <div class="row">
                <div class="col-12">
                    <ol class="breadcrumb">
                        <li><a href="MainController?action=Main" style="
                               font-size: 16px;
                               text-decoration: none;
                               margin-top: 12px;" >Trang chủ </a><span style="font-size: 16px; font-weight: 400;color: #777777">/ Phương Thức Thanh Toán</span>
                        </li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h2 style="font-family:'Dosis', sans-serif; color: #f2de7a">NẠP QUA MOMO</h2>
                    <div>
                        <div class="table-responsive">
                            <div class="row two-col-left" style="margin: 0">
                                <div class="col-md-2 col-sidebar">
                                    <img src="uploads/momo.jpg" class="w-100">
                                </div>

                                <div class="col-md-8 col-main">
                                    <p><span style="font-family:'Dosis', sans-serif;"><span style="font-size:18px;"><span style="line-height:2;">
                                                    <span style="color:#f2de7a;">Số Momo</span>:&nbsp;0868837207</span></span></span></p>

                                    <p><span style="font-family:'Dosis', sans-serif;">
                                            <span style="font-size:18px;"><span style="line-height:2;"><span style="color:#f2de7a;">Chủ tài khoản</span>: Nguyen Vo An Khoa</span></span></span></p>

                                    <p><span style="font-family:'Dosis', sans-serif;">
                                            <span style="font-size:18px;"><span style="line-height:2;"><span style="color:#f2de7a;">Nội dung</span>: ACC_()_SDT.&nbsp;</span></span></span></p>
                                </div>
                            </div>

                            <p><span style="line-height:2;">
                                    <span style="color:#f2de7a;"><span style="font-size:18px;"><span style="font-family:'Dosis', sans-serif;"></span></span></span></span></p>
                        </div>

                        <p><u><span style="font-size:20px;">
                                    <span style="font-family:'Dosis', sans-serif;"><span style="color:#003333;"><span style="line-height:2;">Lưu ý khi nạp tiền</span></span></span></span></u></p>

                        <p style="text-align: justify;">
                            <span style="font-size:18px;">
                                <span style="font-family:'Dosis', sans-serif;">
                                    <span style="color:#003333;">
                                        <span style="line-height:2;">♦ Tài Khoản 100K ATM thì nạp 100K MOMO là mua được.</span>                                           
                                    </span>                                      
                                </span>      
                            </span>
                        </p>

                        <p style="text-align: justify;">
                            <span style="font-size:18px;">
                                <span style="font-family:'Dosis', sans-serif;">
                                    <span style="color:#003333;">
                                        <span style="line-height:2;">♦ Mở App MOMO&nbsp;Quét QRCode để nạp tiền nhanh nhất.</span>

                                    </span>

                                </span>

                            </span>
                        </p>

                        <p style="text-align: justify;">
                            <span style="font-size:18px;">
                                <span style="font-family:'Dosis', sans-serif;">
                                    <span style="line-height: 2;">
                                        <font color="#08f891">♦ Chuyển khoản thủ công,&nbsp;Quý khách vui lòng </font>
                                        <font color="#f2de7a">ghi đúng</font>
                                    </span>
                                    <span style="color:#003333;">
                                        <span style="line-height:2;">&nbsp;</span>
                                    </span>
                                    <span style="color:#ff3366;">
                                        <span style="line-height:2;">NỘI DUNG CHUYỂN KHOẢN</span>
                                    </span>
                                    <span style="color:#003333;">
                                        <span style="line-height:2;">.&nbsp;</span>
                                    </span>
                                </span>
                            </span>
                        </p>
                        <p style="text-align: justify;">
                            <span style="font-size:18px">
                                <span style="font-family:'Dosis', sans-serif;">
                                    <span style="line-height:2">
                                        <font color="#08f891">VD: ACC_01_0123456789</font>
                                    </span
                                    ></span>
                            </span>
                        </p>
                        <p style="text-align: justify;">
                            <span style="font-size:18px;">
                                <span style="font-family:'Dosis', sans-serif;">
                                    <span style="color:#003333;">
                                        <span style="line-height:2;">♦ Sau khi chuyển khoản thành công, quý khách vui lòng chụp lại hóa đơn thanh toán gửi vào fanpage <a href="https://www.facebook.com/ankhoa2003" target="_blank">Nguyen Vo An Khoa | Facebook</a>&nbsp;để nhận acc.</span>
                                    </span></span>
                            </span>
                        </p>
                    </div>
                    <div class="clearfix margin-bottom-10"></div>
                </div>
            </div>
        </div>
    </body>
</html>

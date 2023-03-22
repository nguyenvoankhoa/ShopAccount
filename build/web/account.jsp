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
        <link rel="stylesheet" href="css/list.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/detail.css">
        <link rel="stylesheet" href="css/banner.css">
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
        <div class="row main-account py-3">
            <div class="col-2"></div>
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 text-center">
                <div class="title" style="font-size: 30px; color: yellow">ACCOUNT VALORANT</div>
            </div>
            <div class="col-2"></div>

        </div>

    </div>

    <main class="main row" style="min-width: 1230px;">
        <c:forEach var="account" items="${listAccount}">
            <div class="album py-5 col-4" >
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card shadow-sm">
                                <img  src="${account.imageLink}"/>
                                <div class="card-body" style="background-color: #003034;">
                                    <div class="row">
                                        <div class="col-6 py-3 text-center" style="font-size: 20px;color: #fff; font-weight: 700">${account.accountName}</div>
                                        <div class="col-6 py-3 text-center" style="font-size: 20px; color: #FF4655; font-weight: 700">${account.price}</div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group w-100">
                                            <form action="MainController" class="col-6">
                                                <input type="hidden" name="id" value="${account.id}">
                                                <button type="submit" name="action" value="Buy" class="btn btn-lg btn-outline-danger pr-1  w-100 buttonSignUp">MUA NGAY</button>
                                            </form>
                                            <form action="MainController" class="col-6">
                                                <input type="hidden" name="id" value="${account.id}">
                                                <button type="submit" name="action" value="Detail" class="btn btn-lg btn-outline-danger pl-1  w-100 buttonSignUp" >CHI TIẾT</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                      
                    </div>
                </div>
            </div>
        </c:forEach>
    </main>
    <div class="_foot" style="background-image: url('https://accvalorant.com/backend/web/uploads/images/bgf.png');">
        <div class="pagewrap">
            <div class="row _add-foot" >
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 contact">
                    <div class="_dmfoot">GIỚI THIỆU VỀ ACCVALORANT.COM</div>
                    <div class="_desab">Chúng tôi đã có thời gian dài hoạt động trong lĩnh vực mua bán Acc Valorant và xin cam kết sẽ mang đến cho quý khách sản phẩm tốt nhất , dịch vụ tốt nhất , giá cả tốt nhất.</div>
                    <div class="_dmfoot">Hướng Dẫn</div>
                    <div class="_menuf">
                        <ul class="_nostyle">
                            <li><a href="deposite.jsp" title="Hướng Dẫn ">Hướng Dẫn </a></li>
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

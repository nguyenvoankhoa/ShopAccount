<%-- 
    Document   : cart
    Created on : Feb 7, 2023, 8:15:04 PM
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
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <style>
        body{
            overflow-x: hidden;
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
        <main>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <ol class="breadcrumb">
                        <li><a href="MainController?action=Main" style="
                               font-size: 16px;
                               text-decoration: none;
                               margin-top: 12px;" >Trang chủ </a><span style="font-size: 16px;">/ Giỏ hàng</span>
                        </li>
                    </ol>
                </div>
                <div class="col-2"></div>
            </div>            
            <c:if test="${cart.size()==0}">
                <h2 class="text-center">Không có sản phẩm nào trong giỏ hàng</h2>
            </c:if>
            <div class="row">
                <div class="col-2"></div>
                <c:if test="${cart.size()!=0}">
                    <div class="col-8">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th>Tên account</th>
                                    <th>Giá</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="account" items="${cart}">
                                    <tr>
                                        <td style="width: 200px"><img src="${account.imageLink}" class="w-50"></td>
                                        <td>${account.accountName}</td>
                                        <td>${account.price}</td>
                                        <td>
                                            <form action="MainController" method="POST">
                                                <input type="hidden" value="${account.id}" name="id">
                                                <button type="submit" style="min-width: 30px" class="btn btn-danger" name="action" value="EditCart"><i class="fa-solid fa-trash"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <p>Số lượng: ${cart.size()}</p>
                        <p>Tổng tiền: ${total}</p>
                    </div>
                </c:if>
                <div class="col-2"></div>
            </div>

            <div class="row">
                <div class="col-8"></div>
                <div class="col-2">
                    <a href="MainController?action=Main">Tiếp tục mua hàng >></a>
                </div>
                <div class="col-2"></div>
            </div>


        </main>
    </body>
</html>

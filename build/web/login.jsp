<%-- 
    Document   : login
    Created on : Feb 2, 2023, 6:53:46 PM
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
        <link rel="stylesheet" href="css/signup.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <style>
        #google{
            background-color: #ea4335;
            font-size: 30px;
            color: #fff;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin: 5px;
        }
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

        <main class="col-4 m-auto mt-5" style="font-family:'Dosis';" >
            <form action="MainController" id="form">
                <div class="signForm " style="min-height: 475px;
                     padding: 5px 25px 20px;
                     background-image: url(https://accvalorant.com/images/bg-frmdk.png);
                     background-repeat: no-repeat;
                     background-size: 100% 100%;">
                    <h1 class="h3 my-4 text-center">ĐĂNG NHẬP</h1>
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Tên đăng nhập" name="username" required >
                        <label for="floatingInput">Tên đăng nhập</label>
                    </div>
                    <div class="form-floating my-2">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Mật khẩu" name="password" required>
                        <label for="floatingPassword">Mật khẩu</label>
                    </div>
                    <p style="font-size: 14px; color:#a94442">${message}</p>
                    <div class="link mb-3">Chưa có tài khoản ? <a href="signup.jsp" style="color:#dc3545"> Đăng ký ngay</a></div>
                    <div id="error" style="font-size: 14px; color:#a94442"></div>
                    <div class="g-recaptcha" data-sitekey="6LcsB_kkAAAAABEi1PGrvxQlftL1MnlJXWmhiNKR"></div>
                    <input type="hidden" name="action" value="Login">
                    <button class="w-100 btn btn-lg buttonSignUp mt-3" type="submit" name="action" value="Login">ĐĂNG NHẬP</button>
                    <div class="row mt-4 mb-3">
                        <div class="col-2"></div>
                        <div class="col-2" style="height: 2px; background-color: #777777; margin-top: 10px"></div>
                        <div class="col-4 text-center" style="color: white">Hoặc Đăng Nhập</div>
                        <div class="col-2" style="height: 2px; background-color: #777777; margin-top: 10px"></div>
                        <div class="col-2"></div>
                    </div>
                    <div class="justify-content-center align-items-center d-flex">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/ShopAccount/LoginGoogleHandler&response_type=code
                           &client_id=366836700778-sk5esi4kmfmc7h7b4gkd8g9pq9nca1h8.apps.googleusercontent.com&approval_prompt=force" id="google"><i class="fa-brands fa-google" style="margin-left: 10px"></i>
                        </a>
                    </div>
                </div>
            </form>

            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
            <script>
                console.log("????");
                window.onload = function () {
                    let isValid = false;
                    const form = document.getElementById("form");
                    const error = document.getElementById("error");

                    form.addEventListener("submit", function (event) {
                        event.preventDefault();
                        const response = grecaptcha.getResponse();
                        if (response) { //nếu response khong phai là một chuỗi trống
                            form.submit();
                        } else {
                            error.innerHTML = "Please check reCaptcha!";
                        }
                    });
                };
            </script>
        </main>
    </body>
</html>

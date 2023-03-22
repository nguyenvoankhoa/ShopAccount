
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/list.css">
        <link rel="stylesheet" href="css/signup.css">
        <style>
            body{
                overflow-x: hidden;
                position: relative;
            }
            .col-2 a{  
                color: #fff !important;
                text-decoration: none;
                padding: 5px;
                transition: 0.3s;
            }
        </style>
    <body>
        <nav class="navbar bg-body-tertiary" style="background-color: #003034; min-width: 1230px;">
            <div class="container text-center" style="font-family:'Dosis;', sans-serif; min-width: 1230px;">
                <ul class="row  w-100">
                    <li class="col-1">                     
                    </li>
                    <li class="col-2">
                        <a href="admin.jsp">ADMIN PAGE</a>
                    </li>
                    <li class="col-2">
                        <a href="addAccount.jsp">THÊM ACCOUNT</a>                    
                    </li>
                    <li class="col-2">  
                        <a href="MainController?action=List">LIST ACCOUNT</a>
                    </li>
                    <li class="col-2">
                        <a href="MainController?action=GetOrderDetails">GET ORDER DETAILS</a>
                    </li>
                    <li class="col-2">
                        <form action="MainController" method="POST">
                            <button class="btn btn-sm btn-danger" type="submit" name="action" value="LogOut">ĐĂNG XUẤT
                                <i class="fa-solid fa-right-from-bracket"></i>
                            </button>
                        </form>
                    </li>
                    <li class="col-1">                     
                    </li>
                </ul>
            </div>
        </nav>
        <main class="col-4 m-auto mt-5" style="font-family:'Dosis';">
            <form action="AddAccountController" enctype="multipart/form-data" method="POST">
                <div class="signForm " style="min-height: 475px;
                     padding: 5px 25px 20px;
                     background-image: url(https://accvalorant.com/images/bg-frmdk.png);
                     background-repeat: no-repeat;
                     background-size: 100% 100%;">
                    <h1 class="h3 my-3 text-center">THÊM ACCOUNT</h1>
                    <div class="form-floating mb-3">
                        <input type="file" id="floatingInput" name="file" required class="form-control" >
                        <label for="floatingInput">File</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Rank" name="rank" required>
                        <label for="floatingInput">Rank</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Mô tả" name="description" required>
                        <label for="floatingInput">Mô tả</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="floatingInput" placeholder="Giá" name="price" required min="1000">
                        <label for="floatingInput">Giá</label>
                    </div>
                    <button class="w-100 btn btn-lg buttonSignUp" type="submit" name="action" value="AddAccount">Thêm account</button>
                </div>
            </form>
        </main>
    </body>
</html>

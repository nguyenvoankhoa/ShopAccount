<%-- 
    Document   : list
    Created on : Feb 8, 2023, 7:46:19 AM
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
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/list.css">
    </head>
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
    <body class="main">
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
        <div class="row mt-5">
            <div class="col-2"></div>
            <div class="col-8">
                <table class="table"  style="background-color: #174245; color: #fff">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Tên</th>
                            <th scope="col">Rank</th>
                            <th scope="col">Mô tả</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Sửa</th>
                            <th scope="col">Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="account" items="${listAccount}">
                        <form action="MainController">
                            <tr>
                                <td scope="row">${account.id}</td>
                                <td>${account.accountName}</td>
                                <td><input type="text" name="rank" value="${account.rank}"/></td>
                                <td><input type="text" name="description" value="${account.description}"/></td>
                                <td><input type="number" name="price" value="${account.price}"</td>
                                <td>
                                    <input type="hidden" name="id" value="${account.id}"/>
                                    <button type="submit" class="btn btn-danger" name="action" value="UpdateAccount"><i class="fa-solid fa-pen"></i></button>
                                </td>
                                <td>
                                    <input type="hidden" name="id" value="${account.id}"/>
                                    <button type="submit" class="btn btn-danger" name="action" value="DeleteAccount"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-2"></div>


        </div>


    </body>
</html>

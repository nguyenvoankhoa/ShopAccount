<%-- 
    Document   : admin
    Created on : Mar 12, 2023, 4:21:21 PM
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
        <title>Admin Page</title>
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
        <div class="row mb-5 mt-3">
            <div class="col-2"></div>
            <div class="col-8">
                <c:if test="${LOGIN_USER.getName() != null}">
                    <div style="color: white; font: 20px 'Dosis', sans-serif; font-weight: 700">Xin chào ${LOGIN_USER.getName()}</div>
                </c:if>
                <form action="MainController">
                    <div class="col-12 row">
                        <div class="col-2"></div>
                        <div class="col-6"><input type="text" name="search" value="${search}" class="w-100"></div>
                        <div class="col-4">
                            <button type="submit" name="action" value="Search User" class="btn btn-sm btn-danger">Search Username <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-2"></div>
        </div>
        <c:if test="${LIST_USER != null}">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <table border="1" class="table" style="color: white; background-color: #003034">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Phone</th>
                                <th>Role ID</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${LIST_USER}" varStatus="loop">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${loop.index}</td>
                                    <td>${user.id}</td>
                                    <td>
                                        <input type="text" name="name" value="${user.name}"/>
                                    </td>
                                    <td>
                                        <input type="text" name="phone" value="${user.phone}"/>
                                    </td>
                                    <td>
                                        <input type="text" name="role" value="${user.role}"/>
                                    </td>
                                    <td>${user.username}</td>
                                    <td>${user.password}</td>
                                    <!--delete-->
                                    <td>
                                        <input type="hidden" name="id" value="${user.id}"/>
                                        <input type="hidden" name="search" value="${search}"/>
                                        <button type="submit" name="action" value="DeleteUser"><i class="fa-sharp fa-solid fa-user-xmark"></i></i></button>
                                    </td>
                                    <!--update-->
                                    <td>
                                        <input type="hidden" name="id" value="${user.id}"/>
                                        <input type="hidden" name="search" value="${search}"/>
                                        <button type="submit" name="action" value="UpdateUser"><i class="fa-solid fa-user-pen"></i></button>
                                    </td>
                                </tr> 
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
            </div>
            <h1 class="text-center" style="color: yellow">${ERROR}</h1>
        </c:if>
    </body>
</html>

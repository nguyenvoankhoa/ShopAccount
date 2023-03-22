<%-- 
    Document   : updateAccount
    Created on : Feb 8, 2023, 8:08:48 AM
    Author     : ADMIN
--%>

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
        <link rel="stylesheet" href="css/add.css">
    </head>
    <body>
    <main class="col-4 m-auto mt-5" style="font-family:'Dosis';">

        <form action="MainController">
            <div class="signForm " style="min-height: 475px;
                 padding: 5px 25px 20px;
                 background-image: url(https://accvalorant.com/images/bg-frmdk.png);
                 background-repeat: no-repeat;
                 background-size: 100% 100%;">
                <h1 class="h3 my-3 text-center">SỬA</h1>
                <input type="hidden" value="${account.id}" name="id">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Rank" name="rank" required>
                    <label for="floatingInput">Rank</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Description" name="description" required>
                    <label for="floatingInput">Mô tả</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" placeholder="Giá" name="price" required>
                    <label for="floatingInput">Giá</label>
                </div>  
                <button class="w-100 btn btn-lg buttonSignUp" type="submit" name="action" value="UpdateAccount">Sửa</button>
            </div>
        </form>
    </main>
</body>
</html>

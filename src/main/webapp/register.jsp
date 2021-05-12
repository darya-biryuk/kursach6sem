<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register - MyGym</title>
                <%@include file="components/common_css_js.jsp" %>

    </head>
    <body style="background-image: url(img/loginback.jpg)">
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            
            <%@include file="components/message.jsp" %>
            
            <div class="card">
                <div class="card-body px-5">
                    
                    <h3 class="text-center my-3">Register Here</h3>
            <form action="RegisterServlet" method="post">
                <div class="form-group">
    <label for="name">Имя пользователя</label>
    <input name="username" type="text" class="form-control" id="name" placeholder="Enter Here" required>
             </div>
                <div class="form-group">
                    <label for="name">Имя</label>
                    <input name="firstname" type="text" class="form-control" id="firstname" placeholder="Enter Here" required>
                </div>
                <div class="form-group">
                    <label for="name">Фамилия</label>
                    <input name="lastname" type="text" class="form-control" id="lastname" placeholder="Enter Here" required>
                </div>
                <div class="form-group">
    <label for="email">Email</label>
    <input name="email" type="email" class="form-control" id="email" placeholder="Enter Here" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
             </div>
                <div class="form-group">
    <label for="password">Пароль</label>
    <input name="password" type="password" class="form-control" id="password" placeholder="Enter Here" required>
             </div>
                <div class="form-group">
    <label for="phone">Номер телефона</label>
    <input name="user_phone" type="phone" class="form-control" id="phone" placeholder="Enter Here " required>
             </div>
                <div class="form-group">
    <label for="address">Адрес</label>
    <textarea name="user_address" style="height:150px" class="form-control" placeholder="Enter your Address" required></textarea>
             </div>
                <div class="container text-center">
                    <button class="btn btn-outline-success" >Регистрация</button>
                    <button class="btn btn-outline-warning" type="reset">Сбросить</button>
                </div>
            </form>
                    
                </div>
            </div>
        </div>
        </div>
        </div>
    </body>
</html>

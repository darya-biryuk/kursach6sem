<%@ page import="com.example.GymSite.Entity.Client" %>
<%@ page import="com.example.GymSite.helper.ClientHelper" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    User user = (User) session.getAttribute("current-user");
    Client client;

    if (user == null) {
        session.setAttribute("message", "You are not Logged in !! Login First to access CheckOut ");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        client = ClientHelper.getUserClient(user);
    }


%>
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
                    <form action="ProfileServlet" method="post">
                        <div class="form-group">
                            <label for="name">Имя пользователя</label>
                            <input name="username" value="<%= user.getUsername()%>" type="text" class="form-control" id="name" placeholder="Enter Here" required>
                        </div>
                        <div class="form-group">
                            <label for="name">Имя</label>
                            <input name="firstname" value="<%= client.getFirstname()%>" type="text" class="form-control" id="firstname" placeholder="Enter Here" required>
                        </div>
                        <div class="form-group">
                            <label for="name">Фамилия</label>
                            <input name="lastname" value="<%= client.getLastname()%>" type="text" class="form-control" id="lastname" placeholder="Enter Here" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input name="email" value="<%= client.getEmail()%>" type="email" class="form-control" id="email" placeholder="Enter Here" readonly>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="password">Пароль</label>
                            <input name="password" value="**********" type="password" class="form-control" id="password" placeholder="Enter Here" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Номер телефона</label>
                            <input name="user_phone" value="<%= client.getTelephone()%>" type="phone" class="form-control" id="phone" placeholder="Enter Here " required>
                        </div>
                        <div class="form-group">
                            <label for="address">Адрес</label>
                            <textarea name="user_address" value="<%= client.getAddress()%>" style="height:150px" class="form-control" placeholder="Enter your Address" required></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success" >Редактировать</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

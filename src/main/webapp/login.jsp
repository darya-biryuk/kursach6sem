<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - MyGym</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background-image: url(img/loginback.jpg)">
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header">
                            <h3>Login Here </h3> 
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
       <form action="LoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Имя пользователя</label>
    <input name="username" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"required>
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Пароль</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"required>
  </div>
                                <a href="register.jsp">Зарегистрироваться</a>
  <div class="container text-center">
      <button type="submit" class="btn btn-primary border-0 custom-bg">Войти</button>
      <button type="reset" class="btn btn-primary border-0 custom-bg">Сброс</button>
  </div>
</form>
                    </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

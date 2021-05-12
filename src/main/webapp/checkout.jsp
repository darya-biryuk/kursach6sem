<%@ page import="com.example.GymSite.Entity.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.GymSite.services.ClientService" %>
<%@ page import="com.example.GymSite.helper.ClientHelper" %>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>


        <div class="container">
            <div class="row mt-5">

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected Item</h3>
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Detail for Order</h3>

                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name = "email" value=" <%= client.getEmail()%> " type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input name = "username" value=" <%= user.getUsername()%> " type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="name">Your Contact</label>
                                    <input name = "telephone" value=" <%= client.getTelephone()%> " type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Contact Number">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                    <textarea name = "address" value=" <%= client.getAddress()%> " class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Your Address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-success"><a href="index.jsp">Continue Shopping</a></button>
                                   
                                </div>

                            </form>

                        </div>
                    </div>

                </div>


            </div>
        </div>





        <%@include file="components/common_modals.jsp" %>
    </body>
</html>

<%@ page import="com.example.GymSite.services.MembershipService" %>
<%@ page import="com.example.GymSite.Entity.Membership" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.GymSite.services.UserService" %>
<%@ page import="com.example.GymSite.services.ClientService" %>
<%@ page import="com.example.GymSite.Entity.Client" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MyGym</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">
    <div class="row mt-3 mx-2">
        <%
            // String cat = request.getParameter("category");
            ClientService clientService = new ClientService();
            List<Client> list = clientService.findAllEntities();
        %>
        <div class="col-md-2">
            <div class="list-group mt-4">
                <a href="users.jsp?users=all" class="list-group-item list-group-item-action active">
                    All Users
                </a>
            </div>
        </div>
        <div class="col-md-10">

            <div class="row mt-4">
                <div class="col-md-12">

                    <div class="card-columns">

                        <%
                            for(Client client : list)
                            {
                        %>
                        <form action="UsersServlet" method="post">
                        <div class="card">
                            <%--<div class="container text-center">
                                <img class="card-img-top" src="img/movies/<%= membership.getmPhoto() %>" style="max-height: 250px;max-width:100%;width: auto " alt="movieImage">
                            </div>--%>
                            <div class="card-body">
                                <input type="text" class="card-title" name = "username" value="<%= client.getUser().getUsername() %>" readonly/>

                                <p class="card-text">
                                    <%--   <%= Helper.get30Words(membership.getmDesc())%>
                                   <small class="form-text text-muted">Category : <%= membership.getCategory().getCategoryTitle() %></small>--%>
                                <p>FirstName : <%= client.getFirstname() %></p>
                                <p>Lastname : <%= client.getLastname() %></p>
                                <p>Email : <%= client.getEmail() %></p>
                                <p>Phone : <%= client.getTelephone() %></p>
                                </p>
                            </div>
                            <div class="card-footer">

                                    <input class="btn btn-primary" type="submit" value="Delete" />
                                </form>
                                <%-- <span class="badge badge-success"><%= membership.getmDiscount() %>% off</span>--%>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>


                </div>
            </div>


        </div>
    </div>

</div>

<%@include file="components/common_modals.jsp" %>


</body>
</html>

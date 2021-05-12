<%@ page import="com.example.GymSite.services.MembershipService" %>
<%@ page import="com.example.GymSite.Entity.Membership" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.GymSite.services.UserService" %>
<%@ page import="com.example.GymSite.services.ClientService" %>
<%@ page import="com.example.GymSite.Entity.Client" %>
<%@ page import="com.example.GymSite.Entity.Direction" %>
<%@ page import="com.example.GymSite.services.DirectionService" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.example.GymSite.Entity.User"%>
<%
    User user2 = (User) session.getAttribute("current-user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MyGym</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body style="background-image: url(images/back.jpg)">
<%@include file="components/navbar.jsp" %>
<div class="container-fluid" class="back_section">
    <div class="row mt-3 mx-2">
        <%
            // String cat = request.getParameter("category");
            DirectionService DirectionService = new DirectionService();
            List<Direction> list = DirectionService.findAllEntities();
        %>
        <div class="col-md-2">
            <div class="list-group mt-4">
                <a href="users.jsp?users=all" class="list-group-item list-group-item-action active">
                    All Directions
                </a>
            </div>
            <div class="list-group mt-4" data-toggle="modal" data-target="#add-direction-modal">
                <%
                    if(user2.getRole().equals("admin")){
                %>
                <input class="btn btn-primary" type="submit" value="Add new" />
                <%
                    }
                %>
            </div>
        </div>
        <div class="col-md-10">

            <div class="row mt-4">
                <div class="col-md-12">

                    <div class="card-columns">

                        <%
                            for(Direction Direction : list)
                            {
                        %>
                        <form action="DirectionServlet" method="post">
                        <div class="card">
                            <%--<div class="container text-center">
                                <img class="card-img-top" src="img/movies/<%= membership.getmPhoto() %>" style="max-height: 250px;max-width:100%;width: auto " alt="movieImage">
                            </div>--%>
                            <div class="card-body">
                                <p class="card-text">
                                    <%--   <%= Helper.get30Words(membership.getmDesc())%>
                                   <small class="form-text text-muted">Category : <%= membership.getCategory().getCategoryTitle() %></small>--%>
                                <p>Name : <%= Direction.getName() %></p>
                                <%
                                    if(user2.getRole().equals("admin")){
                                %>
                                <input type="text" class="card-title" name = "Directionid" value="<%= Direction.getDirectionid() %>" readonly/>
                                <%
                                    }
                                %>
                                </p>
                            </div>
                            <div class="card-footer">
                                    <%
                                    if(user2.getRole().equals("admin")){
                                %>
                                <input class="btn btn-primary" type="submit" value="Delete" />
                                            <%
                                    }
                                %>
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

<div class="modal fade" id="add-direction-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel" style="color:white">Fill Direction Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="ProductOperationServlet" method="post">
                    <input type="hidden" name="operation" value="adddirection">
                    <div class="form-group">
                        <input type="text" class="form-control" name="catTitle" placeholder="Enter Direction Name" required/>
                    </div>
                    <div class="container text-center">
                        <button class="btn btn-primary">Add Direction</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<%@include file="components/common_modals.jsp" %>


</body>
</html>

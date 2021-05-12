<%@ page import="com.example.GymSite.services.MembershipService" %>
<%@ page import="com.example.GymSite.Entity.Membership" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.GymSite.services.UserService" %>
<%@ page import="com.example.GymSite.services.ClientService" %>
<%@ page import="com.example.GymSite.Entity.Client" %>
<%@ page import="com.example.GymSite.Entity.TrainerDirection" %>
<%@ page import="com.example.GymSite.services.TrainerDirectionService" %>
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
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">
    <div class="row mt-3 mx-2">
        <%
            // String cat = request.getParameter("category");
            TrainerDirectionService trainerDirectionService = new TrainerDirectionService();
            List<TrainerDirection> list = trainerDirectionService.findAllEntities();
        %>
        <div class="col-md-2">
            <div class="list-group mt-4">
                <a href="users.jsp?users=all" class="list-group-item list-group-item-action active">
                    All Trainers
                </a>
            </div>
        </div>
        <div class="col-md-10">

            <div class="row mt-4">
                <div class="col-md-12">

                    <div class="card-columns">

                        <%
                            for(TrainerDirection trainerDirection : list)
                            {
                        %>
                        <form action="TrainersServlet" method="post">
                        <div class="card">
                            <%--<div class="container text-center">
                                <img class="card-img-top" src="img/movies/<%= membership.getmPhoto() %>" style="max-height: 250px;max-width:100%;width: auto " alt="movieImage">
                            </div>--%>
                            <div class="card-body">
                                <input type="text" class="card-title" name = "username" value="<%= trainerDirection.getDirection().getName() %>" readonly/>

                                <p class="card-text">
                                    <%--   <%= Helper.get30Words(membership.getmDesc())%>
                                   <small class="form-text text-muted">Category : <%= membership.getCategory().getCategoryTitle() %></small>--%>
                                <p>FirstName : <%= trainerDirection.getTrainer().getFirstname() %></p>
                                <p>Lastname : <%= trainerDirection.getTrainer().getLastname() %></p>
                                <%
                                    if(user2.getRole().equals("admin")){
                                %>
                                <p>Salary : <%= trainerDirection.getTrainer().getSalary() %></p>
                                <p>Birthday : <%= trainerDirection.getTrainer().getBirthdate() %></p>
                                <input type="text" class="card-title" name = "trainerdirectionid" value="<%= trainerDirection.getUserid() %>" readonly/>
                                <%
                                    }
                                %>
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
                     <input class="btn btn-primary" type="submit" value="Add new" />
                    </div>


                </div>
            </div>


        </div>
    </div>

</div>

<%@include file="components/common_modals.jsp" %>


</body>
</html>

<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.security.sasl.SaslClient" %>
<%@ page import="com.example.GymSite.Entity.*" %>
<%@ page import="com.example.GymSite.services.*" %>
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
<div class="container-fluid">
    <div class="row mt-3 mx-2">
        <%
            // String cat = request.getParameter("category");
            ScheduleService schedule = new ScheduleService();
            List<Schedule> list = schedule.findAllEntities();
        %>
        <div class="col-md-2">
            <div class="list-group mt-4">
                <a href="users.jsp?users=all" class="list-group-item list-group-item-action active">
                    Schedule
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
                            for(Schedule schedule1 : list)
                            {
                        %>
                        <form action="ScheduleServlet" method="post">
                            <div class="card">
                                <%--<div class="container text-center">
                                    <img class="card-img-top" src="img/movies/<%= membership.getmPhoto() %>" style="max-height: 250px;max-width:100%;width: auto " alt="movieImage">
                                </div>--%>
                                <div class="card-body">
                                    <input type="text" class="card-title" name = "username" value="<%= schedule1.getTrainerdirectionid().getDirection().getName() %>" readonly/>

                                    <p class="card-text">
                                        <%--   <%= Helper.get30Words(membership.getmDesc())%>
                                       <small class="form-text text-muted">Category : <%= membership.getCategory().getCategoryTitle() %></small>--%>
                                    <p>Date : <%= schedule1.getDate() %></p>
                                    <p>Start : <%= schedule1.getStarttime()%></p>
                                    <p>End : <%= schedule1.getEndtime() %></p>
                                    <p>Room : <%= schedule1.getRoomid().getName() %></p>
                                    <p>Trainer : <%= schedule1.getTrainerdirectionid().getTrainer().getFirstname() + schedule1.getTrainerdirectionid().getTrainer().getLastname() %></p>
                                    <input type="text" class="card-title" name = "scheduleid" value="<%= schedule1.getScheduleid() %>" readonly/>
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

<%@include file="components/common_modals.jsp" %>


</body>
</html>

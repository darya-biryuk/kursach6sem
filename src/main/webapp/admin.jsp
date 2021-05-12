<%@ page import="com.example.GymSite.services.UserService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.GymSite.services.MembershipService" %>
<%@ page import="com.example.GymSite.services.ClientService" %>
<%@ page import="com.example.GymSite.services.TrainerDirectionService" %>
<%@ page import="com.example.GymSite.Entity.*" %>
<%
    
    User user = (User) session.getAttribute("current-user");
    if(user==null){
    session.setAttribute("message","You are not Logged in !! Login First");
    response.sendRedirect("login.jsp");
    return;
    }else{
        if(user.getRole().equals("normal")){
        session.setAttribute("message","You are not Admin");
        response.sendRedirect("login.jsp");
        return;
    }
    }
    
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <style>
        .admin .card{
    
    background: #eceff1;
}
.admin .card:hover{
    background: #cfd8dc;
    transition: 0.5s;
    cursor: pointer;
}

    </style>
    <body style="background-image: url(images/back.jpg)">
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
             <%
                 //getting realtime data of users movies and categories
              TrainerDirectionService cdao = new TrainerDirectionService();
                 List<TrainerDirection> list = cdao.findAllEntities();
              UserService udao = new UserService();
              List<User> ulist = udao.findAllEntities();
              ClientService mdao = new ClientService();
              List<Client> mlist = mdao.findAllEntities();
              %>
            <div class="row mt-3">
                <!--first card-->
                <div class="col-md-4" data-toggle="tooltip" data-placement="left" title="Number of User">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
                            </div>
                            <h5><%= ulist.size()%></h5>
                            <a class="nav-link" href="users.jsp">Users</a>
                        </div>
                    </div>
                </div>
               
                <!--second card-->
                <div class="col-md-4" data-toggle="tooltip" data-placement="top" title="Number of Categories Available">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container" >
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/categories.png" alt="category_icon">
                            </div>
                            <h5><%= list.size()%></h5>
                            <a class="nav-link" href="trainers.jsp">Trainers</a>
                        </div>
                    </div>
                </div>
                <!--third card-->
                <div class="col-md-4"  data-toggle="tooltip" data-placement="right" title="Movie Available">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/movie.png" alt="movie_icon">
                            </div>
                            <h5><%= mlist.size()%></h5>
                            <a class="nav-link" href="memberships.jsp">Memberships</a>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
                <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/movie.png" alt="movie_icon">
                            </div>
                            <h5><%= mlist.size()%></h5>
                            <a class="nav-link" href="schedule.jsp">Schedule</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-movie-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/movie.png" alt="movie_icon">
                            </div>
                            <h5><%= mlist.size()%></h5>
                            <a class="nav-link" href="direction.jsp">Direction</a>
                        </div>
                    </div>
                </div>
            </div>
            
                
            
            
            
        </div>
       <!--add category modal-->
         <%@include file="components/common_modals.jsp" %>


        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>

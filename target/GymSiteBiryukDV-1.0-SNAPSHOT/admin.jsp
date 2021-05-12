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
     
<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
          <form action="ProductOperationServlet" method="post">
              <input type="hidden" name="operation" value="addcategory">
              <div class="form-group">
                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title " required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height:250px;" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea>
              </div>
              <div class="container text-center">
                  <button class="btn btn-primary">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </form>
          
      </div>
    </div>
  </div>
</div>


<!--add Movie modal-->
     
<!-- Modal -->
<div class="modal fade" id="add-movie-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
          <h5 class="modal-title" id="exampleModalLabel" style="color:white" >Fill Movie Details</h5>
        <button type="button" class="close" data-dismiss="modal" style="color:white" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" name="operation" value="addmovie"/>
              <div class="form-group">
                <input type="text" class="form-control" name="movName" placeholder="Movie Title " required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height:150px;" class="form-control" name="movDescription" placeholder="Description" required></textarea>
              </div>
              
             
              <div class="form-group">
              <select name="catId" class="form-control" required>
                  <% 
                    for(TrainerDirection c : list){
                  %>
                      
              <option value="<%= c.getUserid() %>"> <%= c.getNote() %></option>
              <%} %>
                </select>
              </div>
              <div class="form-group">
                <input type="number" class="form-control" name="movYear" placeholder="Release Year" required/>
              </div>
              
              <div class="form-group">
                <input type="number" step=0.01 class="form-control" name="movRating" placeholder="IMDB Rating" required/>
              </div>
              
              <div class="form-group">
                <label for="movPic">Choose Movie Poster Image</label>
                <input name="movPic" type="file" class="form-control-file" id="exampleFormControlFile1" required>
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" name="movPrice" placeholder="Movie Price" required/>
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" name="movQuantity" placeholder="Quantity" required/>
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" name="movDiscount" placeholder="Discount" required/>
              </div>
              
              
              
              
              
              <div class="container text-center">
                  <button class="btn btn-primary">Add Movie</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </form>
          
      </div>
    </div>
  </div>
</div>
         <%@include file="components/common_modals.jsp" %>


        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>

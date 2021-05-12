<%@ page import="com.example.GymSite.services.MembershipService" %>
<%@ page import="com.example.GymSite.Entity.Membership" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            MembershipService membershipService = new MembershipService();
            List<Membership> list = membershipService.findAllEntities();
        %>
        <div class="col-md-2">
            <div class="list-group mt-4">
                <a href="index.jsp?membership=all" class="list-group-item list-group-item-action active">
                    All Memberships
                </a>
            </div>
            <div class="list-group mt-4" data-toggle="modal" data-target="#add-membership-modal">
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
                            for(Membership membership : list)
                            {
                        %>
                        <div class="card">
                            <%--<div class="container text-center">
                                <img class="card-img-top" src="img/movies/<%= membership.getmPhoto() %>" style="max-height: 250px;max-width:100%;width: auto " alt="movieImage">
                            </div>--%>
                            <div class="card-body">
                                <h5 class="card-title" name = "membershipname"><%= membership.getName() %></h5>

                                <p class="card-text">
                                     <%--   <%= Helper.get30Words(membership.getmDesc())%>
                                    <small class="form-text text-muted">Category : <%= membership.getCategory().getCategoryTitle() %></small>--%>
                                <p>Visits : <%= membership.getVisits() %></p>
                                <p>Days : <%= membership.getDays() %></p>
                                <p>Price : <%= membership.getPrice() %></p>
                                </p>
                            </div>
                            <div class="card-footer">
                                <button class="btn btn-primary" onclick="add_to_cart(<%= membership.getMembershipid()%>,'<%= membership.getName() %>',<%= membership.getPrice()%>)">Add to Cart</button>
                                <%
                                    if(user2.getRole().equals("admin")){
                                %>
                                <button name = "button2"  class="btn btn-primary" >Delete</button>
                                <%
                                    }
                                %>
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
<div class="modal fade" id="add-membership-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <input type="hidden" name="operation" value="addmembership">
                <div class="form-group">
                    <input type="text" class="form-control" name="Name" placeholder="Enter Membership Name" required/>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="price" placeholder="Enter Price" required/>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="visits" placeholder="Enter Visits" required/>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="days" placeholder="Enter Days" required/>
                </div>
                <div class="container text-center">
                    <button class="btn btn-primary">Add Membership</button>
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

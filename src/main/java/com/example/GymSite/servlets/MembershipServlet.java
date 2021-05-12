/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.GymSite.servlets;

import com.example.GymSite.Entity.User;
import com.example.GymSite.helper.UserHelper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author ABHISHEK
 */
public class MembershipServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            //fetch data from login page
            String email = request.getParameter("username");
            String password = request.getParameter("password");

            //validations

            //authenticating user
            HttpSession httpSession = request.getSession();
            User returnUser = UserHelper.successfulLogin(new User(email, password));
            if(returnUser == null){
                httpSession.setAttribute("message", "Invalid Details, Email or Password is incorrect...");
                response.sendRedirect("login.jsp");
                return;
            }else{
                out.println("<h1>Welcome "+ returnUser.getUsername() +"</h1>");

                httpSession.setAttribute("current-user", returnUser);

                if(returnUser.getRole().equals("admin")){
                    response.sendRedirect("admin.jsp");
                }
                else if(returnUser.getRole().equals("normal")){

                    response.sendRedirect("index.jsp");

                }else{
                    out.println("We have not identified User Type");
                }

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

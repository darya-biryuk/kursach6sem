/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.GymSite.servlets;

import com.example.GymSite.Entity.Client;
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
public class RegisterServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            try {
                final String userName = request.getParameter("username");
                String userPassword = request.getParameter("password");
                String firstName = request.getParameter("firstname");
                String lastName = request.getParameter("lastname");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");
                String email = request.getParameter("email");


                HttpSession httpSession = request.getSession();

                if(userName.isEmpty()){
                    out.println("Name is Blank");
                    return;
                }

                Client client = new Client(firstName, lastName, userPhone, userAddress, email);
                User user = new User(userName, userPassword, "normal");
                if(UserHelper.successfulRegistration(user, client) == true){
                    httpSession.setAttribute("message","Registration Successful!!");
                }
                else {
                    httpSession.setAttribute("message", "Пользователь с таким именем уже существует");
                }
                response.sendRedirect("register.jsp");
                return;
                
               
            } catch (Exception e) {
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

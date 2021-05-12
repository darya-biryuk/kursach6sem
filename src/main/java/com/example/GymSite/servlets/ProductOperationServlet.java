/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.GymSite.servlets;

import com.example.GymSite.Entity.Direction;
import com.example.GymSite.Entity.Membership;
import com.example.GymSite.helper.DirectionHelper;
import com.example.GymSite.helper.MembershipHelper;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;

/**
 *
 * @author ABHISHEK
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

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
            HttpSession httpSession = request.getSession();
            
//            this servlet handles both add movie and add category
            String op = request.getParameter("operation");
            if(op.trim().equals("adddirection"))
            {
                // add category
                //fetching category data
            String title = request.getParameter("catTitle");
                Direction direction = new Direction();
                direction.setName(title);
                //category database save:
                if(DirectionHelper.successfulAdd(direction) == true){
                    httpSession.setAttribute("message","Added Successful!!");
                }
                else {
                    httpSession.setAttribute("message", "Направление с таким именем уже существует");
                }
                response.sendRedirect("direction.jsp");
                
                
            }
            else if(op.trim().equals("addmembership"))
            {
                // add movie
                String Name = request.getParameter("Name");
                Double price = Double.parseDouble(request.getParameter("price"));
                int visits =Integer.parseInt(request.getParameter("visits"));
                int days =Integer.parseInt(request.getParameter("days"));
                Membership membership = new Membership(Name, price, visits, days);
                if(MembershipHelper.successfulAdd(membership) == true){
                    httpSession.setAttribute("message","Added Successful!!");
                }
                else {
                    httpSession.setAttribute("message", "Абонемент с таким именем уже существует");
                }
                response.sendRedirect("memberships.jsp");
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

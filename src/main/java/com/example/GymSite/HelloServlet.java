package com.example.GymSite;

import com.example.GymSite.DAO.UserDAO;
import com.example.GymSite.Entity.User;
import com.example.GymSite.Interface.DAO;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        DAO daoService = new UserDAO();
        User entity = (User) daoService.findById(1);
        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + entity.getUsername() + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.RequestDispatcher;
import java.text.ParseException;

import database.DBConnection;
import java.sql.SQLException;
import model.User;
import DAO.UserDAO;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author marli
 */
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID =1L;
    
    
    private UserDAO dao;
    
    public SignupServlet() throws ClassNotFoundException{
        super();
        dao = new UserDAO();
    }
    


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String usertype = request.getParameter("usertype");
        String password = request.getParameter("password");
        
        User user = new User(name, email, usertype, password);
        dao.saveUser(user);
        
        response.sendRedirect("Login.jsp");     
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

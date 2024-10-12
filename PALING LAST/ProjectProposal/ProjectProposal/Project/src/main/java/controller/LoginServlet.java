/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author marli
 */
public class LoginServlet extends HttpServlet {

    private UserDAO dao;
    
    public LoginServlet() throws ClassNotFoundException{
        super();
        dao = new UserDAO();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        
        String usertype = dao.validateUser(email, password);
        
        if(usertype != null){
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("usertype", usertype);
            
            if("quality".equals(usertype)){
                response.sendRedirect("display.jsp");
            }
            else{
                response.sendRedirect("displayProposal.jsp");
            }
        }
        
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

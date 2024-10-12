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
import model.Podoc;
import DAO.ProgDAO;

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
import model.Meeting;



/**
 *
 * @author marli
 */

@MultipartConfig (fileSizeThreshold = 1024 * 1024 * 10, //10mb
        maxFileSize = 1024 * 1024 * 1000, //1gb
        maxRequestSize = 1024 *1024 * 1000) //1gb
public class podoController extends HttpServlet {
   // private static String INSERT = "/proposal.jsp";
    
    PrintWriter out = null;
    Connection conn= null;
    PreparedStatement ps = null;
    HttpSession session = null;
    
    private static String INSERT = "/proposal.jsp";
    private static String EDIT = "/Edit.jsp";
    private static String PROG_LIST = "/display.jsp";
    private ProgDAO dao;
    
    public podoController() throws ClassNotFoundException{
        super();
        dao = new ProgDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String forward = "";
         String action = request.getParameter("action");
         
         try{
             if(action != null){
                if(action.equalsIgnoreCase("delete")){
                    String progCode = request.getParameter("progCode");
                    dao.deleteProg(progCode);
                    forward = PROG_LIST;
                    request.setAttribute("podoc", dao.getAllProgs());
                }
                else if (action.equalsIgnoreCase("edit")){
                    forward = EDIT;
                    String progCode = request.getParameter("progCode");
                    Podoc podoc = dao.getProgByCode(progCode);
                    request.setAttribute("podoc", podoc);
                    request.getRequestDispatcher(EDIT).forward(request, response);
                }
                else if (action.equalsIgnoreCase("display")){
                    forward = PROG_LIST;
                    request.setAttribute("podoc", dao.getAllProgs());
                }

                else if (action.equalsIgnoreCase("insert")){
                    forward = INSERT;
                }
             }
             
             request.setAttribute("podoc", dao.getAllProgs());
         } catch (SQLException e){
             e.printStackTrace();
         }
         
         RequestDispatcher view = request.getRequestDispatcher(forward);
         view.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
        String action = request.getParameter("action");
        
        String folderName = "Files";
        String uploadPath = request.getServletContext().getRealPath("")+File.separator+folderName;
        File dir = new File(uploadPath);
        if(!dir.exists()){
            dir.mkdir();
        }
        String progCode = request.getParameter("progCode");
        String progName = request.getParameter("namaProgram");
        String faculty = request.getParameter("fakulti");
        Part filePart = request.getPart("dokumen");
        String fileName = filePart.getSubmittedFileName();
        String path = folderName + File.separator + fileName;
        System.out.println("Program Code: "+progCode);
        System.out.println("fileName: "+fileName);
        System.out.println("Path: "+path);
        InputStream is = filePart.getInputStream();
        Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
        
        Podoc podoc = new Podoc();
        podoc.setProgCode(progCode);
        podoc.setProgName(progName);
        podoc.setFaculty(faculty);
        podoc.setFilename(fileName);
        podoc.setPath(path);
        
        try{
        if(action.equalsIgnoreCase("edit")){
            dao.updateProg(podoc);
        }
        else if(action.equalsIgnoreCase("insert")){
            dao.addProg(podoc);
        }
        
        Meeting meeting = new Meeting();
        meeting.setProgramCode(podoc.getProgCode());
        meeting.setProgName(podoc.getProgName());
        meeting.setFaculty(podoc.getFaculty());
        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(PROG_LIST);
        request.setAttribute("podoc", dao.getAllProgs());
        dispatcher.forward(request, response);
        }
        catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

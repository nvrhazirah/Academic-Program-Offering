<%-- 
    Document   : display
    Created on : Jun 1, 2024, 1:17:59 PM
    Author     : marli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="meeting.meetingJPPU"%>
<%@page import="java.util.List"%>
<%@page import="model.Podoc"%>
<%@ page import="java.util.*, model.Podoc, DAO.ProgDAO"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style1.css">
        <link rel="stylesheet" href="style2.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>UMT Academic Program Development Tracking System</title>
    </head>
    <body>
        <!-- This the header of the page-->
        <div class="header">
            <header>
                <table>
                    <tr>
                        <td class="logoumtcol"><img class="logoumt" src="https://upload.wikimedia.org/wikipedia/commons/3/3e/Logo_Rasmi_UMT.png"></td>
                        <td><h1>UMT Academic Program Development Tracking System</h1></td>
                    </tr>
                </table>
            </header>
        </div>

        <!-- Navigation bar of the page -->
        <div class="navbar">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#list">Program List</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">Manage Application</a>
                    <div class="dropdown-content">
                        <a href="#">Internal Application</a>
                        <a href="javascript:void(0)" class="subdropbtn">Provisional Accreditation ></a>
                        <div class="sub-dropdown-content">
                            <a href="#">MQA-01</a>
                            <a href="#">JPT</a>
                        </div>
                        <a href="#">Program Offering</a>
                        <a href="#">Full Accreditation</a>
                        <a href="#">MQA Certification</a>
                    </div>
                </li>
                <li class="profile">
                    <a href="javascript:void(0)" class="dropbtn"><img class="iconProfile" src="https://static.vecteezy.com/system/resources/previews/019/879/186/original/user-icon-on-transparent-background-free-png.png">Profile</a>
                    <div class="dropdown-content">
                        <a href="Login.jsp">Logout</a>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content">
            <h2 class="mt-4">Program Records</h2>
            <button class="add-program-btn" onclick="location.href = 'podoController?action=insert'">Add New Program</button>


            <table class="table">
                <thead class = "thead-dark">
                    <tr>
                        <th scope="col">Program Code</th>
                        <th scope="col">Program Name</th>
                        <th scope="col">Faculty</th>
                        <th scope="col">File Name</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        try{
                        ProgDAO dao = new ProgDAO();
                        List<Podoc> podocs = dao.getAllProgs();
                        for (Podoc podoc : podocs){
                        
                    %>
                    
                    <tr>
                        <td><%=podoc.getProgCode()%></td>
                        <td><%=podoc.getProgName()%></td>
                        <td><%=podoc.getFaculty()%></td>
                        <td><%=podoc.getFilename()%></td>
                        
                        

                    </tr>
                    <% 
                          }
                        } catch (Exception e){  
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="footer">
            <footer>&copy; Pusat Pengurusan dan Penjaminan Kualiti UMT 2024</footer>
        </div>
        <script src="js/script1.js"></script>
        <script src="js/script2.js"></script>
    </body>
</html>

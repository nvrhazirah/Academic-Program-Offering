
<%-- 
    Document   : ListMeeting
    Created on : 2 Jun 2024, 9:25:39 PM
    Author     : zira
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                <li><a href="Register.jsp">certificate registration </a></li>
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
                        <a href="#">Logout</a>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content">
            <h2>List of Meetings</h2>
            <button onclick="location.href='MeetingController?action=insert'">Add New Meeting</button>
           <h2>JKA Meetings</h2>
<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Meeting Id</th>
            <th scope="col">Program Code</th>
            <th scope="col">Program Name</th>
            <th scope="col">Faculti</th>
            <th scope="col">Mesyuarat</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Venue</th>
            <th scope="col">Status</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${jkaMeetings}" var="meeting">
            <tr>
                <td><c:out value="${meeting.meetingid}" /></td>
                <td><c:out value="${meeting.programCode}" /></td>
                <td><c:out value="${meeting.progName}" /></td>
                <td><c:out value="${meeting.faculty}" /></td>
                <td><c:out value="${meeting.meetingType}" /></td>
                <td><fmt:formatDate value="${meeting.date}" pattern="dd-MM-yyyy" /></td>
                <td><fmt:formatDate value="${meeting.time}" pattern="hh:mm a" /></td>
                <td><c:out value="${meeting.venue}" /></td>
                <td><c:out value="${meeting.status}" /></td>
                <td><a href="MeetingController?action=edit&meetingid=${meeting.meetingid}">Edit</a></td>
                <td><a href="MeetingController?action=delete&meetingid=${meeting.meetingid}">Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<h2>LPU Meetings</h2>
<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Meeting Id</th>
            <th scope="col">Program Code</th>
            <th scope="col">Program Name</th>
            <th scope="col">Faculti</th>
            <th scope="col">Mesyuarat</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Venue</th>
            <th scope="col">Status</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${lpuMeetings}" var="meeting">
            <tr>
                <td><c:out value="${meeting.meetingid}" /></td>
                <td><c:out value="${meeting.programCode}" /></td>
                <td><c:out value="${meeting.progName}" /></td>
                <td><c:out value="${meeting.faculty}" /></td>
                <td><c:out value="${meeting.meetingType}" /></td>
                <td><fmt:formatDate value="${meeting.date}" pattern="dd-MM-yyyy" /></td>
                <td><fmt:formatDate value="${meeting.time}" pattern="hh:mm a" /></td>
                <td><c:out value="${meeting.venue}" /></td>
                <td><c:out value="${meeting.status}" /></td>
                <td><a href="MeetingController?action=edit&meetingid=${meeting.meetingid}">Edit</a></td>
                <td><a href="MeetingController?action=delete&meetingid=${meeting.meetingid}">Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<h2>Senat Meetings</h2>
<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Meeting Id</th>
            <th scope="col">Program Code</th>
            <th scope="col">Program Name</th>
            <th scope="col">Faculti</th>
            <th scope="col">Mesyuarat</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Venue</th>
            <th scope="col">Status</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${senatMeetings}" var="meeting">
            <tr>
                <td><c:out value="${meeting.meetingid}" /></td>
                <td><c:out value="${meeting.programCode}" /></td>
                <td><c:out value="${meeting.progName}" /></td>
                <td><c:out value="${meeting.faculty}" /></td>
                <td><c:out value="${meeting.meetingType}" /></td>
                <td><fmt:formatDate value="${meeting.date}" pattern="dd-MM-yyyy" /></td>
                <td><fmt:formatDate value="${meeting.time}" pattern="hh:mm a" /></td>
                <td><c:out value="${meeting.venue}" /></td>
                <td><c:out value="${meeting.status}" /></td>
                <td><a href="MeetingController?action=edit&meetingid=${meeting.meetingid}">Edit</a></td>
                <td><a href="MeetingController?action=delete&meetingid=${meeting.meetingid}">Delete</a></td>
            </tr>
        </c:forEach>
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
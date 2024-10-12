<%-- 
    Document   : FormMeeting
    Created on : 2 Jun 2024, 3:36:39 PM
    Author     : zira
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <div class="form-container">
                <h3>Arrange Meeting Details</h3>
                <form action="MeetingControllerServlet?action=insert" method="post">
                    <table>
                        <tr>
                            <td><label for="programCode">Program Code:</label></td>
                            <td><input type="text" id="programCode" name="programCode" value="${progCode}" required></td>
                        </tr>
                        <tr>
                            <td><label for="progName">Program Name:</label></td>
                            <td><input type="text" id="progName" name="progName" value="${progName}" required></td>
                        </tr>
                        <tr>
                            <td><label for="fakulti">Faculty:</label></td>
                            <td>
                            <select id="fakulti" name="faculty" value="${faculty}" required>
                                <option value="">--Pilih Fakulti--</option>
                                <option value="Fakulti Sains & Sekitaran Marin">Fakulti Sains & Sekitaran Marin</option>
                                <option value="Fakulti Sains Komputer dan Matematik">Fakulti Sains Komputer dan Matematik</option>
                                <option value="Fakulti Teknologi Kejuruteraan Kelautan">Fakulti Teknologi Kejuruteraan Kelautan</option>
                                <option value="Fakulti Perikanan & Sains Makanan">Fakulti Perikanan & Sains Makanan</option>
                                <option value="Fakulti Perniagaan, Ekonomi & Pembangunan Sosial">Fakulti Perniagaan, Ekonomi & Pembangunan Sosial</option>
                                <option value="Fakulti Pengajian Maritim">Fakulti Pengajian Maritim</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td><label>Meeting Type</label></td>
                            <td><select name="meetingType">
                                <option value="JKA">JKA</option>
                                <option value="Senat">Senat</option>
                                <option value="LPU">LPU</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td><label for="date">Date:</label></td>
                            <td><input type="date" id="date" name="date" value="${meeting.date}"  required></td>
                        </tr>
                        <tr>
                            <td><label for="time">Time:</label></td>
                            <td><input type="time" id="time" name="time" value="${meeting.time}" required></td>
                        </tr>
                        <tr>
                            <td><label for="venue">Venue:</label></td>
                            <td><input type="text" id="venue" name="venue" value="${meeting.venue}" required></td>
                        </tr>
                        <tr>
                            <td><label for="status">Current Status:</label></td>
                            <td>
                                <select id="status" name="status" required>
                                    <option value="pending">Pending</option>
                                    <option value="inprogress">In Progress</option>
                                    <option value="completed">Completed</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><button type="submit">Submit</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>


        <div class="footer">
            <footer>&copy; Pusat Pengurusan dan Penjaminan Kualiti UMT 2024</footer>
        </div>

        <!-- Link to the external JavaScript files -->
        <script src="js/script1.js"></script>
        <script src="js/script2.js"></script>
    </body>
</html>
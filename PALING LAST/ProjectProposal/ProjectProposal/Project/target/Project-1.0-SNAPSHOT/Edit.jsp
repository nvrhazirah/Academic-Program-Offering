<%-- 
    Document   : edit
    Created on : Jun 8, 2024, 2:52:28 PM
    Author     : marli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- This is the header of the page -->
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
                <h1>Edit Program</h1>
                <form action="podoController" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="progCode">Program Code:</label>
                        <input type="text" id="progCode" name="progCode" value="${podoc.progCode}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="namaProgram">Nama Program:</label>
                        <input type="text" id="namaProgram" name="namaProgram" value="${podoc.progName}">
                    </div>
                    <div class="form-group">
                        <label for="fakulti">Fakulti:</label>
                        <select id="fakulti" name="fakulti" value="${podoc.faculty} required>
                            <option value="">--Pilih Fakulti--</option>
                            <option value="Fakulti Sains & Sekitaran Marin">Fakulti Sains & Sekitaran Marin</option>
                            <option value="Fakulti Sains Komputer dan Matematik">Fakulti Sains Komputer dan Matematik</option>
                            <option value="Fakulti Teknologi Kejuruteraan Kelautan">Fakulti Teknologi Kejuruteraan Kelautan</option>
                            <option value="Fakulti Perikanan & Sains Makanan">Fakulti Perikanan & Sains Makanan</option>
                            <option value="Fakulti Perniagaan, Ekonomi & Pembangunan Sosial">Fakulti Perniagaan, Ekonomi & Pembangunan Sosial</option>
                            <option value="Fakulti Pengajian Maritim">Fakulti Pengajian Maritim</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dokumen">Upload Document:</label>
                        <input type="file" id="dokumen" name="dokumen">
                    </div>
                    <input type="hidden" name="action" value="edit">
                    <input type="submit" name="Edit" value="Edit" class="add-program-btn">

                </form>
            </div>
        </div>
        <div class="footer">
            <footer>&copy; Pusat Pengurusan dan Penjaminan Kualiti UMT 2024</footer>
        </div>
        <script src="js/script1.js"></script>
        <script src="js/script2.js"></script>
    </body>
</html>

<%-- 
    Document   : display
    Created on : 7 Jun 2024, 12:36:53 pm
    Author     : Lenovo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, DAO.RegDAO, model.Regdoc" %>

<!DOCTYPE html>
<html>
<head>
    
         <title>UMT Academic Program Development Tracking System</title>
    <title>Pendaftaran Perakuan KPT</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f7f7f7;
            font-weight: bold;
        }
        .delete-btn {
            color: white;
            background-color: red;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 4px;
        }
        .delete-btn a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    

        <!-- Navigation bar of the page -->
       

<h2>Maklumat Pendaftaran Perakuan KPT</h2>
<div class="content">
            <div class="form-container">
<table>
    <tr>
        <th>Id</th>
        <th>Program Akademik</th>
        <th>Entiti Akademik</th>
        <th>Jam Kredit</th>
        <th>Tahap MQF</th>
        <th>Kaedah Penawaran</th>
        <th>Bidang NEC</th>
        <th>Tempoh Pengajian</th>
        <th>Tempoh Minimum</th>
        <th>Tempoh Maksimum</th>
        <th>Tahun Sesi Penawaran</th>
        <th>Implikasi Kakitangan</th>
        <th>Implikasi Kewangan</th>
        <th>Implikasi Fizikal</th>
        <th>Kelulusan KPT</th>
        <th>Akreditasi Sementara</th>
        <th>Senat</th>
        <th>LPU</th>
        <th>Dokumen</th>
        <th>Action</th>
    </tr>
   
    <%
        try {
            RegDAO regDAO = new RegDAO();
            List<Regdoc> regdocs = regDAO.getAll();
            for (Regdoc regdoc : regdocs) {
    %>
    <tr>
        <td><%= regdoc.getId()%></td>
        <td><%= regdoc.getProgramAkademik() %></td>
        <td><%= regdoc.getEntitiAkademik() %></td>
        <td><%= regdoc.getJamKredit() %></td>
        <td><%= regdoc.getTahapMQF() %></td>
        <td><%= regdoc.getKaedahPenawaran() %></td>
        <td><%= regdoc.getBidangNEC() %></td>
        <td><%= regdoc.getTempohPengajian() %></td>
        <td><%= regdoc.getTempohMinimum() %></td>
        <td><%= regdoc.getTempohMaksimum() %></td>
        <td><%= regdoc.getTahunSesiPenawaran() %></td>
        <td><%= regdoc.getImplikasiKakitangan() %></td>
        <td><%= regdoc.getImplikasiKewangan() %></td>
        <td><%= regdoc.getImplikasiFizikal() %></td>
        <td><%= regdoc.getKelulusanKPT() %></td>
        <td><%= regdoc.getAkreditasiSementara() %></td>
        <td><%= regdoc.getSenat() %></td>
        <td><%= regdoc.getLpu() %></td>
        <td><a href="<%= regdoc.getDocumentPath() %>">Download</a></td>
        <td><a href="RegController?action=edit&id=<%= regdoc.getId() %>">Edit</a><br>
        <a href="RegController?action=delete&id=<%= regdoc.getId() %>">Delete</a></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>

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

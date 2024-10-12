<%-- 
    Document   : Edit
    Created on : 7 Jun 2024, 10:25:46 am
    Author     : Lenovo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dao.RegDAO, com.Model.Regdoc" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Pendaftaran Perakuan KPT</title>
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
        input[type="text"], input[type="file"], textarea, input[type="date"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 4px 0;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"], input[type="button"] {
            width: 100px;
            padding: 10px;
            margin: 10px 10px 10px 0;
            box-sizing: border-box;
            border: none;
            border-radius: 4px;
            background-color: #5cb85c;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }
        input[type="button"] {
            background-color: #f0ad4e;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

<%
    String programAkademik = request.getParameter("programAkademik");
    RegDAO regDAO = new RegDAO();
    Regdoc regdoc = regDAO.getRegDogByCode(programAkademik);
%>

<h2>Edit Pendaftaran Perakuan KPT</h2>
<form action="display.jsp" method="post" enctype="multipart/form-data">

    <table>
        <tr>
            <th>Perkara</th>
            <th>Keterangan</th>
        </tr>
        <tr>
            <td>Program Akademik</td>
            <td><input type="text" name="programAkademik" value="<%= regdoc.getProgramAkademik() %>" readonly></td>
        </tr>
        <tr>
            <td>Entiti Akademik</td>
            <td><input type="text" name="entitiAkademik" value="<%= regdoc.getEntitiAkademik() %>"></td>
        </tr>
        <tr>
            <td>Jam Kredit</td>
            <td><input type="text" name="jamKredit" value="<%= regdoc.getJamKredit() %>"></td>
        </tr>
        <tr>
            <td>Tahap MQF</td>
            <td><input type="text" name="tahapMQF" value="<%= regdoc.getTahapMQF() %>"></td>
        </tr>
        <tr>
            <td>Kaedah Penawaran</td>
            <td><input type="text" name="kaedahPenawaran" value="<%= regdoc.getKaedahPenawaran() %>"></td>
        </tr>
        <tr>
            <td>Bidang NEC</td>
            <td><input type="text" name="bidangNEC" value="<%= regdoc.getBidangNEC() %>"></td>
        </tr>
        <tr>
            <td>Kaedah Pengedalian / Tempoh Pengajian</td>
            <td>
                <label>Tempoh Pengajian:</label> <input type="text" name="tempohPengajian" value="<%= regdoc.getTempohPengajian() %>">
                <label>Minimum:</label> <input type="text" name="tempohMinimum" value="<%= regdoc.getTempohMinimum() %>">
                <label>Maksimum:</label> <input type="text" name="tempohMaksimum" value="<%= regdoc.getTempohMaksimum() %>">
            </td>
        </tr>
        <tr>
            <td>Tahun/ Sesi Penawaran</td>
            <td><input type="text" name="tahunSesiPenawaran" value="<%= regdoc.getTahunSesiPenawaran() %>"></td>
        </tr>
        <tr>
            <td>Implikasi</td>
            <td>
                <textarea name="implikasiKakitangan" placeholder="Implikasi Kakitangan"><%= regdoc.getImplikasiKakitangan() %></textarea>
                <textarea name="implikasiKewangan" placeholder="Implikasi Kewangan"><%= regdoc.getImplikasiKewangan() %></textarea>
                <textarea name="implikasiFizikal" placeholder="Implikasi Fizikal"><%= regdoc.getImplikasiFizikal() %></textarea>
            </td>
        </tr>
        <tr>
            <td>Tarikh Kelulusan</td>
            <td>
                <label>Kelulusan Saringan Awal KPT:</label> <input type="date" name="kelulusanKPT" value="<%= regdoc.getKelulusanKPT() %>">
                <label>Perakuan Akreditasi Sementara:</label> <input type="date" name="akreditasiSementara" value="<%= regdoc.getAkreditasiSementara() %>">
                <label>Senat:</label> <input type="date" name="senat" value="<%= regdoc.getSenat() %>">
                <label>LPU:</label> <input type="date" name="lpu" value="<%= regdoc.getLpu() %>">
            </td>
        </tr>
        <tr>
            <td>Upload Document</td>
            <td><input type="file" name="document"></td>
        </tr>
    </table>
    <input type="submit" value="Update" name="Update">

</form>

</body>
</html>

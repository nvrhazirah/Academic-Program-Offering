<%-- 
    Document   : Register
    Created on : 7 Jun 2024, 10:25:46 am
    Author     : Lenovo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, DAO.RegDAO, model.Regdoc" %>

<!DOCTYPE html>
<html>
<head>
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

<h2>Pendaftaran Perakuan KPT</h2>
<form action="RegController?action=insert" method="post" enctype="multipart/form-data">

    <table>
        <tr>
            <th>Perkara</th>
            <th>Keterangan</th>
        </tr>
        <tr>
            <td>Program Akademik</td>
            <td><input type="text" name="programAkademik" placeholder="Masukkan Program Akademik"></td>
        </tr>
        <tr>
            <td>Entiti Akademik</td>
            <td><input type="text" name="entitiAkademik" placeholder="Masukkan Entiti Akademik"></td>
        </tr>
        <tr>
            <td>Jam Kredit</td>
            <td><input type="text" name="jamKredit" placeholder="Masukkan Jam Kredit"></td>
        </tr>
        <tr>
            <td>Tahap MQF</td>
            <td><input type="text" name="tahapMQF" placeholder="Masukkan Tahap MQF"></td>
        </tr>
        <tr>
            <td>Kaedah Penawaran</td>
            <td><input type="text" name="kaedahPenawaran" placeholder="Masukkan Kaedah Penawaran"></td>
        </tr>
        <tr>
            <td>Bidang NEC</td>
            <td><input type="text" name="bidangNEC" placeholder="Masukkan Bidang NEC"></td>
        </tr>
        <tr>
            <td>Kaedah Pengedalian / Tempoh Pengajian</td>
            <td>
                <label>Tempoh Pengajian:</label> <input type="text" name="tempohPengajian" placeholder="Masukkan Tempoh Pengajian">
                <label>Minimum:</label> <input type="text" name="tempohMinimum" placeholder="Masukkan Tempoh Minimum">
                <label>Maksimum:</label> <input type="text" name="tempohMaksimum" placeholder="Masukkan Tempoh Maksimum">
            </td>
        </tr>
        <tr>
            <td>Tahun/ Sesi Penawaran</td>
            <td><input type="text" name="tahunSesiPenawaran" placeholder="Masukkan Tahun/Sesi Penawaran"></td>
        </tr>
        <tr>
            <td>Implikasi</td>
            <td>
                <textarea name="implikasiKakitangan" placeholder="Implikasi Kakitangan"></textarea>
                <textarea name="implikasiKewangan" placeholder="Implikasi Kewangan"></textarea>
                <textarea name="implikasiFizikal" placeholder="Implikasi Fizikal"></textarea>
            </td>
        </tr>
        <tr>
            <td>Tarikh Kelulusan</td>
            <td>
                <label>Kelulusan Saringan Awal KPT:</label> <input type="date" name="kelulusanKPT">
                <label>Perakuan Akreditasi Sementara:</label> <input type="date" name="akreditasiSementara">
                <label>Senat:</label> <input type="date" name="senat">
                <label>LPU:</label> <input type="date" name="lpu">
            </td>
        </tr>
        <tr>
            <td>Upload Document</td>
            <td><input type="file" name="document"></td>
        </tr>
    </table>
    <input type="submit" value="Submit" name="Save">

</form>

</body>
</html>

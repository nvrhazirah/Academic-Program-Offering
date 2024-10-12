<%-- 
    Document   : proposal
    Created on : 31 May 2024, 10:09:40 pm
    Author     : Arifah S66428
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <link rel="stylesheet" href="index.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>UMT Academic Program Development Tracking System</title>
    <style>
        body {

            background-color: #f0f0f0;
            margin: 0;
            padding-top: 200px;
        }
        .container {
            width: 80%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .header1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .header1 h1 {
            margin: 0;
            font-size: 24px;
        }
        .header1 h2 {
            margin: 0;
            font-size: 18px;
            color: #555;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
        }
        select, input[type="text"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .table1 {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .table1, .th1, .td1 {
            border: 1px solid #ddd;
        }
        .th1, .td1 {
            padding: 10px;
            text-align: center;
        }
        .upload-container {
            position: relative;
            width: 100px;
            height: 30px;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: inline-block;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            text-align: center;
            line-height: 30px;
            margin-top: 10px; /* Ensure vertical spacing */
        }
        .upload-container input[type="file"] {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
        .upload-wrapper {
            display: flex;
            flex-direction: column; /* Ensure vertical stacking of elements */
            align-items: center; /* Center align items horizontally */
        }
        .note {
            color: red;
            font-size: 12px;
            text-align: center;
            margin-top: 10px;
        }
        .buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .buttons input {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        .buttons input[type="reset"] {
            background-color: #6c757d;
        }
        
        .table1 {
            width: 100%;
            border-collapse: collapse;
        }
        .th1, .td1 {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        .th1 {
            background-color: #f2f2f2;
            text-align: center;
        }
        
    </style>
     <div class="header">
    <header>
      <table>
        <tr>
          <td><img class="logoumt" src="https://upload.wikimedia.org/wikipedia/commons/3/3e/Logo_Rasmi_UMT.png"></td>
          <td><h1>UMT Academic Program Development Tracking System</h1></td>
        </tr>
      </table>
    </header>
  </div>

  <!-- navigation bar -->
  <div class="navbar">
  <ul class="navlist">
    <li class="navlistchild"><a href="index.html">Home</a></li>
    <li class="navlistchild"><a href="programlist.html">Program List</a></li>
    <li class="navlistchild"><a href="programlist.html">Contacts</a></li>
    <li class="navlistchild"><div class="dropdown">
          <button class="dropbtn">Manage Application 
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="login.html">Internal Application</a>
            <a href="/task2/task2.html">Provisional Accreditation</a>
            <a href="/task2/task2upgraded.html">Program Offering</a>
            <a href="module4.html">Full Accreditation</a>
            <a href="module5.html">MQA Certification</a>
          </div>
        </div>
    </li>
    <!-- notification icon and profile to view profile or logout-->
    <li class="housekeeping">
      <img class="iconNoti" src="https://static-00.iconduck.com/assets.00/notification-icon-2047x2048-qbq87wz5.png">
      <img class="iconProfile" src="https://static.vecteezy.com/system/resources/previews/019/879/186/original/user-icon-on-transparent-background-free-png.png">
      <div class="dropdown">
        <button class="dropbtn">Profile 
          <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
          <a href="Login.jsp">Logout</a>
        </div>
      </div>
  </ul>
  </div>
    <div class="container">
        <div class="header1">
            <h1>PROGRAM OFFERING</h1>
            <h2>KERTAS CADANGAN PERMOHONAN PROGRAM AKADEMIK BAHARU UNTUK MESYUARAT JAWATANKUASA PENDIDIKAN TINGGI (JKPT)</h2>
        </div>
        <form action="podoController" method="post" enctype="multipart/form-data">
            <label for="progCode">Program Code:</label>
            <input type="text" id="progCode" name="progCode">
            
            <label for="namaProgram">Nama Program:</label>
            <input type="text" id="namaProgram" name="namaProgram">
            
            <label for="fakulti">Fakulti:</label>
                    <select id="fakulti" name="fakulti" required>
                    <option value="">--Pilih Fakulti--</option>
                  <  <option value="Fakulti Sains & Sekitaran Marin">Fakulti Sains & Sekitaran Marin</option>
                    <option value="Fakulti Sains Komputer dan Matematik">Fakulti Sains Komputer dan Matematik</option>
                    <option value="Fakulti Teknologi Kejuruteraan Kelautan">Fakulti Teknologi Kejuruteraan Kelautan</option>
                    <option value="Fakulti Perikanan & Sains Makanan">Fakulti Perikanan & Sains Makanan</option>
                    <option value="Fakulti Perniagaan, Ekonomi & Pembangunan Sosial">Fakulti Perniagaan, Ekonomi & Pembangunan Sosial</option>
                    <option value="Fakulti Pengajian Maritim">Fakulti Pengajian Maritim</option>
                </select>
            
                
            <table class="table1">
                <tr class="tr1">
                <th class="th1">PERKARA</th>
                <th class="th1">DOKUMEN</th>
            </tr>
            <tr class="tr1">
                <td class="td1">
                    <input type="checkbox" name="perkara" value="Universiti Awam"> UNIVERSITI AWAM<br>
                    <input type="checkbox" name="perkara" value="Tujuan"> TUJUAN<br>
                    <input type="checkbox" name="perkara" value="Visi Misi & Matlamat Pendidikan Universiti"> VISI MISI & MATLAMAT PENDIDIKAN UNIVERSITI<br>
                    <input type="checkbox" name="perkara" value="Bidang Tinjauan Universiti"> BIDANG TINJAUAN UNIVERSITI<br>
                    <input type="checkbox" name="perkara" value="Entiti Akademik Yang Memohon"> ENTITI AKADEMIK YANG MEMOHON<br>
                    <input type="checkbox" name="perkara" value="Lokasi Penawaran"> LOKASI PENAWARAN<br>
                    <input type="checkbox" name="perkara" value="Program Akademik Yang Dipohon"> PROGRAM AKADEMIK YANG DIPOHON<br>
                    <input type="checkbox" name="perkara" value="Tahap Kerangka Kelayakan Malaysia (MQF)"> TAHAP KERANGKA KELAYAKAN MALAYSIA (MQF)<br>
                    <input type="checkbox" name="perkara" value="National Education Code (NEC)"> NATIONAL EDUCATION CODE (NEC)<br>
                    <input type="checkbox" name="perkara" value="Pengikhtirafan Badan Profesional"> PENGIKHTIRAFAN BADAN PROFESIONAL<br>        
                    <input type="checkbox" name="perkara" value="Institusi Organisasi Kerjasama"> INSTITUSI ORGANISASI KERJASAMA<br>
                    <input type="checkbox" name="perkara" value="Sesi Pengajian Program Akademik Dimulakan"> SESI PENGAJIAN PROGRAM AKADEMIK DIMULAKAN<br>
                    <input type="checkbox" name="perkara" value="Mod Penawaran"> MOD PENAWARAN<br>
                    <input type="checkbox" name="perkara" value="Kredit Bergraduat"> KREDIT BERGRADUAT<br>
                    <input type="checkbox" name="perkara" value="Kaedah Dan Tempoh Pengajian"> KAEDAH DAN TEMPOH PENGAJIAN<br>
                    <input type="checkbox" name="perkara" value="Kaedah Penyampaian Program"> KAEDAH PENYAMPAIAN PROGRAM<br>
                    <input type="checkbox" name="perkara" value="Justifikasi Mengadakan Program Akademik"> JUSTIFIKASI MENGADAKAN PROGRAM AKADEMIK<br>
                    <input type="checkbox" name="perkara" value="Kelestarian Program"> KELESTARIAN PROGRAM<br>
                    <input type="checkbox" name="perkara" value="Objektif Pendidikan Program"> OBJEKTIF PENDIDIKAN PROGRAM<br>
                    <input type="checkbox" name="perkara" value="Hasil Pembelajaran Program"> HASIL PEMBELAJARAN PROGRAM<br>
                    <input type="checkbox" name="perkara" value="Struktur Kurikulum"> STRUKTUR KURIKULUM<br>
                    <input type="checkbox" name="perkara" value="Unjuran Pelajar"> UNJURAN PELAJAR<br>
                    <input type="checkbox" name="perkara" value="Syarat Kemasukan"> SYARAT KEMASUKAN<br>
                    <input type="checkbox" name="perkara" value="Permohonan Program Akademik Yang Dipohon Dengan Universiti Lain Dalam Negara/Pertindihan Program"> PERMOHONAN PROGRAM AKADEMIK YANG DIPOHON DENGAN UNIVERSITI LAIN DALAM NEGARA/PERTINDIHAN PROGRAM<br>
                    <input type="checkbox" name="perkara" value="Perbandingan Dengan Program Akademik Di Universiti Luar Negara"> PERBANDINGAN DENGAN PROGRAM AKADEMIK DI UNIVERSITI LUAR NEGARA<br>
                    <input type="checkbox" name="perkara" value="Implikasi Perjawatan Fizikal Dan Kewangan"> IMPLIKASI PERJAWATAN FIZIKAL DAN KEWANGAN<br>
                    <input type="checkbox" name="perkara" value="Perjumudan Pembekuan Pelupusan Program"> PERJUMUDAN PEMBEKUAN PELUPUSAN PROGRAM<br>
                    <input type="checkbox" name="perkara" value="Kos Pelaksanaan Program"> KOS PELAKSANAAN PROGRAM<br>
                    <input type="checkbox" name="perkara" value="Keahlian Jawatankuasa Pengajian Fakulti Program (Board of Studies)"> KEAHLIAN JAWATANKUASA PENGAJIAN FAKULTI PROGRAM (BOARD OF STUDIES)<br>
                    <input type="checkbox" name="perkara" value="Tarikh Program Akademik Diluluskan"> TARIKH PROGRAM AKADEMIK DILULUSKAN<br>

                </td>
                <td class="td1">
                    <input type="file" name="dokumen"><br>
                </td>
                
            </tr>
            
        </table>
            <input type="hidden" name="action" value="insert">
            
            <div class="note">
            NOTA: <a href="https://ebook.um.edu.my/ASPC/Garis_Panduan_Pembangunan_Program_Akademik_Universiti_Awam_Edisi_Kedua/mobile/index.html#p=66" target="_blank">Link ini memberikan keterangan lebih lanjut setiap perkara yang ingin di upload</a>
            </div>
            
            <div class="buttons">
                <input type="submit" value="Submit">
                <input type="reset" value="Reset">
                
            </div>
        </form>
        
    </div>
  <div class="footer">
  <footer>&copy; Pusat Pengurusan dan Penjaminan Kualiti UMT 2024</footer>
  </div>
          <script src="js/script1.js"></script>
        <script src="js/script2.js"></script>
</body>
</html>

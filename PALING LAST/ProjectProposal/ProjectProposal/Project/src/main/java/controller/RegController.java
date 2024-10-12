package controller;

import DAO.RegDAO;
import model.Regdoc;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.RequestDispatcher;
import java.text.ParseException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Meeting;
import model.Podoc;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class RegController extends HttpServlet {

    private static String INSERT = "/register.jsp";
    private static String EDIT = "/editReg.jsp";
    private static String LIST = "/displayReg.jsp";
    private RegDAO dao;
    
    public RegController() throws ClassNotFoundException{
        super();
        dao = new RegDAO();
        regDAO = new RegDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String forward = "";
         String action = request.getParameter("action");
         
         try{
             if(action != null){
                if(action.equalsIgnoreCase("delete")){
                    String id = request.getParameter("id");
                    dao.delete(id);
                    forward = LIST;
                    request.setAttribute("registrations", dao.getAll());
                }
                else if (action.equalsIgnoreCase("edit")){
                    forward = EDIT;
                    String id = request.getParameter("id");
                    Regdoc regdoc = dao.getRegDogByCode(id);
                    request.setAttribute("regdoc", regdoc);
                    request.getRequestDispatcher(EDIT).forward(request, response);
                }
                else if (action.equalsIgnoreCase("display")){
                    forward = LIST;
                    request.setAttribute("registrations", dao.getAll());
                }

                else if (action.equalsIgnoreCase("insert")){
                    forward = INSERT;
                }
             }
             
             request.setAttribute("registrations", dao.getAll());
         } catch (SQLException e){
             e.printStackTrace();
         }
         
         RequestDispatcher view = request.getRequestDispatcher(forward);
         view.forward(request, response);
    }
    
    private static final String UPLOAD_DIR = "uploads";
    private RegDAO regDAO;

    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        // Retrieve form parameters
        String programAkademik = request.getParameter("programAkademik");
        String entitiAkademik = request.getParameter("entitiAkademik");
        String jamKredit = request.getParameter("jamKredit");
        String tahapMQF = request.getParameter("tahapMQF");
        String kaedahPenawaran = request.getParameter("kaedahPenawaran");
        String bidangNEC = request.getParameter("bidangNEC");
        String tempohPengajian = request.getParameter("tempohPengajian");
        String tempohMinimum = request.getParameter("tempohMinimum");
        String tempohMaksimum = request.getParameter("tempohMaksimum");
        String tahunSesiPenawaran = request.getParameter("tahunSesiPenawaran");
        String implikasiKakitangan = request.getParameter("implikasiKakitangan");
        String implikasiKewangan = request.getParameter("implikasiKewangan");
        String implikasiFizikal = request.getParameter("implikasiFizikal");

        // Parse date fields
        Date kelulusanKPT = Date.valueOf(request.getParameter("kelulusanKPT"));
        Date akreditasiSementara = Date.valueOf(request.getParameter("akreditasiSementara"));
        Date senat = Date.valueOf(request.getParameter("senat"));
        Date lpu = Date.valueOf(request.getParameter("lpu"));

        // Handle file upload
        Part filePart = request.getPart("document");
        String fileName = getFileName(filePart);
        String applicationPath = getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String filePath = uploadFilePath + File.separator + fileName;
        filePart.write(filePath);

        // Create and set the Regdoc object
        Regdoc regdoc = new Regdoc();
        
        regdoc.setProgramAkademik(programAkademik);
        regdoc.setEntitiAkademik(entitiAkademik);
        regdoc.setJamKredit(jamKredit);
        regdoc.setTahapMQF(tahapMQF);
        regdoc.setKaedahPenawaran(kaedahPenawaran);
        regdoc.setBidangNEC(bidangNEC);
        regdoc.setTempohPengajian(tempohPengajian);
        regdoc.setTempohMinimum(tempohMinimum);
        regdoc.setTempohMaksimum(tempohMaksimum);
        regdoc.setTahunSesiPenawaran(tahunSesiPenawaran);
        regdoc.setImplikasiKakitangan(implikasiKakitangan);
        regdoc.setImplikasiKewangan(implikasiKewangan);
        regdoc.setImplikasiFizikal(implikasiFizikal);
        regdoc.setKelulusanKPT(kelulusanKPT);
        regdoc.setAkreditasiSementara(akreditasiSementara);
        regdoc.setSenat(senat);
        regdoc.setLpu(lpu);
        regdoc.setDocumentPath(UPLOAD_DIR + "/" + fileName);

        try {
            if(action.equalsIgnoreCase("edit")){
                dao.updateRegdoc(regdoc);
            }
            else if(action.equalsIgnoreCase("insert")){
                regDAO.save(regdoc);
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(LIST);
            request.setAttribute("registrations", dao.getAll());
             dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}

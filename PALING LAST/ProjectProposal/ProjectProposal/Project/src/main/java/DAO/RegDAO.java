/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import database.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Regdoc;

public class RegDAO {
    private Connection connection;

    public RegDAO() throws ClassNotFoundException{
        connection = DBConnection.getConnection();
    }

    public void save(Regdoc regdoc) throws SQLException {
        String sql = "INSERT INTO registrations (programAkademik, entitiAkademik, jamKredit, tahapMQF, kaedahPenawaran, bidangNEC, tempohPengajian, tempohMinimum, tempohMaksimum, tahunSesiPenawaran, implikasiKakitangan, implikasiKewangan, implikasiFizikal, kelulusanKPT, akreditasiSementara, senat, lpu, documentPath) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, regdoc.getProgramAkademik());
            ps.setString(2, regdoc.getEntitiAkademik());
            ps.setString(3, regdoc.getJamKredit());
            ps.setString(4, regdoc.getTahapMQF());
            ps.setString(5, regdoc.getKaedahPenawaran());
            ps.setString(6, regdoc.getBidangNEC());
            ps.setString(7, regdoc.getTempohPengajian());
            ps.setString(8, regdoc.getTempohMinimum());
            ps.setString(9, regdoc.getTempohMaksimum());
            ps.setString(10, regdoc.getTahunSesiPenawaran());
            ps.setString(11, regdoc.getImplikasiKakitangan());
            ps.setString(12, regdoc.getImplikasiKewangan());
            ps.setString(13, regdoc.getImplikasiFizikal());
            ps.setDate(14, regdoc.getKelulusanKPT());
            ps.setDate(15, regdoc.getAkreditasiSementara());
            ps.setDate(16, regdoc.getSenat());
            ps.setDate(17, regdoc.getLpu());
            ps.setString(18, regdoc.getDocumentPath());
            ps.executeUpdate();
        }
    }

    public List<Regdoc> getAll() throws SQLException {
        List<Regdoc> regdocs = new ArrayList<>();
        String sql = "SELECT * FROM registrations";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Regdoc regdoc = new Regdoc();
                int id = rs.getInt("id");
                regdoc.setId(id);
                regdoc.setProgramAkademik(rs.getString("programAkademik"));
                regdoc.setEntitiAkademik(rs.getString("entitiAkademik"));
                regdoc.setJamKredit(rs.getString("jamKredit"));
                regdoc.setTahapMQF(rs.getString("tahapMQF"));
                regdoc.setKaedahPenawaran(rs.getString("kaedahPenawaran"));
                regdoc.setBidangNEC(rs.getString("bidangNEC"));
                regdoc.setTempohPengajian(rs.getString("tempohPengajian"));
                regdoc.setTempohMinimum(rs.getString("tempohMinimum"));
                regdoc.setTempohMaksimum(rs.getString("tempohMaksimum"));
                regdoc.setTahunSesiPenawaran(rs.getString("tahunSesiPenawaran"));
                regdoc.setImplikasiKakitangan(rs.getString("implikasiKakitangan"));
                regdoc.setImplikasiKewangan(rs.getString("implikasiKewangan"));
                regdoc.setImplikasiFizikal(rs.getString("implikasiFizikal"));
                regdoc.setKelulusanKPT(rs.getDate("kelulusanKPT"));
                regdoc.setAkreditasiSementara(rs.getDate("akreditasiSementara"));
                regdoc.setSenat(rs.getDate("senat"));
                regdoc.setLpu(rs.getDate("lpu"));
                regdoc.setDocumentPath(rs.getString("documentPath"));
                regdocs.add(regdoc);
            }
        }
        return regdocs;
    }
    
    public Regdoc getRegDogByCode(String id){
        Regdoc regdoc = new Regdoc();
        try{
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM registrations where id = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                regdoc.setId(rs.getInt("id"));
                regdoc.setProgramAkademik(rs.getString("programAkademik"));
                regdoc.setEntitiAkademik(rs.getString("entitiAkademik"));
                regdoc.setJamKredit(rs.getString("jamKredit"));
                regdoc.setTahapMQF(rs.getString("tahapMQF"));
                regdoc.setKaedahPenawaran(rs.getString("kaedahPenawaran"));
                regdoc.setBidangNEC(rs.getString("bidangNEC"));
                regdoc.setTempohPengajian(rs.getString("tempohPengajian"));
                regdoc.setTempohMinimum(rs.getString("tempohMinimum"));
                regdoc.setTempohMaksimum(rs.getString("tempohMaksimum"));
                regdoc.setTahunSesiPenawaran(rs.getString("tahunSesiPenawaran"));
                regdoc.setImplikasiKakitangan(rs.getString("implikasiKakitangan"));
                regdoc.setImplikasiKewangan(rs.getString("implikasiKewangan"));
                regdoc.setImplikasiFizikal(rs.getString("implikasiFizikal"));
                regdoc.setKelulusanKPT(rs.getDate("kelulusanKPT"));
                regdoc.setAkreditasiSementara(rs.getDate("akreditasiSementara"));
                regdoc.setSenat(rs.getDate("senat"));
                regdoc.setLpu(rs.getDate("lpu"));
                regdoc.setDocumentPath(rs.getString("documentPath"));
            } 
        }catch(SQLException e){
                    e.printStackTrace();
          }
        return regdoc;
    }
    
     public void updateRegdoc(Regdoc regdoc){
        
        try{
            PreparedStatement ps = connection.prepareStatement("UPDATE registrations SET entitiAkademik = ?, jamKredit = ?, tahapMQF =?, kaedahPenawaran=?, bidangNEC = ?, tempohPengajian =?, "
                    + "tempohMinimum = ?, tempohMaksimum=?, tahunSesiPenawaran =?, implikasiKakitangan=?,"
                    + "implikasiKewangan =?, implikasiFizikal=?, kelulusanKPT = ?, akreditasiSementara=?, senat=?, lpu=?, documentPath=?  WHERE programAkademik = ?");
            
            
            ps.setString(1, regdoc.getEntitiAkademik());
            ps.setString(2, regdoc.getJamKredit());
            ps.setString(3, regdoc.getTahapMQF());
            ps.setString(4, regdoc.getKaedahPenawaran());
            ps.setString(5, regdoc.getBidangNEC());
            ps.setString(6, regdoc.getTempohPengajian());
            ps.setString(7, regdoc.getTempohMinimum());
            ps.setString(8, regdoc.getTempohMaksimum());
            ps.setString(9, regdoc.getTahunSesiPenawaran());
            ps.setString(10, regdoc.getImplikasiKakitangan());
            ps.setString(11, regdoc.getImplikasiKewangan());
            ps.setString(12, regdoc.getImplikasiFizikal());
            ps.setDate(13, regdoc.getKelulusanKPT());
            ps.setDate(14, regdoc.getAkreditasiSementara());
            ps.setDate(15, regdoc.getSenat());
            ps.setDate(16, regdoc.getLpu());
            ps.setString(17, regdoc.getDocumentPath());
            ps.setString(18, regdoc.getProgramAkademik());
            
            //ps.setInt(19, regdoc.getId());
            
            ps.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void delete(String id) throws SQLException {
        String query = "DELETE FROM registrations WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, id);
            stmt.executeUpdate();
        }
    }
}

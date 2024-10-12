/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.DBConnection;
import java.util.ArrayList;
import java.util.List;
import model.Podoc;

      
public class ProgDAO {
    private Connection conn;
    
    public ProgDAO() throws ClassNotFoundException{
        conn = DBConnection.getConnection();
    }
    
    public void addProg(Podoc podoc){
        try{
        PreparedStatement ps = conn.prepareStatement("INSERT INTO podoc (progCode, progName, faculty, filename, path) VALUES (?,?,?,?,?)");
        
        ps.setString(1, podoc.getProgCode());
        ps.setString(2, podoc.getProgName());
        ps.setString(3, podoc.getFaculty());
        ps.setString(4, podoc.getFilename()); 
        ps.setString(5, podoc.getPath());
        
        ps.executeUpdate();
  
    }
        catch(SQLException e){
            e.printStackTrace();
        }      
}
    public List<Podoc> getAllProgs() throws SQLException{
        List <Podoc> podocList = new ArrayList<>();
        
        try{
             Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM podoc");
            while (rs.next()){
                 Podoc podoc = new Podoc();
                 podoc.setProgCode(rs.getString("progCode"));
                 podoc.setProgName(rs.getString("progName"));
                 podoc.setFaculty(rs.getString("faculty"));
                 podoc.setFilename(rs.getString("filename"));
                 podoc.setPath(rs.getString("path"));
                 podocList.add(podoc);
            }
  
            
        }catch(SQLException e){
            e.printStackTrace();
        }
   
        return podocList;
    }
    
    public Podoc getProgByCode(String progCode){
        Podoc podoc = new Podoc();
        try{
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM podoc WHERE progCode =?");
            ps.setString(1, progCode);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                podoc.setProgCode(rs.getString("progCode"));
                 podoc.setProgName(rs.getString("progName"));
                 podoc.setFaculty(rs.getString("faculty"));
                 podoc.setFilename(rs.getString("filename"));
                 podoc.setPath(rs.getString("path"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return podoc;
    }
    
    public void updateProg(Podoc podoc){
        
        try{
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE podoc SET progName = ?, faculty = ?, filename =?, path=? WHERE progCode = ?");
            
            preparedStatement.setString(1, podoc.getProgName());
            preparedStatement.setString(2, podoc.getFaculty());
            preparedStatement.setString(3, podoc.getFilename());
            preparedStatement.setString(4, podoc.getPath());
            preparedStatement.setString(5, podoc.getProgCode());
            
            preparedStatement.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void deleteProg(String progCode){
        try{
            PreparedStatement ps = conn.prepareStatement("DELETE FROM podoc WHERE progCode = ?");
            ps.setString(1, progCode);
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    
}
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
import model.User;


public class UserDAO {
    private Connection conn;
    
    public UserDAO() throws ClassNotFoundException{
        conn = DBConnection.getConnection();
    }
    
    public void saveUser(User user){
        try{
            PreparedStatement ps = conn.prepareStatement("INSERT INTO user (name, email, usertype, password) VALUE (?,?,?,?)");
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUsertype());
            ps.setString(4, user.getPassword());
            ps.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public String validateUser(String email, String password){
        String usertype = null;
        try{
            PreparedStatement ps = conn.prepareStatement("SELECT usertype FROM User WHERE email = ? AND password = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                usertype = rs.getString("usertype");
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return usertype;
    }
}

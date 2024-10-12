/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author zira
 */


import model.Meeting;
import database.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MeetingDAO {

    private Connection connection;
    

    public MeetingDAO() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
        
      //  java.sql.Date sql;date = new java.sql.Date(date.getTime());
    }

    public void addMeeting(Meeting meeting) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO meetings(programCode, progName, faculty, meetingType, date, time, venue, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, meeting.getProgramCode());
            preparedStatement.setString(2, meeting.getProgName());
            preparedStatement.setString(3, meeting.getFaculty());
            preparedStatement.setString(4, meeting.getMeetingType());
            preparedStatement.setDate(5, meeting.getDate());
            preparedStatement.setTime(6, meeting.getTime());
            preparedStatement.setString(7, meeting.getVenue());
            preparedStatement.setString(8, meeting.getStatus());
            
            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new meeting was inserted successfully!");
            }
        } catch (SQLException e) {
            // Log the exception or handle it appropriately
            e.printStackTrace();
        }
    }

    public void deleteMeeting(String id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM meetings WHERE meetingid=?");
            preparedStatement.setString(1, id);
            
            int rowsDeleted = preparedStatement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Meeting with programCode=" + id + " was deleted successfully!");
            }
        } catch (SQLException e) {
            // Log the exception or handle it appropriately
            e.printStackTrace();
        }
    }

    public void editMeeting(Meeting meeting) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE meetings SET progName=?, faculty=?, meetingType=?, date=?, time=?, venue=?, status=? WHERE programCode=?");
            preparedStatement.setString(1, meeting.getProgName());
            preparedStatement.setString(2, meeting.getFaculty());
            preparedStatement.setString(3, meeting.getMeetingType());
            preparedStatement.setDate(4, meeting.getDate());
            preparedStatement.setTime(5, meeting.getTime());
            preparedStatement.setString(6, meeting.getVenue());
            preparedStatement.setString(7, meeting.getStatus());
            preparedStatement.setString(8, meeting.getProgramCode());
            
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Meeting with programCode=" + meeting.getProgramCode() + " was updated successfully!");
            }
        } catch (SQLException e) {
            // Log the exception or handle it appropriately
            e.printStackTrace();
        }
    }

    public List<Meeting> getAllMeetings() {
        List<Meeting> meetings = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM meetings");
            while (rs.next()) {
                Meeting meeting = new Meeting();
                int meetingid = rs.getInt("meetingid");
                meeting.setMeetingid(meetingid);
                
                meeting.setProgramCode(rs.getString("programCode"));
                meeting.setProgName(rs.getString("progName"));
                meeting.setFaculty(rs.getString("faculty"));
                meeting.setMeetingType(rs.getString("meetingType"));
                meeting.setDate(rs.getDate("date"));
                meeting.setTime(rs.getTime("time"));
                meeting.setVenue(rs.getString("venue"));
                meeting.setStatus(rs.getString("status"));
                meetings.add(meeting);
            }
        } catch (SQLException e) {
            // Log the exception or handle it appropriately
            e.printStackTrace();
        }
        return meetings;
    }
    
     public List<Meeting> getAllMeetingsType(String type) {
    List<Meeting> meetings = new ArrayList<>();
    String sql = "SELECT * FROM meetings WHERE meetingType = ?";
    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setString(1, type);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            Meeting meeting = new Meeting();
            meeting.setMeetingid(rs.getInt("meetingid"));
            meeting.setProgramCode(rs.getString("programCode"));
            meeting.setProgName(rs.getString("progName"));
            meeting.setFaculty(rs.getString("faculty"));
            meeting.setMeetingType(rs.getString("meetingType"));
            meeting.setDate(rs.getDate("date"));
            meeting.setTime(rs.getTime("time"));
            meeting.setVenue(rs.getString("venue"));
            meeting.setStatus(rs.getString("status"));
            meetings.add(meeting);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return meetings;
}


    public Meeting getMeetingByCode(String meetingid) {
        Meeting meeting = new Meeting();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM meetings WHERE meetingid=?");
            preparedStatement.setString(1, meetingid);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                meeting.setMeetingid(rs.getInt("meetingid"));
                meeting.setProgramCode(rs.getString("programCode"));
                meeting.setProgName(rs.getString("progName"));
                meeting.setFaculty(rs.getString("faculty"));
                meeting.setMeetingType(rs.getString("meetingType"));
                meeting.setDate(rs.getDate("date"));  // Convert to java.sql.Date
                meeting.setTime(rs.getTime("time"));  // Convert to java.sql.Time
                meeting.setVenue(rs.getString("venue"));
                meeting.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            // Log the exception or handle it appropriately
            e.printStackTrace();
        }
        return meeting;
    }
}
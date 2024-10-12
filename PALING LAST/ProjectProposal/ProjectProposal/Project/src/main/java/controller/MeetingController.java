/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.MeetingDAO;
import DAO.ProgDAO;
import model.Meeting;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.Podoc;

@WebServlet(urlPatterns = {"/MeetingControllerServlet"})
public class MeetingController extends HttpServlet {

    private static final String INSERT = "FormMeeting.jsp";
    private static final String EDIT = "EditMeeting.jsp";
    private static final String LISTMEETING = "ListMeeting.jsp";
    private static MeetingDAO dao;
    private static ProgDAO pdao;

    public MeetingController() {
        super();
        try {
            dao = new MeetingDAO();
            pdao = new ProgDAO()                                                                                                                            ;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");
    String forward = LISTMEETING; 

    if (action != null) {
        if (action.equalsIgnoreCase("delete")) {
            String id = request.getParameter("meetingid");
            dao.deleteMeeting(id);
            // Ensure categorizeMeetings is called to update the categorized meetings
            categorizeMeetings(request);
        } else if (action.equalsIgnoreCase("edit")) {
            forward = EDIT;
            String meetingid = request.getParameter("meetingid");
            Meeting meeting = dao.getMeetingByCode(meetingid);
            request.setAttribute("meeting", meeting);
        } else if (action.equalsIgnoreCase("listMeeting")) {
            // Set categorized meetings as request attributes
            categorizeMeetings(request);
        } else if (action.equalsIgnoreCase("insert")) {
            forward = INSERT;

            String progCode = request.getParameter("progCode");
            Podoc podoc = pdao.getProgByCode(progCode);
            if(podoc != null){
                request.setAttribute("progCode", podoc.getProgCode());
                request.setAttribute("progName", podoc.getProgName());
                request.setAttribute("faculty", podoc.getFaculty());
            }
        }
    }

    RequestDispatcher view = request.getRequestDispatcher(forward);
    view.forward(request, response);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");

    Meeting meeting = new Meeting();
    meeting.setProgramCode(request.getParameter("programCode"));
    meeting.setFaculty(request.getParameter("faculty"));
    meeting.setProgName(request.getParameter("progName"));
    meeting.setMeetingType(request.getParameter("meetingType"));
    try {
        Date date = Date.valueOf(request.getParameter("date"));
        meeting.setDate(date);

        String timeStr = request.getParameter("time");
        if (timeStr != null && !timeStr.isEmpty()) {
            Time time = Time.valueOf(timeStr + ":00"); 
            meeting.setTime(time);
            System.out.println("Parsed time: " + time.toString());
        } else {
            System.out.println("Time parameter is empty or null");
        }
    } catch (IllegalArgumentException e) {
        e.printStackTrace();
    }
    meeting.setVenue(request.getParameter("venue"));
    meeting.setStatus(request.getParameter("status"));

    if (action != null) {
        if (action.equalsIgnoreCase("edit")) {
            dao.editMeeting(meeting);
        } else if (action.equalsIgnoreCase("insert")) {
            dao.addMeeting(meeting);
        }
    }

    // Categorize and set meetings as request attributes
    categorizeMeetings(request);

    RequestDispatcher view = request.getRequestDispatcher(LISTMEETING);
    view.forward(request, response);
}

    private void categorizeMeetings(HttpServletRequest request) {
        List<Meeting> meetings = dao.getAllMeetings();

        Map<String, List<Meeting>> categorizedMeetings = meetings.stream()
                .collect(Collectors.groupingBy(Meeting::getMeetingType));

        request.setAttribute("jkaMeetings", categorizedMeetings.getOrDefault("JKA", new ArrayList<>()));
        request.setAttribute("lpuMeetings", categorizedMeetings.getOrDefault("LPU", new ArrayList<>()));
        request.setAttribute("senatMeetings", categorizedMeetings.getOrDefault("Senat", new ArrayList<>()));
    }
}
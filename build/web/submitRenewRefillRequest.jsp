<%-- 
    Document   : submitRenewRefillRequest
    Created on : Apr 21, 2024, 12:17:19 AM
    Author     : Gaurav
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if the user is logged in as a doctor
    boolean isDoctor = (session.getAttribute("userType") != null && session.getAttribute("userType").equals("doctor"));

    // Check if the user is logged in
    boolean isLoggedIn = (session.getAttribute("doctorId") != null || session.getAttribute("patientId") != null);

    // Check if the user is authorized to access this page
    if (!isDoctor || !isLoggedIn) {
        response.sendRedirect("index.jsp"); // Redirect unauthorized users to the login page
    }

    // Process the renewal/refill request
    if (request.getParameter("action") != null && request.getParameter("prescriptionId") != null) {
        String action = request.getParameter("action");
        int prescriptionId = Integer.parseInt(request.getParameter("prescriptionId"));

        // Establish database connection
        Connection con = null;
        try {
            con = DatabaseConnection.initializeDatabase();

            // Update the prescription status based on the action
            String sql = "";
            if (action.equals("approveRenewal")) {
                sql = "UPDATE prescriptions SET status = 'Renewal Approved' WHERE id = ?";
            } else if (action.equals("approveRefill")) {
                sql = "UPDATE prescriptions SET status = 'Refill Approved' WHERE id = ?";
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, prescriptionId);
            int rowsAffected = pstmt.executeUpdate();

            // Redirect back to the renewreq.jsp page
            response.sendRedirect("renewreq.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions
        } finally {
            // Close database connection
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    } else {
        // If action or prescriptionId is missing, redirect to the renewreq.jsp page
        response.sendRedirect("renewreq.jsp");
    }
%>


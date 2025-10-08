<%-- 
    Document   : processPayment
    Created on : Apr 11, 2024, 11:25:12 PM
    Author     : Gaurav
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Processing</title>
    <!-- Add any necessary styles or scripts here -->
</head>
<body>
<%
    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = DatabaseConnection.initializeDatabase();

        String paymentMethod = request.getParameter("paymentMethod");
        String amountString = request.getParameter("amount");

        if (paymentMethod != null && amountString != null) {
            double amount = Double.parseDouble(amountString);

            // Prepare SQL statement to insert payment details
            String sql = "INSERT INTO payments (payment_method, amount, status) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, paymentMethod);
            ps.setDouble(2, amount);
            ps.setString(3, "Paid");

            // Execute the SQL statement
            int rowsAffected = ps.executeUpdate();

            // Check if payment was successfully processed
            if (rowsAffected > 0) {
%>
                <h2>Payment successful!</h2>
                <p>Payment method: <%= paymentMethod %></p>
                <p>Amount: $<%= amount %></p>
<%
            } else {
%>
                <h2>Error processing payment.</h2>
<%
            }
        } else {
%>
            <h2>Error: Payment method or amount is null.</h2>
<%
        }
    } catch (Exception e) {
%>
        <h2>Error processing payment: <%= e.getMessage() %></h2>
<%
    } finally {
        // Close database resources
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            out.println("<h2>Error closing database connection: " + ex.getMessage() + "</h2>");
        }
    }
%>

</body>
</html>

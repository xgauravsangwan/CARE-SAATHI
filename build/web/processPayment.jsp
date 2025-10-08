<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Process Payment</title>
</head>
<body>
    <h1>Payment Details</h1>
    
    <% 
        String paymentMethod = request.getParameter("paymentMethod");
        String amountString = request.getParameter("amount");
        String payerName = request.getParameter("payerName");
        String payerMobile = request.getParameter("payerMobile");

        if (paymentMethod != null && amountString != null && payerName != null && payerMobile != null) {
            try {
                double amount = Double.parseDouble(amountString); // Convert amount to double
                
                try (Connection con = DatabaseConnection.initializeDatabase();
                     PreparedStatement ps = con.prepareStatement("INSERT INTO payments (payment_method, amount, status, payer_name, payer_mobile) VALUES (?, ?, ?, ?, ?)")) {

                    ps.setString(1, paymentMethod);
                    ps.setDouble(2, amount);
                    ps.setString(3, "Paid"); // Payment status
                    ps.setString(4, payerName);
                    ps.setString(5, payerMobile);

                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
    %>
                        <h2>Payment Successful!</h2>
                        <p>Payment method: <%= paymentMethod %></p>
                        <p>Amount: ₹<%= amount %></p>
                        <p>Payer Name: <%= payerName %></p>
                        <p>Payer Mobile: <%= payerMobile %></p>
                        <p><a href="Bill.jsp">Back to Bill Page</a></p> <!-- Link to go back to bill page -->
    <%
                    } else {
    %>
                        <h2>Error processing payment. Please try again.</h2>
    <%
                    }
                } catch (SQLException e) {
    %>
                    <h2>Error processing payment: <%= e.getMessage() %></h2>
    <%
                }
            } catch (NumberFormatException e) {
    %>
                <h2>Error: Invalid amount format. Please enter a valid number.</h2>
    <%
            }
        } else {
    %>
            <h2>Error: Missing payment information. Please try again.</h2>
    <%
        }
    %>
</body>
</html>

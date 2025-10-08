package Controller;

import Database.DatabaseConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PaymentServlet extends HttpServlet {
    private static final String KEY_SECRET = "jHzdwYsNFxJFFdtyxIaDeLxs"; // Your Razorpay Secret Key

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Get Razorpay payment details from the POST request
        String paymentId = request.getParameter("razorpay_payment_id");
        String orderId = request.getParameter("razorpay_order_id");
        String signature = request.getParameter("razorpay_signature");

        // Check if the payment details are available
        if (paymentId == null || orderId == null || signature == null) {
            out.println("<h2>Error: Missing payment details</h2>");
            return;
        }

        // Verify the payment signature
        boolean isVerified = verifyPaymentSignature(paymentId, orderId, signature);

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DatabaseConnection.initializeDatabase(); // Initialize database connection
            con.setAutoCommit(false); // Start transaction

            // Check if the order ID already exists in the database
            String checkQuery = "SELECT payment_status FROM payments WHERE order_id = ?";
            ps = con.prepareStatement(checkQuery);
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // If the order_id exists, update the payment status
                String updateQuery = "UPDATE payments SET payment_status = ?, payment_id = ? WHERE order_id = ?";
                ps = con.prepareStatement(updateQuery);
                if (isVerified) {
                    // Payment is verified, mark it as 'Paid'
                    ps.setString(1, "Paid");
                    ps.setString(2, paymentId);
                } else {
                    // Payment verification failed, mark it as 'Failed'
                    ps.setString(1, "Failed");
                    ps.setString(2, paymentId);
                }
                ps.setString(3, orderId);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<h2>Payment " + (isVerified ? "Successful!" : "Failed!") + "</h2>");
                    out.println("<p>Your payment has been " + (isVerified ? "verified and processed." : "failed.") + "</p>");
                } else {
                    out.println("<h2>Error: Payment details not found in the database.</h2>");
                }
            } else {
                out.println("<h2>Error: Order ID not found in the database.</h2>");
            }

            con.commit(); // Commit the transaction

        } catch (SQLException e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            try {
                if (con != null) con.rollback(); // Rollback transaction on error
            } catch (SQLException ex) {
                out.println("<h2>Error during rollback: " + ex.getMessage() + "</h2>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            // Close database resources
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                out.println("<h2>Error closing database connection: " + ex.getMessage() + "</h2>");
            }
        }
    }

    // Method to verify the payment signature
    private boolean verifyPaymentSignature(String paymentId, String orderId, String signature) {
        try {
            // Razorpay provides a secret key and a payment signature
            String generatedSignature = generateSignature(paymentId, orderId);

            // Compare the generated signature with the one sent by Razorpay
            return signature.equals(generatedSignature);
        } catch (Exception e) {
            return false;
        }
    }

    // Method to generate the signature using Razorpay's secret key
    private String generateSignature(String paymentId, String orderId) throws Exception {
        String data = orderId + "|" + paymentId;
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(KEY_SECRET.getBytes(), "HmacSHA256");
        sha256_HMAC.init(secret_key);
        byte[] hashBytes = sha256_HMAC.doFinal(data.getBytes());
        return bytesToHex(hashBytes); // Convert the byte array to hexadecimal string
    }

    // Method to convert byte array to hexadecimal string
    private String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}

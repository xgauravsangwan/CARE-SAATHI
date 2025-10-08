package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DatabaseConnection;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/Appointment")
public class Appointment extends HttpServlet {
private int i;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        // Retrieve form data
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String doctor = request.getParameter("doctor");
            String patientName = request.getParameter("patient_name");
            String patientRemarks = request.getParameter("patient_remarks");
            String contactNumber = request.getParameter("contact_number");
            String email = request.getParameter("email");
            String age = request.getParameter("age");
            String address = request.getParameter("address");
            String bloodGroup = request.getParameter("blood_group");
            String gender = request.getParameter("gender");
            String previousHealthProblems = request.getParameter("previous_health_problems");

        // Insert appointment data into database
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement pst = con.prepareStatement("INSERT INTO appointments (appointment_id, patient_id, date, time, doctor, patient_name, created_at, patient_remarks, contact_no, email, age, address, blood_group, gender, previous_health_problems) VALUES (null, null, ?, ?, ?, ?, null, ?, ?, ?, ?, ?, ?, ?, ?)");

            // Set parameters for prepared statement
            pst.setString(1, date);
            pst.setString(2, time);
            pst.setString(3, doctor);
            pst.setString(4, patientName);
            pst.setString(5, patientRemarks);
            pst.setString(6, contactNumber);
            pst.setString(7, email);
            pst.setString(8, age);
            pst.setString(9, address);
            pst.setString(10, bloodGroup);
            pst.setString(11, gender);
            pst.setString(12, previousHealthProblems);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                // Appointment scheduled successfully
                // Redirect or forward to a success page
                response.sendRedirect("PatientHome.jsp");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Appointment failed to schedule');");
                // Failed to schedule appointment
                // Redirect or forward to an error page
                response.sendRedirect("error.jsp");
            }
            // Check if the insertion was successful
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Appointment scheduled successfully');");
                pw.println("window.location.href = \"PatientHome.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed to schedule appointment');");
                pw.println("window.location.href = \"appointment.jsp\";");
                pw.println("</script>");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            // Handle database errors
            // Redirect or forward to an error page
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
            //response.sendRedirect("error.jsp");
        }
    }
}
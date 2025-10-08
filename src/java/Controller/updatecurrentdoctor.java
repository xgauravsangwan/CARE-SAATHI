package Controller;

import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatecurrentdoctor")
public class updatecurrentdoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String did = request.getParameter("id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String city = request.getParameter("City");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String date = request.getParameter("date");
        String qualification = request.getParameter("qualification");
        String specialization = request.getParameter("specialization");
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String sql = "update doctor set fname = ?, lname = ?, gender = ?, mobile = ?, city = ?, email = ?, age = ?, address = ?, date = ?, qualification = ?, specialization = ? WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, gender);
            pst.setString(4, mobile);
            pst.setString(5, city);
            pst.setString(6, email);
            pst.setString(7, age);
            pst.setString(8, address);
            pst.setString(9, date);
            pst.setString(10, qualification);
            pst.setString(11, specialization);
            pst.setString(12, did);
            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                // Success message to confirm update
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Appointment updated successfully!');");
                pw.println("window.location.href = 'DoctorHome.jsp';");  // Redirect to Doctor page
                pw.println("</script>");
            } else {
                // Error message if no rows were updated
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed to update the appointment.');");
                pw.println("window.location.href = 'updatecurrentdoctor.jsp';");
                pw.println("</script>");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Display error on the page if an exception occurs
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('An error occurred: " + e.getMessage() + "');");
            pw.println("window.location.href = 'viewallappointment.jsp';");
            pw.println("</script>");
        }
    }
}

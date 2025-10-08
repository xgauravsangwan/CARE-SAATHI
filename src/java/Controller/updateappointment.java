package Controller;
import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAppointment")
public class updateappointment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String appointmentId = request.getParameter("appointment_id");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String doctor = request.getParameter("doctor");
        String remarks = request.getParameter("remarks");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String sql = "UPDATE appointments SET date = ?, time = ?, doctor = ?, patient_remarks = ? WHERE appointment_id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, date);
            pst.setString(2, time);
            pst.setString(3, doctor);
            pst.setString(4, remarks);
            pst.setString(5, appointmentId);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                // Success message to confirm update
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Appointment updated successfully!');");
                pw.println("window.location.href = 'viewallappointment.jsp';");  // Redirect to appointments page
                pw.println("</script>");
            } else {
                // Error message if no rows were updated
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed to update the appointment.');");
                pw.println("window.location.href = 'updateappointment.jsp';");
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

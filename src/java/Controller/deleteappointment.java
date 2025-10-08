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

@WebServlet("/deleteappointment")
public class deleteappointment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
        Connection con = null;

        try {
            con = DatabaseConnection.initializeDatabase();

            // First, delete from the dependent table (addprescriptions)
            String deletePrescriptions = "DELETE FROM addprescriptions WHERE patient_id = (SELECT patient_id FROM appointments WHERE appointment_id = ?)";
            PreparedStatement pst1 = con.prepareStatement(deletePrescriptions);
            pst1.setInt(1, appointmentId);
            pst1.executeUpdate();

            // Now, delete the appointment
            String deleteAppointment = "DELETE FROM appointments WHERE appointment_id = ?";
            PreparedStatement pst2 = con.prepareStatement(deleteAppointment);
            pst2.setInt(1, appointmentId);
            int result = pst2.executeUpdate();

            if (result > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Appointment deleted successfully.');");
                pw.println("window.location.href = 'viewallappointment.jsp';");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed to delete appointment.');");
                pw.println("window.location.href = 'viewallappointment.jsp';");
                pw.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

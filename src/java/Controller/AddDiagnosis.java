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

@WebServlet("/AddDiagnosis")
public class AddDiagnosis extends HttpServlet {
    private int i;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        // Retrieve form data
        String patient_id = request.getParameter("patient_id");
        String disease = request.getParameter("Disease");
        String diagnosedAs = request.getParameter("DiagnosedAs");
        String treatmentAppointed = request.getParameter("TreatmentAppointed");
        String prescriptionGiven = request.getParameter("PrescriptionGiven");
        String testName = request.getParameter("test_name");
        String testDate = request.getParameter("test_date");
        
        // Database connection
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            con = DatabaseConnection.initializeDatabase();
            String query = "INSERT INTO diagnosis (id, patient_id, doctor_id, Disease, DiagnosedAs, TreatmentAppointed, PrescriptionGiven, test_name, test_date) VALUES (null, ?, null, ?, ?, ?, ?, ?, ?)";
            stmt = con.prepareStatement(query);
            stmt.setString(1, patient_id);
            stmt.setString(2, disease);
            stmt.setString(3, diagnosedAs);
            stmt.setString(4, treatmentAppointed);
            stmt.setString(5, prescriptionGiven);
            stmt.setString(6, testName);
            stmt.setString(7, testDate);
            
            // Execute the statement
            i = stmt.executeUpdate();
            // Check if the insertion was successful
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Appointment scheduled successfully');");
                pw.println("window.location.href = \"DoctorHome.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed to schedule appointment');");
                pw.println("window.location.href = \"diagnosis.jsp\";");
                pw.println("</script>");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            // Handle database errors
            // Redirect or forward to an error page
            Logger.getLogger(AddDiagnosis.class.getName()).log(Level.SEVERE, null, ex);
            //response.sendRedirect("error.jsp");
        }
    }
}

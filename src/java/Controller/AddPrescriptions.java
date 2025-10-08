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

@WebServlet("/AddPrescriptions")
public class AddPrescriptions extends HttpServlet {
    private int i;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String patient_id = request.getParameter("patient_id");
        String prescription = request.getParameter("prescription");
        String medication = request.getParameter("medication");
        String therapy = request.getParameter("therapy");
        
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "INSERT INTO addprescriptions (id, patient_id, prescription, medication, therapy, prescription_date) VALUES (null,?,?,?,?,null)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, patient_id);
            stmt.setString(2, prescription);
            stmt.setString(3, medication);
            stmt.setString(4, therapy);
            
            i = stmt.executeUpdate();
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Prescription added successfully');");
                pw.println("window.location.href = \"DoctorHome.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed to prescribe...');");
                pw.println("window.location.href = \"AddPrescriptions.jsp\";");
                pw.println("</script>");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            // Handle database errors
            // Redirect or forward to an error page
            Logger.getLogger(AddPrescriptions.class.getName()).log(Level.SEVERE, null, ex);
            //response.sendRedirect("error.jsp");
        }
    }
}

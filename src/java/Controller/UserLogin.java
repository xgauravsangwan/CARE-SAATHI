package Controller;
import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        try {
            String userType = request.getParameter("userType");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Connection con = DatabaseConnection.initializeDatabase();

            String query = "";
            switch (userType) {
                case "doctor":
                    query = "SELECT * FROM doctor_login WHERE username = '" + username + "' AND password = '" + password + "'";
                    break;
                case "patient":
                    query = "SELECT * FROM patient_login WHERE username = '" + username + "' AND password = '" + password + "'";
                    break;
                case "receptionist":
                    query = "SELECT * FROM login WHERE username = '" + username + "' AND password = '" + password + "'";
                    break;
                default:
                    break;
            }

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            if (rs.next()) {
                // Store user ID in session
                HttpSession session = request.getSession();
                switch (userType) {
                    case "doctor":
                        session.setAttribute("doctorId", rs.getInt("doctor_id"));
                        response.sendRedirect("DoctorHome.jsp");
                        break;
                    case "patient":
                        session.setAttribute("patientId", rs.getInt("patient_id"));
                        // Redirect to the page where you want to display the medical records
                        response.sendRedirect("PatientHome.jsp");
                        break;
                    case "receptionist":
                        session.setAttribute("receptionistId", rs.getInt("receptionist_id"));
                        response.sendRedirect("UserHome.jsp");
                        break;
                    default:
                        break;
                }
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Username or Password is Incorrect..!');");
                pw.println("window.location.href = \"index.jsp\";");
                pw.println("</script>");
            }
        } catch (IOException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

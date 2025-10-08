package Controller;
import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String accountType = request.getParameter("accountType");
            String username = request.getParameter("Username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            // Perform validation and checks (e.g., password matching)
            // Determine the table name based on the account type
            String tableName = "";
            String idColumnName = "";
            switch (accountType) {
                case "doctor":
                    tableName = "doctor_login";
                    idColumnName = "doctor_id";
                    break;
                case "patient":
                    tableName = "patient_login";
                    idColumnName = "patient_id";
                    break;
                case "receptionist":
                    tableName = "login";
                    idColumnName = "receptionist_id";
                    break;
                default:
                    // Handle invalid account type
                    break;
            }
            // Insert data into the corresponding table
            if (!tableName.isEmpty()) {
                // Use PreparedStatement to insert data
                PreparedStatement pst = con.prepareStatement("INSERT INTO " + tableName + " (username, password) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
                pst.setString(1, username);
                pst.setString(2, password);
                int rowsAffected = pst.executeUpdate();
                if (rowsAffected > 0) {
                    // Retrieve the generated ID
                    ResultSet generatedKeys = pst.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int userId = generatedKeys.getInt(1);
                        // Now you have the generated user ID, you can use it as needed
                        // For example, store it in the session for further processing
                        HttpSession session = request.getSession();
                        session.setAttribute("userId", userId);
                    }
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('Registration Successful!');");
                    pw.println("window.location.href = \"index.jsp\";");
                    pw.println("</script>");
                } else {
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('Registration Failed');");
                    pw.println("window.location.href = \"userRegister.jsp\";");
                    pw.println("</script>");
                }
            } else {
                // Handle invalid account type
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Invalid account type');");
                pw.println("window.location.href = \"userRegister.jsp\";");
                pw.println("</script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            e.printStackTrace();
        }
    }
}

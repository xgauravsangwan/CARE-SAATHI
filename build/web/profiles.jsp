<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<div class="container-contact100">
    <div class="wrap-contact100">
        <div class="contact100-form-title" style="background-image: url(img/bg-01.jpg);">
            <span class="contact100-form-title-1">
                Patient Profiles
            </span>				
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Patient ID</th>
                    <th scope="col">Patient Name</th>
                    <th scope="col">Prescription</th>
                    <th scope="col">Diagnosis</th>
                    <th scope="col">Update Prescription</th>
                    <th scope="col">Update Diagnosis</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        Connection con = DatabaseConnection.initializeDatabase();
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM patient_profiles");
                        while (rs.next()) {
                            int patientId = rs.getInt("patient_id");
                            String patientName = rs.getString("patient_name");
                            String prescription = rs.getString("prescription");
                            String diagnosis = rs.getString("diagnosis");
                %>
                <tr>
                    <td><%= patientId %></td>
                    <td><%= patientName %></td>
                    <td><%= prescription %></td>
                    <td><%= diagnosis %></td>
                    <td><a href="updatePrescription.jsp?patient_id=<%= patientId %>">Update</a></td>
                    <td><a href="updateDiagnosis.jsp?patient_id=<%= patientId %>">Update</a></td>
                </tr>
                <% 
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

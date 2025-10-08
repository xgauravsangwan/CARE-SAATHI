<%-- 
    Document   : renewreq
    Created on : Apr 21, 2024, 12:08:35 AM
    Author     : Gaurav
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Establish database connection
    Connection con = null;
    try {
        con = DatabaseConnection.initializeDatabase();
        Statement st = con.createStatement();

        // Retrieve prescriptions for the current patient
        String sql = "SELECT * FROM prescriptions WHERE patient_id = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, (int) session.getAttribute("patientId"));
        ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Request Prescription Renewal/Refill</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/adddataform.css">
    <link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <style>
        body {
            background-image: url("img/CSx.jpg");
            background-color: #cccccc;
        }
        .search-bar {
            width: 60%;
            height: 5%;
            margin-top: 2%;
            margin-left: 100px;
            margin-bottom: 0%;
        }
        .search {
            width: 40%;
            height: 40px;
            border-radius: 10px;
        }
        .text-center {
            color: grey;
            padding: 10px;
            margin-top: 0px;
        }
        input {
            text-align: center;
        }
        ::-webkit-input-placeholder {
            text-align: center;
        }
        :-moz-placeholder {
            text-align: center;
        }
        /* Adjustments for table columns */
        .column5 { width: 6%; }
        .column6 { width: 13%; }
        .column7 { width: 13%; }
        .column8 { width: 12%; }
        .column9 { width: 12%; }
        .column10 { width: 12%; }
        .column11 { width: 13%; }
        .column12 { width: 15%; }
        .column13 { width: 17%; }
        /* Responsive table styles */
        .table100 {
            width: 100%;
            max-width: 1200px; /* Adjust as needed */
        }
        .cell100 {
            font-size: 14px; /* Adjust as needed */
            line-height: 1.2; /* Adjust as needed */
            word-wrap: break-word;
            text-overflow: ellipsis;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="#" class="navbar-brand">
        <img src="img/CS_Logo.jpg" height="100" width="100" alt="CARE-SAATHI">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    APPOINTMENT
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="appointment.jsp">Schedule Appointment</a>
                    <a class="dropdown-item" href="viewappointment.jsp">View Appointment</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    MEDICAL & HISTORY RECORDS
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="accessmedicalrecords.jsp">Access Personal Medical Records</a>
                    <a class="dropdown-item" href="viewdiagnoses.jsp">View Past Diagnoses and Treatments</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    PRESCRIPTION MANAGEMENT
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="prescription.jsp">View current prescriptions</a>
                    <a class="dropdown-item" href="renewreq.jsp">Order refills and renew prescriptions</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    LAB RESULTS
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="lab_results.jsp">View lab results</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="dropdown" style="float: right; margin-right: 20px;">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Checkpoint Home
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="javascript:history.back()">Back</a>
            <a class="dropdown-item" href="PatientHome.jsp">Back to Base</a>
        </div>
    </div>
</nav>
    <h1>Request Prescription Renewal/Refill</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Prescription ID</th>
                <th>Prescription Text</th>
                <th>Date Created</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("prescription_text") %></td>
                <td><%= rs.getTimestamp("date_created") %></td>
                <td>
                    <!-- Form for renewal/refill request -->
                    <form action="submitRenewRefillRequest.jsp" method="post">
                        <input type="hidden" name="prescriptionId" value="<%= rs.getInt("id") %>">
                        <input type="submit" name="action" value="Request Renewal">
                        <input type="submit" name="action" value="Request Refill">
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database connection
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>

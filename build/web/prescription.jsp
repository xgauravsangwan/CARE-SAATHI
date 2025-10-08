<%-- 
    Document   : prescription
    Created on : Apr 20, 2024, 11:47:39 PM
    Author     : Gaurav
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Current Prescriptions</title>
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
        .column1 { width: 6%; }
        .column2 { width: 7%; }
        .column3 { width: 13%; }
        .column4 { width: 13%; }
        .column5 { width: 13%; }
        .column6 { width: 12%; }
        .column7 { width: 13%; }
        /* Responsive table styles */
        
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
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    PRESCRIPTION MANAGEMENT
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="prescription.jsp">View current prescriptions</a>
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

<div class="search-bar">
    <form action="" method="post">
        <input class="search" type="text" name="search" placeholder="Search Here..."/>
    </form>
</div>

<%
    Connection con = null;
    
    // Retrieve patientId from session
    
     int patientId = (int) session.getAttribute("patientId");
%>

<div class="container-table100">
    <div class="wrap-table100">
        <div class="table100 ver3 m-b-110">
            <div class="table100-head">
                <table>
                    <thead>
                    <tr class="row100 head">
                        <th class="cell100 column1">ID</th>
                        <th class="cell100 column2">Patient ID</th>
                        
                        <th class="cell100 column3">Prescription</th>
                        <th class="cell100 column4">Medication</th>
                        <th class="cell100 column5">Therapy</th>
                        <th class="cell100 column6">Date</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="table100-body js-pscroll">
                <table>
                    <tbody>
                    <%
                        try {
                            con = DatabaseConnection.initializeDatabase();
                            Statement st = con.createStatement();
                            String sql = "SELECT * FROM addprescriptions WHERE patient_id = " + patientId;
                            //String query = request.getParameter("search");
                           // if (query != null) {
                                    //sql = "select * from addprescriptions where fname like '%" + query + "%' or lname like '%" + query + "%' ";
                               // } else {
                                 //   sql = "select * from addprescriptions";
                              //  }
                            ResultSet rs = st.executeQuery(sql);
                            while (rs.next()) {
                    %>
                    <tr class="row100 body">
                        <td class="cell100 column1"><%=rs.getString(1)%></td>
                        <td class="cell100 column2"><%=rs.getString(2)%></td>
                        <td class="cell100 column3"><%=rs.getString(3)%></td>
                        <td class="cell100 column4"><%=rs.getString(4)%></td>
                        <td class="cell100 column5"><%=rs.getString(5)%></td>
                        <td class="cell100 column5"><%=rs.getString(6)%></td>
                        
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
    </div>
</div>
</body>
</html>

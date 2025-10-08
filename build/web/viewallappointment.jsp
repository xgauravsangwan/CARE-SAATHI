<%-- 
    Document   : viewallappointment
    Created on : Apr 21, 2024, 2:04:48 AM
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
    <title>View All Appointments</title>
    <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script
        src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/adddataform.css">
        <link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
        <link rel="stylesheet" type="text/css" href="css/table.css">
    <style>
        body {
            background-image: url("img/CSx.jpg");
            background-color: #cccccc;
        }
        .serchbar
        {
            width: 60%;
            height: 5%;
            margin-top:2%;
            margin-left: 100px;
            margin-bottom: 0%;
        }
        .search
        {
            width: 40%;
            height: 40px;
            border-radius: 10px;
        }
        .text-center{
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
            .column1 { width: 10%; }
            .column2 { width: 13%; }
            .column3 { width: 12%; }
            .column4 { width: 12%; }
            .column5 { width: 17%; }
            .column6 { width: 12%; }
            .column7 { width: 12%; }
            .column8 { width: 17%; }            
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="#" class="navbar-brand"> <img src="img/CS_Logo.jpg"
                                           height="100" width="100" alt="CARE-SAATHI">
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
                   PERSONAL INFORMATION UPDATION 
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="CurrentDoctor.jsp">Update Doctor Information</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    MEDICAL RECORDS & DIAGNOSIS
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="doctor_medical_records.jsp">Access Personal Medical Records</a>
                    <a class="dropdown-item" href="diagnosis.jsp">Give Diagnosis and Treatments</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    APPOINTMENT MANAGEMENT
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="viewallappointment.jsp">View,Schedule,Reschedule or Cancel Appointments</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    TREATMENT PLANS
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="prescriptions.jsp">Prescribe Here</a>
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
            <a class="dropdown-item" href="DoctorHome.jsp">Back to Base</a>
        </div>
    </div>
</nav>

<div class="serchbar">
    <form action=" " method="post">
        <input class="search" type="text" name="search" placeholder="Search Here..."/>
    </form>
</div>
<%
    Connection con = null;
    int doctorId = (int) session.getAttribute("doctorId");
%>
<div>
    <div class="container-table100">
        <div class="wrap-table100">
            <div class="table100 ver3 m-b-110">
                <div class="table100-head">
                    <table>
                        <thead>
                            <tr class="row100 head">
                                <th class="cell100 column1">Date</th>
                                <th class="cell100 column2">Time</th>
                                <th class="cell100 column3">Doctor</th>
                                <th class="cell100 column4">Patient</th>
                                <th class="cell100 column5">Patient Remarks</th>                            
                                <th class="cell100 column6">Gender</th>
                                <th class="cell100 column6">Blood Group</th>
                                <th class="cell100 column8">Actions</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <%
                    try {
                        con = DatabaseConnection.initializeDatabase();
                        Statement st = (Statement) con.createStatement();
                        String sql = " ";
                        String query = request.getParameter("search");
                            if (query != null) {
                            sql = "SELECT * FROM appointments WHERE doctor_id = " + doctorId;
                            } else {
                                sql = "SELECT * FROM appointments WHERE doctor_id = " + doctorId;
                            }
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {
                %>
                <div class="table100-body js-pscroll">
                    <table>
                        <tbody>
                            <tr class="row100 body">
                                <form action="<%=request.getContextPath()%>/UpdateAppointment" method="post">
                                    <input type="hidden" name="appointment_id" value="<%=rs.getInt("appointment_id")%>">
                                    <td class="cell100 column1"><%=rs.getString("date")%></td>
                                    <td class="cell100 column2"><%=rs.getString("time")%></td>
                                    <td class="cell100 column3"><%=rs.getString(5)%></td>
                                    <td class="cell100 column4"><%=rs.getString("patient_name")%></td>
                                    <td class="cell100 column5"><%=rs.getString(8)%></td>
                                    <td class="cell100 column6"><%=rs.getString("gender")%></td>
                                    <td class="cell100 column7"><%=rs.getString("blood_group")%></td>
                                    <td class="cell100 column8">
    <a href="updateappointment.jsp?appointment_id=<%=rs.getInt("appointment_id")%>" class="btn btn-primary">Update</a>
    <a href="<%=request.getContextPath()%>/deleteappointment?appointment_id=<%=rs.getInt("appointment_id")%>" class="btn btn-danger">Delete</a>
</td>

                                </form>
                            </tr>
                        </tbody>
                        <%
                                }
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%-- 
    Document   : updateappointment
    Created on : Nov 4, 2024, 12:02:55 PM
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
    <title>Update Appointments</title>
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
<%@ page import="java.sql.*" %>
<%
    String appointmentId = request.getParameter("appointment_id");
    Connection con = DatabaseConnection.initializeDatabase();
    String query = "SELECT * FROM appointments WHERE appointment_id = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, appointmentId);
    ResultSet rs = pstmt.executeQuery();
    if (rs.next()) {
%>
<body>
    <div class="container-contact100">
        <div class="wrap-contact100">
            <div class="contact100-form-title" style="background-image: url(img/bg-01.jpg);">
                <span class="contact100-form-title-1">
                    Update Appointment
                </span>
            </div>

            <form class="contact100-form validate-form" action="<%=request.getContextPath()%>/UpdateAppointment" method="post">
                <input type="hidden" name="appointment_id" value="<%= appointmentId %>">

                <div class="wrap-input100 validate-input" data-validate="Date is required">
                    <span class="label-input100">Date:</span>
                    <input class="input100" type="date" value="<%= rs.getString("date") %>" name="date" placeholder="Enter Date">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Time is required">
                    <span class="label-input100">Time:</span>
                    <input class="input100" type="time" value="<%= rs.getString("time") %>" name="time" placeholder="Enter Time">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Doctor is required">
                    <span class="label-input100">Doctor:</span>
                    <input class="input100" type="text" value="<%= rs.getString("doctor") %>" name="doctor" placeholder="Enter Doctor Name">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Remarks are required">
                    <span class="label-input100">Patient Remarks:</span>
                    <textarea class="input100" name="remarks" placeholder="Enter Patient Remarks"><%= rs.getString("patient_remarks") %></textarea>
                    <span class="focus-input100"></span>
                </div>

                <div class="container-contact100-form-btn">
                    <button class="contact100-form-btn">
                        <span>
                            Submit
                            <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
<%
    }
    con.close();
%>


</html>


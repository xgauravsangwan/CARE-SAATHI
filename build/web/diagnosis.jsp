<%-- 
    Document   : diagnosis
    Created on : Apr 21, 2024, 4:33:08 AM
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
        <title>Diagnosis</title>
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
    </style>
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

<div class="container-contact100">
    <div class="wrap-contact100">
        <div class="contact100-form-title" style="background-image: url(img/bg-01.jpg);">
            <span class="contact100-form-title-1">
                Doctor Diagnosing Form
            </span>				
        </div>
<form class="contact100-form validate-form" action="<%=request.getContextPath()%>/AddDiagnosis" method="post">
    <div class="wrap-input100 validate-input">
        <span class="label-input100">Select Patient:</span>
        <input type="hidden" id="patient_id" name="patient_id">
        <script>
            // Function to set the selected patient's ID
            function setPatientId(patientId) {
                document.getElementById("patient_id").value = patientId;
            }
        </script>        
        <select class="input100" name="patient_name" required onchange="setPatientId(this.value)">
            <option value="">Select Patient</option>
            <% 
                try {
                    Connection con = DatabaseConnection.initializeDatabase();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT patient_id, patient_name FROM appointments");
                    while (rs.next()) {
                        int patientId = rs.getInt("patient_id");
                        String patientName = rs.getString("patient_name");
            %>
            <option value="<%= patientId %>"><%= patientName %></option>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
            <span class="focus-input100"></span>
            </div>            
            <div class="wrap-input100 validate-input" data-validate="Disease is required to write">
                <span class="label-input100">Disease:</span>
                <input class="input100" type="text" name="Disease" placeholder="Enter Disease">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Diagnosis is required">
                <span class="label-input100">Diagnosis:</span>
                <input class="input100" type="text" name="DiagnosedAs" placeholder="Enter the diagnosis">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Treatment appointment is required">
                <span class="label-input100">Treatment Appointed:</span>
                <input class="input100" type="text" name="TreatmentAppointed" placeholder="Enter Treatment">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Valid Medicine is required">
                <span class="label-input100">Prescription:</span>
                <input class="input100" type="text" name="PrescriptionGiven" placeholder="Enter prescription">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Test Name is required">
                <span class="label-input100">Test Name:</span>
                <input class="input100" type="text" name="test_name" placeholder="Enter Test name">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Test Date is required">
                <span class="label-input100">Test Date:</span>
                <input class="input100" type="date" name="test_date" placeholder="Select Date">
                <span class="focus-input100"></span>
            </div>
            <div class="container-contact100-form-btn">
                <button class="contact100-form-btn">
                    <span>
                        Proceed
                        <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                    </span>
                </button>
            </div>
        </form>
    </div>
</div>

<div id="dropDownSelect1"></div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
        <script src="js/map-custom.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-23581568-13');
        </script>
    </body>
</html>
<%-- 
    Document   : PatientHome
    Created on : Apr 20, 2024, 3:00:35 PM
    Author     : Gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Home</title>
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
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    <style>
        body {
            background-image: url("img/CSx.jpg");
            background-color: #cccccc;
        }
        .navbar-brand img {
            height: 100px;
            width: 100px;
        }
        .feature-card {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"> <img src="img/CS_Logo.jpg" alt="CARE-SAATHI"> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Welcome, Patient!</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card feature-card mb-3" onclick="location.href='appointment.jsp';">
                            <div class="card-body">
                                <h5 class="card-title">Appointment Scheduling</h5>
                                <p class="card-text">View available appointment slots and schedule appointments with preferred doctors.</p>
                            </div>
                        </div>
                        <div class="card feature-card" onclick="location.href='prescription.jsp';">
                            <div class="card-body">
                                <h5 class="card-title">Prescription Management</h5>
                                <p class="card-text">View current prescriptions, request refills, and renew prescriptions online.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card feature-card mb-3" onclick="location.href='medical_history.jsp';">
                            <div class="card-body">
                                <h5 class="card-title">Medical History and Records</h5>
                                <p class="card-text">Access personal medical records, update information, and view past diagnoses and treatments.</p>
                            </div>
                        </div>
                        <div class="card feature-card" onclick="location.href='lab_results.jsp';">
                            <div class="card-body">
                                <h5 class="card-title">Lab Results </h5>
                                <p class="card-text">Access test results and diagnostic reports, and understand them in layman's terms.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>



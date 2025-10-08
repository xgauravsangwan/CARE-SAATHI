<%-- 
    Document   : DoctorHome
    Created on : Apr 21, 2024, 1:42:54 AM
    Author     : Gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Doctor Home</title>
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
        .feature-card-body {
        min-height: 150px; /* Adjust the value as needed */
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
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Welcome, Doctor!</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card feature-card mb-3" onclick="location.href='CurrentDoctor.jsp';">
                            <div class="card-body feature-card-body">
                                <h5 class="card-title">Personal Information Updation </h5>
                                <p class="card-text">Access to self profile, including personal information.
                                    Able to update personal records, including age, timing of availability, and other info.</p>
                            </div>
                        </div>
                        <div class="card feature-card" onclick="location.href='viewallappointment.jsp';">
                            <div class="card-body feature-card-body">
                                <h5 class="card-title">Appointment Management</h5>
                                <p class="card-text">View scheduled appointments and manage availability.
                                        Able to schedule, reschedule, or cancel appointments.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card feature-card mb-3" onclick="location.href='doctor_medical_records.jsp';">
                            <div class="card-body feature-card-body">
                                <h5 class="card-title">Medical Records and Diagnosis</h5>
                                <p class="card-text">View and update patient diagnoses, including medical conditions, test results, and treatment progress.</p>
                            </div>
                        </div>
                        <div class="card feature-card" onclick="location.href='prescriptions.jsp';">
                            <div class="card-body feature-card-body">
                                <h5 class="card-title">Treatment Plans</h5>
                                <p class="card-text">Create and manage treatment plans for patients, including medications, therapies, and follow-up appointments.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

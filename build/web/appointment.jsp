<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Appointment Scheduling</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/adddataform.css">
    <link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
    <style>
        body {
            background-image: url("img/CSx.jpg");
            background-color: #cccccc;
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
                    MEDICAL HISTORY&RECORDS
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

<div class="container-contact100">
    <div class="wrap-contact100">
        <div class="contact100-form-title" style="background-image: url(img/bg-01.jpg);">
            <span class="contact100-form-title-1">
                Appointment Scheduling
            </span>
        </div>

        <!-- Appointment scheduling form -->
        <form class="contact100-form validate-form" action="<%=request.getContextPath()%>/Appointment" method="post">
            <!-- Add appointment scheduling form fields here -->
            <div class="wrap-input100 validate-input" data-validate="Date is required">
                <span class="label-input100">Date:</span>
                <input class="input100" type="date" name="date" placeholder="Select date">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Time is required">
                <span class="label-input100">Time:</span>
                <input class="input100" type="time" name="time" placeholder="Select time">
                <span class="focus-input100"></span>
            </div>
            
            
        <!-- DOCTOR FILTER CODE STARTS HERE -->
            
        <!-- Specialization Filter -->
<div class="wrap-input100">
    <span class="label-input100">Filter by Specialization:</span>
    <select class="input100" id="specializationFilter">
        <option value="">All Specializations</option>
        <% 
            try {
                Connection con = DatabaseConnection.initializeDatabase();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT DISTINCT specialization FROM doctor");
                while (rs.next()) {
        %>
        <option value="<%= rs.getString("specialization") %>"><%= rs.getString("specialization") %></option>
        <% 
                }
                rs.close();
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </select>
</div>

<!-- Gender Filter -->
<div class="wrap-input100">
    <span class="label-input100">Filter by Gender:</span>
    <select class="input100" id="genderFilter">
        <option value="">All Genders</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>
</div>

<!-- Doctor Dropdown -->
<div class="wrap-input100 validate-input" data-validate="Doctor is required">
    <span class="label-input100">Doctor:</span>
    <select class="input100" name="doctor" id="doctorSelect">
        <option value="">Select Doctor</option>
        <% 
            try {
                Connection con = DatabaseConnection.initializeDatabase();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT CONCAT(fname, ' ', lname) AS doctor_name, specialization, gender FROM doctor");
                while (rs.next()) {
                    String doctorName = rs.getString("doctor_name");
                    String specialization = rs.getString("specialization");
                    String gender = rs.getString("gender");
        %>
        <option value="<%= doctorName %>" data-specialization="<%= specialization %>" data-gender="<%= gender %>"><%= doctorName %></option>
        <% 
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </select>
    <span class="focus-input100"></span>
</div>

<!-- Filter Script -->
<script>
    const specializationFilter = document.getElementById("specializationFilter");
    const genderFilter = document.getElementById("genderFilter");
    const doctorSelect = document.getElementById("doctorSelect");

    function filterDoctors() {
        const spec = specializationFilter.value.toLowerCase();
        const gender = genderFilter.value.toLowerCase();

        for (let option of doctorSelect.options) {
            if (!option.dataset) continue;
            const optionSpec = (option.getAttribute("data-specialization") || "").toLowerCase();
            const optionGender = (option.getAttribute("data-gender") || "").toLowerCase();

            const matchSpec = spec === "" || optionSpec === spec;
            const matchGender = gender === "" || optionGender === gender;

            option.style.display = (matchSpec && matchGender) ? "block" : "none";
        }
    }

    specializationFilter.addEventListener("change", filterDoctors);
    genderFilter.addEventListener("change", filterDoctors);
</script>

        
        <!-- DOCTOR FILTER CODE ENDS HERE -->
        
        
            <div class="wrap-input100 validate-input" data-validate="Patient is required">
                <span class="label-input100">Patient:</span>
                <input class="input100" type="text" name="patient_name" placeholder="Enter patient's name">
                <span class="focus-input100"></span>
            </div>
            
            <div class="wrap-input100 validate-input" data-validate="Patient Remarks is required">
                <span class="label-input100">Patient Remarks:</span>
                <textarea class="input100" name="patient_remarks" placeholder="Enter current remarks or possible sympotms"></textarea>
                <span class="focus-input100"></span>
            </div>
            
            <div class="wrap-input100 validate-input" data-validate="Contact Number is required">
                <span class="label-input100">Contact Number:</span>
                <input class="input100" type="text" name="contact_number" placeholder="Enter contact number">
                <span class="focus-input100"></span>
            </div>
            
            <div class="wrap-input100 validate-input" data-validate="Email is required">
                <span class="label-input100">Email:</span>
                <input class="input100" type="text" name="email" placeholder="Enter your e-mail">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Age is required">
                <span class="label-input100">Age:</span>
                <input class="input100" type="text" name="age" placeholder="Enter age">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Address is required">
                <span class="label-input100">Address:</span>
                <input class="input100" type="text" name="address" placeholder="Enter address">
                <span class="focus-input100"></span>
              </div>

            <div class="wrap-input100 validate-input" data-validate="Blood Group is required">
                <span class="label-input100">Blood Group:</span>
                <input class="input100" type="text" name="blood_group" placeholder="Enter blood group">
                <span class="focus-input100"></span>
            </div>
            
            <div class="wrap-input100 validate-input" data-validate="Gender is required">
                <span class="label-input100">Gender:</span>
                <select class="input100" name="gender">
                    <option value="">Select gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Previous Health Problems is required">
                <span class="label-input100">Previous Health Problems:</span>
                <textarea class="input100" name="previous_health_problems" placeholder="Enter previous health problems"></textarea>
                <span class="focus-input100"></span>
            </div>


            <div class="container-contact100-form-btn">
                <button class="contact100-form-btn">
                    <span>
                        Schedule Appointment
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

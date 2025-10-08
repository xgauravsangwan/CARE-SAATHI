<%-- 
    Document   : Bill
    Created on : Apr 11, 2024, 11:16:52 PM
    Author     : Gaurav
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Payment</title>
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
    .payment-container {
    max-width: 800px;
    margin: auto;
    padding: 20px;
    }

    .payment-method {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 2px 2px 12px rgba(0,0,0,0.1);
    }
    .payment-method h3 {
    margin-bottom: 15px;
    }

    </style>
</head>
<body>
<%
    Connection con = null;
%>
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
                    PATIENT
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="addpatient.jsp">Add Patient</a>
                    <a class="dropdown-item" href="listPatient.jsp">Patient List</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    BILLING
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="Bill.jsp">Add Bill</a>
                    <a class="dropdown-item" href="ViewBill.jsp">View Bill</a>
                </div>
            </li>
        </ul>
    </div>
</nav>



<div class="payment-container">
    <h1 class="text-center">Bill Payment</h1>

    <!-- UPI Payment Method -->
    <div class="payment-method">
        <h3>UPI Payment</h3>
        <form action="processPayment.jsp" method="post">
            <!-- Payer Details -->
            <label for="payerName">Payer Name:</label>
            <input type="text" id="payerName" name="payerName" required><br><br>
            
            <label for="payerMobile">Payer Mobile:</label>
            <input type="text" id="payerMobile" name="payerMobile" required><br><br>
            
            <input type="number" id="upiAmount" name="amount" placeholder="Enter Amount" required><br><br>
            <input type="hidden" id="upiAmountHidden" name="amount">
            <input type="hidden" name="paymentMethod" value="UPI">
            <button type="submit" id="rzp-button1" class="btn btn-primary">Pay via Razorpay</button>
<!--             <input type="submit" class="btn btn-primary" value="Proceed to UPI Payment">-->
        </form>
    </div>

    <!-- UPI QR Code for payment -->
    <div class="payment-qr">
        <h4>Scan to Pay:</h4>
        <img src="img/QRx.jpg" alt="UPI QR Code" height="500" width="500" align="center">
    </div>

</div>

<!-- Razorpay Script -->
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    // Function to set the amount dynamically before payment
    document.getElementById("rzp-button1").onclick = function(e) {
        var amount = document.getElementById("upiAmount").value;
        document.getElementById("upiAmountHidden").value = amount; // Update hidden input with amount

        var options = {
            "key": "rzp_test_hEM3QxNok1kwYd", // your Test Key
            "amount": amount * 100, // convert to paise
            "currency": "INR",
            "name": "CARE-SAATHI",
            "description": "Hospital Bill Payment",
            "image": "img/CS_Logo.jpg",
            "handler": function(response) {
                // After payment success, submit form
                document.forms[0].submit();
            },
            "prefill": {
                "name": document.getElementById("payerName").value, // Prefill payer name
                "email": "patient@email.com" // Prefill email (you can update this dynamically if needed)
            },
            "theme": {
                "color": "#F37254"
            }
        };

        var rzp1 = new Razorpay(options);
        rzp1.open();
        e.preventDefault(); // Prevent form submission
    };
</script>

</body>
</html>


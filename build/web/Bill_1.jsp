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
    <div class="payment-method">
        <h3>UPI Payment</h3>
        
        
        <form action="processPayment.jsp" method="post">
            <label for="upiAmount">Amount:</label>
            <input type="text" id="upiAmount" name="amount" required>
            <input type="hidden" name="paymentMethod" value="UPI">
            <input type="submit" class="btn btn-primary" value="Proceed to UPI Payment">
        </form>
    </div>
    <div class="payment-method">
        <h3>Credit Card Payment</h3>
        <form action="processPayment.jsp" method="post">
            <label for="creditCardAmount">Amount:</label>
            <input type="text" id="creditCardAmount" name="amount" required>
            <input type="hidden" name="paymentMethod" value="CreditCard">
            <input type="submit" class="btn btn-primary" value="Proceed to Credit Card Payment">
        </form>
    </div>
    <div class="payment-method">
        <h3>Rupay Payment</h3>
        <form action="processPayment.jsp" method="post">
            <label for="rupayAmount">Amount:</label>
            <input type="text" id="rupayAmount" name="amount" required>
            <input type="hidden" name="paymentMethod" value="Rupay">
            <input type="submit" class="btn btn-primary" value="Proceed to Rupay Payment">
        </form>
    </div>
    <div class="payment-method">
        <h3>Debit Card Payment</h3>
        <form action="processPayment.jsp" method="post">
            <label for="debitCardAmount">Amount:</label>
            <input type="text" id="debitCardAmount" name="amount" required>
            <input type="hidden" name="paymentMethod" value="DebitCard">
            <input type="submit" class="btn btn-primary" value="Proceed to Debit Card Payment">
        </form>
    </div>
</div>
</body>
</html>


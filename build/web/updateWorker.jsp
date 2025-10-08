<%-- 
    Document   : updateWorker
    Created on : Nov 7, 2024, 1:56:23 PM
    Author     : Gaurav
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Worker</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/adddataform.css">
    <link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
    <style>
        body {
            background-image: url("img/CSx.jpg");
            background-color: #cccccc;
            .column1 { width: 9%; }
            .column2 { width: 13%; }
            .column3 { width: 12%; }
            .column4 { width: 12%; }
            .column5 { width: 12%; }
            .column6 { width: 12%; }
            .column7 { width: 12%; }
            .column8 { width: 12%; }
            .column9 { width: 12%; }
            .column10 { width: 12%; }
        }
    </style>
</head>
<body>

<%
            String fname = request.getParameter("fname");
            String mob = request.getParameter("mob");
            Connection con = DatabaseConnection.initializeDatabase();
            String s = "SELECT * FROM worker WHERE fname = '"+fname+"' ";
            PreparedStatement pstmt = con.prepareStatement(s);
            ResultSet  rs = pstmt.executeQuery();
            while (rs.next()) {
%> 
<div class="container-contact100">
    <div class="wrap-contact100">
        <div class="contact100-form-title" style="background-image: url(img/bg-01.jpg);">
            <span class="contact100-form-title-1">
                Worker Update Form
            </span>
        </div>
        <form class="contact100-form validate-form" action="<%=request.getContextPath()%>/updateWorker" method="post">
            
            <%--<div class="wrap-input100 validate-input" data-validate="ID is required">
                <span class="label-input100">Unique ID:</span>
                <input class="input100" type="text" value="<%= rs.getString("recp_id") %>" name="recp_id" placeholder="Enter Unique ID">
                <span class="focus-input100"></span>
            </div>--%>
            
            <div class="wrap-input100 validate-input" data-validate="First Name is required">
                <span class="label-input100">First Name:</span>
                <input class="input100" type="text" value="<%= rs.getString("fname") %>" name="fname" placeholder="Enter First Name">
                <span class="focus-input100"></span>
            </div>
                
            <div class="wrap-input100 validate-input" data-validate="Last Name is required">
                <span class="label-input100">Last Name:</span>
                <input class="input100" type="text" value="<%= rs.getString("lname") %>" name="lname" placeholder="Enter Last Name">
                <span class="focus-input100"></span>
            </div>
                
            <div class="wrap-input100 validate-input" data-validate="Gender is required">
                <span class="label-input100">Gender:</span>
                <input class="input100" type="text" value="<%= rs.getString("gender") %>" name="gender" placeholder="Enter Gender">
                <span class="focus-input100"></span>
            </div>
            
            <div class="wrap-input100 validate-input" data-validate="Phone is required">
                <span class="label-input100">Phone:</span>
                <input class="input100" type="text" value="<%= rs.getString("mobile") %>" name="mobile" placeholder="Enter Phone">
                <span class="focus-input100"></span>
            </div>
                
            <div class="wrap-input100 validate-input" data-validate="Date of Joining is required">
                <span class="label-input100">Date:</span>
                <input class="input100" type="text" value="<%= rs.getString("date") %>" name="date" placeholder="Enter Date Of Joining">
                <span class="focus-input100"></span>
            </div>
                
                
            <%--div class="wrap-input100 validate-input" data-validate="City is required">
                <span class="label-input100">City:</span>
                <input class="input100" type="text" value="<%= rs.getString("city") %>" name="city" placeholder="Enter City">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                <span class="label-input100">Email:</span>
                <input class="input100" type="text" value="<%= rs.getString("email") %>" name="email" placeholder="Enter Email">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Age is required">
                <span class="label-input100">Age:</span>
                <input class="input100" type="text" value="<%= rs.getString("age") %>" name="age" placeholder="Enter Age">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Qualification is required">
                <span class="label-input100">Qualification:</span>
                <input class="input100" type="text" value="<%= rs.getString("qualification") %>" name="qualification" placeholder="Enter Qualification">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate="Address is required">
                <span class="label-input100">Address:</span>
                <input class="input100" type="text" value="<%= rs.getString("address") %>" name="address" placeholder="Enter Address">
                <span class="focus-input100"></span>
            </div--%>
            
            
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
<%
    }
%>
</body>
</html>
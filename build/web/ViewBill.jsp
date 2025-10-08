<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Bill</title>
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
        .serchbar {
            width: 60%;
            height: 5%;
            margin-top:2%;
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
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="#" class="navbar-brand"> <img src="img/CS_Logo.jpg" height="100" width="100" alt="CARE-SAATHI"> </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    PATIENT
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="addpatient.jsp">Add Patient</a>
                    <a class="dropdown-item" href="listPatient.jsp">Patient List</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
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

<div class="serchbar">
    <form action="" method="post">
        <input class="search" type="text" name="search" placeholder="Search Here..."/>
    </form>
</div>

<div>
    <div class="container-table100">
        <div class="wrap-table100">
            <div class="table100 ver3 m-b-110">
                <div class="table100-head">
                    <table>
                        <thead>
                        <tr class="row100 head">
                            <th class="cell100 column1">Payment ID</th>
                            <th class="cell100 column2">Amount</th>
                            <th class="cell100 column3">Payment Method</th>
                            <th class="cell100 column4">Status</th>
                            <th class="cell100 column5">Payer Name</th>
                            <th class="cell100 column6">Payer Mobile</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="table100-body js-pscroll">
                    <table>
                        <tbody>
                        <%
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;

                            try {
                                con = DatabaseConnection.initializeDatabase();
                                String query = request.getParameter("search");
                                String sql;

                                if (query != null && !query.isEmpty()) {
                                    sql = "SELECT * FROM payments WHERE payment_id LIKE ? OR payment_method LIKE ?";
                                    ps = con.prepareStatement(sql);
                                    ps.setString(1, "%" + query + "%");
                                    ps.setString(2, "%" + query + "%");
                                } else {
                                    sql = "SELECT * FROM payments";
                                    ps = con.prepareStatement(sql);
                                }

                                rs = ps.executeQuery();
                                while (rs.next()) {
                        %>
                        <tr class="row100 body">
                            <td class="cell100 column1"><%= rs.getString(1) %></td>
                            <td class="cell100 column2"><%= rs.getString(3) %></td>
                            <td class="cell100 column3"><%= rs.getString(2) %></td>
                            <td class="cell100 column4"><%= rs.getString(4) %></td>
                            <td class="cell100 column5"><%= rs.getString(6) %></td>
                            <td class="cell100 column6"><%= rs.getString(7) %></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (ps != null) ps.close();
                                    if (con != null) con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>CARE-SAATHI</title>
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
    </head>
    <style type="text/css">
        body {
            background-image: url("img/CSx.jpg");
            background-color: #cccccc;
        }

        .img-rounded {
            height: 100%;
            width: 100%;
        }

        h1 {
            color: black;
            text-align: center;
        }
    </style>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a href="#" class="navbar-brand"> <img src="img/CS_Logo.jpg"
                                                   height="100" width="100" alt="CARE-SAATHI">
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse"
                    data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ml-auto" style="margin-right: 40px;">
                    <a class="dropdown-item" href="index.jsp">Home</a>
                    <a class="dropdown-item" href="adminLogin.jsp">Admin</a>
                </div>
            </div>
        </nav>
        <div>
            <h1>
                <b>Welcome to our site!!</b>
            </h1>
        </div>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2>User Login</h2>
                <!-- Icon -->
                <div class="fadeIn first">

                </div>

                <!-- Login Form -->
                <form action="<%=request.getContextPath()%>/UserLogin" method="post">
    <select name="userType" id="userType">
        <option value="doctor">Doctor</option>
        <option value="patient">Patient</option>
        <option value="receptionist">Receptionist</option>
    </select><br>
    <input type="text" id="username" class="fadeIn second" name="username" placeholder="Username"> 
    <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password"> 
    <input type="submit" class="fadeIn fourth" value="Log In">
</form>


                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="userRegister.jsp">Create Account</a>
                </div>

            </div>
        </div>
    </body>
</html>
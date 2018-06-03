<%-- 
    Document   : Login
    Created on : Sep 15, 2017, 11:01:39 PM
    Author     : GHANSHYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel ="stylesheet" type ="text/css">
        <!--<link href="css/style.css" rel ="stylesheet" type="text/css">-->
        <link href="css/styleNew.css" rel ="stylesheet" type="text/css">

        <title>Login Page</title>
    </head> <%--8fa88b #1c6396 #6d7fcc--%>
    <body style="background-color: #1c6396;">    
        <div class="container">
            <br /> <br /><center>
                <h1 style="color: #ccdce8">College Review Sentiment Analysis</h1> <br /></center>
            <hr style = "border-width: 10px"/> 
            <div class="header">
		<h2>Login</h2>
		</div>
		<form action="LoginCheck" method="POST">
                    <div class="input-group">
                        ${status}
                    </div>
                    <div class="input-group form-group">
                            <label>Username:</label>
                            <input type="text" autocomplete="off" class ="form-control form" style="border-radius: 5px;" autofocus="autofocus" name="txtuser" placeholder="Username" required/>
                    </div>
                    <div class="input-group form-group">
                            <label>Password:&nbsp</label>
                            <input type="password" class ="form-control form" style="border-radius: 5px" name="txtpass" placeholder="Password" required/>
                    </div>
                    <div class="input-group form-group">
                        <button type="submit" name="login" class ="btn btn-primary form-control" name="login">Login</button>
                    </div>
                    <p>
                    Don't have an account? <a href="register.jsp">Sign Up</a>
                    </p>
		</form>
            <!--<div class="col-lg-4"></div>
            <div class="col-lg-4">
                <center>
                <div class="jumbotron rounded" style="margin-top: 40px;">
                    <h4>Login to continue</h4><br>
                    <form action = "LoginCheck" method = "POST"> 
                        <div class="form-group">
                            <input type="text" autofocus="autofocus" name = "txtuser" class ="form-control" placeholder="Username" required/>
                        </div>
                        <div class="form-group">
                            <input type="password" name = "txtpass" class ="form-control" placeholder="Password" onkeyup= "function() {
                                
                            }" required/>
                        </div>
                        <button type="submit" class ="btn btn-primary form-control">Login</button>
                        <br />
                        <br />
                    </form>
                    <h5>
                    </h5>
                </div>
                </center>
            </div>
            <div class="col-lg-4"></div>-->
        </div>
    </body>
</html>

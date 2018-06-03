<%-- 
    Document   : Register
    Created on : Oct 6, 2017, 04:33:39 PM
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

        <title>Registration Page</title>
    </head> <%--8fa88b #1c6396 #6d7fcc--%>s
    <body style="background-color: #1c6396;">    
        <div class="container">
            <br /> <br /><center>
                <h1 style="color: #ccdce8">College Review Sentiment Analysis</h1> <br /></center>
            <hr style = "border-width: 10px"/> 
            <div class="header">
		<h2>Register</h2>
		</div>
		<form action="LoginCheck" method="POST">
			<!-- Display validation errors here-->
                        
                        <div class="input-group">
                            ${status}
                        </div>
                        <div class="input-group">

                            <input type="text" name="username" class="form-control" style="border-radius: 5px" placeholder="Username" required />
                        </div>
                        <div class="input-group">

                            <input type="email" name="email" class="form-control" style="border-radius: 5px" placeholder="Email ID" required />
                        </div>
                        <div class="input-group">

                                <input type="password" class="form-control" name="password" style="border-radius: 5px" placeholder="Password" required />
                        </div>
                        <div class="input-group">

                                <input type="password" class="form-control" name="password_conf" style="border-radius: 5px" placeholder="Confirm Password" required />
                        </div>
                        <div class="input-group form-group">
                                <button type="submit" name = "register" style="margin-left: 0px; text-align: center;" class="btn btn-primary form-control" name="register" class="btn">Register</button>
                        </div>

                        <p>
                                Already a member? <a href ="Login.jsp">Login</a>
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
                                <% request.removeAttribute("h5"); %> ;
                            }" required/>
                        </div>
                        <button type="submit" class ="btn btn-primary form-control">Login</button>
                        <br />
                        <br />
                    </form>
                    <h5>
                        ${h5}
                    </h5>
                </div>
                </center>
            </div>
            <div class="col-lg-4"></div>-->
        </div>
    </body>
</html>

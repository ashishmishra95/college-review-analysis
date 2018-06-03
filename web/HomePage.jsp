<%-- 
    Document   : HomePage
    Created on : Sep 16, 2017, 2:41:48 PM
    Author     : GHANSHYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!-- Nice Scroll Js CDN -->
        <script src="https://use.fontawesome.com/2a1f89f3bf.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap Js CDN -->
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function getData(vl) {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("val").innerHTML = this.responseText;
                    } else {
                        //document.getElementById("val").innerHTML = "LOADING...";
                    }
                };
                xmlhttp.open("POST", "http://localhost:8080/CollegeReview/DBNegotiator?cName=" + vl + "&t=" + Math.random(), true);
                xmlhttp.send();
            }

            // When the user clicks the button, open the modal
            var modal;
            var senti;
            function openModal() {
                var modal = document.getElementById('myModal');
                document.getElementById('sentiment').innerHTML = 'Analyzing Review...';
                $('#yes').prop('disabled', true);
                $('#no').prop('disabled', true);

                if (document.getElementById('comment').value.length <= 1) {
                    document.getElementById('cmt').blur();
                    return;
                }
                modal.style.display = "block";
                var xmlhttp = new XMLHttpRequest();
                var comment = document.getElementById('comment').value;
                xmlhttp.onreadystatechange = function ()
                {
                    if (this.readyState === 4 && this.status === 200) {
                        senti = this.responseText;
                        if (senti === 'neg') {
                            document.getElementById("sentiment").innerHTML = "<b><i>" + "Negative" + "</i></b>";
                        } else if (senti === 'pos') {
                            document.getElementById("sentiment").innerHTML = "<b><i>" + "Positive" + "</i></b>";
                        } else {
                            document.getElementById("sentiment").innerHTML = "<b><i>" + senti + "</i></b>";
                        }
                        
                        $('#yes').prop('disabled', false);
                        $('#no').prop('disabled', false);
                        // document.getElementById("yes").disabled = false;
                        // document.getElementById("no").disabled = false;
                    } else {
                        //document.getElementById("val").innerHTML = "LOADING...";
                    }
                };
                xmlhttp.open("POST", "http://localhost:8080/CollegeReview/ReviewPredictor?review=" + comment + "&time=" + Math.random(), true);
                xmlhttp.send();

            }

            function aboutUs() {
                $(".article").removeClass("hide");
                document.getElementById("cname").innerHTML = "College Review Sentiment Analysis";
                document.getElementById("piechart").innerHTML = "";
                document.getElementById("saddr").innerHTML = "";
                $('.container').addClass("hide");
                $('#contactPage').addClass("hide");
            }

            function contactPage() {
                $("#contactPage").removeClass("hide");
                document.getElementById("cname").innerHTML = "College Review Sentiment Analysis";
                document.getElementById("piechart").innerHTML = "";
                document.getElementById("saddr").innerHTML = "";
                $('.container').addClass("hide");
                $('.article').addClass("hide");

                /*
                 var xmlhttp = new XMLHttpRequest();
                 xmlhttp.onreadystatechange = function() {
                 if(this.readyState === 4 && this.status === 200) {
                 $("#contactPage").removeClass("hide");
                 document.getElementById("contactPage").innerHTML=this.responseText;
                 //$('.container').addClass("hide");
                 } else {
                 //document.getElementsByClassName("container")[0].innerHTML = "LOADING...";
                 }
                 };
                 xmlhttp.open("POST","http://localhost:8080/CollegeReview/Contact.jsp",true);
                 xmlhttp.send();
                 */
            }

            $(document).ready(function () {

                // Get the modal
                modal = document.getElementById('myModal');

                // Get the button that opens the modal
                var btn = document.getElementById("cmt");

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                // When the user clicks on <span> (x), close the modal
                span.onclick = function () {
                    modal.style.display = "none";
                };

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target === modal) {
                        modal.style.display = "none";
                    }
                };
            });
            function prediction(isCorrect) {
                modal.style.display = "none";
                var xmlhttp = new XMLHttpRequest();
                var url;
                if (isCorrect) {
                    url = "http://localhost:8080/CollegeReview/ReviewPredictor?sentiment=" + senti;

                } else {
                    if (senti === "pos") {
                        url = "http://localhost:8080/CollegeReview/ReviewPredictor?sentiment=neg";
                    } else {
                        url = "http://localhost:8080/CollegeReview/ReviewPredictor?sentiment=pos";
                    }
                }
                xmlhttp.open("POST", url, true);
                xmlhttp.send();
                addComment(document.getElementById('comment'));
            }
        </script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>  
        <script>
            var commentNo = 0;
            var header = "";
            var title = "";
            var text = "";
            function updateCardVal() {
                return (
                        "<div class='card'>" +
                        "<h1 class='card-header'>" + header + "</h1>" +
                        "<div class='card-block'>" +
                        "<h3 class='card-title'>" + title + "</h3>" +
                        "<blockquote class='card-text'>" + text + "</blockquote>" +
                        "</div>" +
                        "</div>"
                        );
            }

            function balanceHeight(elemID1, elemID2) {
                if (document.getElementById(elemID1).style.height > document.getElementById(elemID2).style.height) {
                    document.getElementById(elemID2).style.height = document.getElementById(elemID1).style.height;
                } else {
                    document.getElementById(elemID1).style.height = document.getElementById(elemID2).style.height;
                }
            }

            function addComment(commentBox) {
                var user = document.getElementById('user').value;
                if (commentBox.value.length > 1) {
                    header = user;
                    title = "";
                    text = "<p style='padding:10px' id='" + (++commentNo) + "'>" + commentBox.value + "</p>";
                    newComment = updateCardVal();
                    $(newComment).hide().appendTo('#creviews').fadeIn("slow");
                    //document.getElementById('creviews').innerHTML += 
                    commentBox.value = '';
                }
                document.getElementById('cmt').blur();
            }

            function getCollegeDetails(name) {
                var xmlhttp = new XMLHttpRequest();
                $('.tp').removeClass('hide');
                $('#label').removeClass('hide');
                $(".container").removeClass("hide");
                xmlhttp.onreadystatechange = function ()
                {
                    if (this.readyState === 4 && this.status === 200) {
                        $(".article").addClass("hide");
                        $("#contactPage").addClass("hide");
                        //document.getElementsByClassName("jumbotron")[0].innerHTML = "CollegeDB | A place to share your views";
                        data = this.responseXML;
                        var neg = data.getElementsByTagName("neg")[0].childNodes[0].nodeValue;
                        var pos = data.getElementsByTagName("pos")[0].childNodes[0].nodeValue;
                        cName = data.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                        cSAddr = data.getElementsByTagName("saddr")[0].childNodes[0].nodeValue;
                        cAddr = data.getElementsByTagName("addr")[0].childNodes[0].nodeValue;
                        cWeb = data.getElementsByTagName("web")[0].childNodes[0].nodeValue;
                        cContact = data.getElementsByTagName("contact")[0].childNodes[0].nodeValue;
                        document.getElementById("cname").innerHTML = cName;
                        document.getElementById("saddr").innerHTML = cSAddr;
                        header = "Location";
                        title = cName;
                        text = cAddr;
                        document.getElementById("caddr").innerHTML = updateCardVal();

                        courses = data.getElementsByTagName("course");
                        header = "Courses Offered";
                        title = "";
                        course = "<ul>";
                        // course = "<b>Courses Offered:</b><br /><br />" + "<ul>";
                        for (i = 0; i < courses.length; i++) {
                            course += "<li>" + courses[i].childNodes[0].nodeValue + "</li>";
                        }
                        course += "</ul>";
                        text = course;
                        document.getElementById("cbranch").innerHTML = updateCardVal();

                        reviews = data.getElementsByTagName("review");
                        var user = data.getElementsByTagName("user");
                        header = "Anonymous User";
                        title = "";
                        var top = "";
                        for (i = 0; i < reviews.length; i++) {
                            header = user[i].childNodes[0].nodeValue
                            text = "<p style='padding:10px' id='" + (++commentNo) + "'>" + reviews[i].childNodes[0].nodeValue + "</p>";
                            top += updateCardVal();
                        }
                        document.getElementById("creviews").innerHTML = top;

                        google.charts.load('current', {'packages': ['corechart']});
                        google.charts.setOnLoadCallback(drawChart);
                        // Draw the chart and set the chart values
                        function drawChart() {
                            var data = google.visualization.arrayToDataTable([
                                ['Sentiment', 'No of Review'],
                                ['Negative Reviews', 2.5 * neg],
                                ['Positive Reviews', 2.5 * pos]
                            ]);

                            // Optional; add a title and set the width and height of the chart
                            var options = {
                                title: 'Review Summary',
                                width: 500, 'height': 350,
                                slices: {
                                    0: {color: 'Red'},
                                    1: {color: 'Green'}
                                }
                                //sliceVisibilityThreshold: 0.5
                            };

                            // Display the chart inside the <div> element with id="piechart"
                            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                            chart.draw(data, options);
                        }


                    } else {
                        //document.getElementById("cdetail").innerHTML = "LOADING...";
                    }
                };
                xmlhttp.open("POST", "http://localhost:8080/CollegeReview/CollegeDetails?collegeName=" + name, true);
                xmlhttp.send();
            }

        </script>
        <script>
            $(document).ready(function () {
                $('#sidebar').niceScroll({
                    cursorcolor: '#53619d', // Changing the scrollbar color
                    cursorwidth: 0, // Changing the scrollbar width
                    cursorborder: 'none' // Removing the scrollbar border
                });
                $('#contactPage').addClass("hide");
                /*
                 var xmlhttp = new XMLHttpRequest();
                 xmlhttp.onreadystatechange = function() {
                 if(this.readyState === 4 && this.status === 200) {
                 $(".article").removeClass("hide");
                 document.getElementsByClassName("article")[0].innerHTML=this.responseText;
                 //$('.container').addClass("hide");
                 } else {
                 //document.getElementsByClassName("container")[0].innerHTML = "LOADING...";
                 }
                 };
                 xmlhttp.open("POST","http://localhost:8080/CollegeReview/About.jsp",true);
                 xmlhttp.send();
                 */
            });
        </script>

        <!-- Bootstrap CSS CDN -->
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href ="css/modal.css" />
        <link rel="stylesheet" href="css/homepage.css" />
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("user") == null) {
                String msg = "<div class=\"alert alert-warning role=\"alert\">\n"
                        + "<strong>You're not a developer ;)</strong> You must log-in to access that page.\n"
                        + "</div>";
                request.setAttribute("status", msg);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

        %>
        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>College Database</h3>
                </div>
                <form method="POST" action="DBNegotiator">
                    <div class="form-group">
                        <div class="input-group margin-bottom-sm">
                            <input type="text" id="clgName" autocomplete="off" class="col-xs-4" style="margin-left: 5px;padding: 0px 10px; width: 375px; height: 45px;" placeholder="Search College" onkeyup="getData(this.value)"/>
                            <span class="input-group-addon" id="simg" style="background-color: white; " onclick="getData(document.getElementById('clgName').value)"><i class="fa fa-search fa-lg" aria-hidden="true"></i></span>
                            <!--<button id="search" type="button"  style="width: 45px;" class="btn btn-default" onclick="getData(document.getElementById('clgName').value)">
                                    
                            </button>-->
                        </div>
                    </div>
                </form>
                <form id = "clg" method="POST" action="CollegeDetails">
                    <ul class="list-unstyled components">
                        <li>
                            <a href="#" onclick="aboutUs()">About</a>
                            <!--
                            <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Pages</a>
                            <ul class="collapse list-unstyled" id="pageSubmenu">
                                <li><a href="#">Page 1</a></li>
                                <li><a href="#">Page 2</a></li>
                                <li><a href="#">Page 3</a></li>
                            </ul>
                            -->
                        </li>
                        <li>
                            <a href="#" onclick="contactPage()">Contact</a>
                        </li>
                        <li id = "val">

                        </li>
                    </ul>
                </form>

            </nav>

            <!-- Page Content Holder -->
            <div id="content">
                <form action="DBNegotiator" method="POST">
                    <div class="container-fluid" style="position: fixed; width: 100%; z-index: 2; padding: 0px;">
                        <nav class="navbar navbar-default navbar-fixed-top">
                            <div class="navbar-header">
                                <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                                    <i class="glyphicon glyphicon-align-left"></i>
                                    <span>Toggle Sidebar</span>
                                </button>

                                <button type="submit" name="<%= session.getAttribute("user")%>" id="logout" class="btn btn-outline-info">
                                    <span>Logout <%= session.getAttribute("user")%></span>
                                </button>
                            </div>
                        </nav>
                        <!--
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                            </ul>
                        </div>
                        -->  
                    </div>
                </form>
                <div class="jumbotron">
                    <h1 id ="cname">College Review Sentiment Analysis</h1>
                    <h4 id="saddr"></h4>
                    <div class="row">
                        <div class="col-md-6" id ="piechart"></div>
                    </div>
                </div>
                <div class="line"></div>
                <div class="line"></div>
                <iframe class="article" src="About.jsp" scrolling="no" frameborder="0" style="width:100%; height: 700px; position: relative;"></iframe>
                <iframe id="contactPage" src="Contact.jsp" scrolling="no" frameborder="0" style="width:100%; height: 700px; position: relative;"></iframe>
                <div class="container">
                    <!-- The Modal -->
                    <div id="myModal" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">

                                <h2>Review Sentiment Result</h2>
                                <span class="close">&times;</span>
                            </div>
                            <div class="modal-body">
                                <h3>Review sentiment predicted as: </h3>
                                <h3 id = 'sentiment'>Analyzing Review...</h3>
                            </div>
                            <div class="modal-footer">
                                <h3>Is this correct?</h3>
                                <button type='button' id="yes" class="btn btn-info" disabled="true" onclick="prediction(true)">Yes</button>
                                <button type='button' id="no" class="btn btn-danger" disabled="true" onclick="prediction(false)">No</button>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6" id="cbranch"></div>
                        <div class="col-md-6" id="caddr"></div>
                    </div>
                    <div class="row hide" id="label">
                        <span><br /><b style="font-size: 20px">Student Reviews:</b><br /><br /></span>
                    </div>
                    <div class="row" id="creviews">
                    </div>
                    <form action="ReviewPredictor" method="POST">
                        <div class = 'row tp hide'>
                            <div class='col-md-8' style="padding-left: 0px"><span><textarea  id = 'comment' rows = '4' class="form-control" style="min-width: 100%; margin: 10px;" placeholder="Write your review"></textarea></span></div>
                        </div>
                        <div class = 'row tp hide' >
                            <div class='col-sm-3' style="padding-left: 0px">
                                <button type = "button" style="min-width: 100%; margin: 10px;" id = "cmt" class ="btn btn-primary form-control"  onclick="openModal()"><!--onclick="addComment(document.getElementById('comment'))">-->Add Comment</button>
                            </div>
                        </div>
                    </form>
                </div>
                </div>

            <input type="hidden" id="user" value="<%= session.getAttribute("user")%>" />
        </div>
        <script type="text/javascript">
            balanceHeight("cbranch", "caddr");
            balanceHeight("sidebarCollapse", "logout");
        </script>
                 <!-- jQuery CDN -->
         <script src="js/jquery-3.2.1.min.js"></script>
         <!-- Bootstrap Js CDN -->
         <script src="js/bootstrap.min.js"></script>
         <!-- jQuery Nicescroll CDN -->
         <script src="js/jquery.nicescroll.min.js"></script>

         <script type="text/javascript">
            $(document).ready(function () {
                $("#sidebar").niceScroll({
                    cursorcolor: '#53619d',
                    cursorwidth: 4,
                    cursorborder: '2'
                });

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar, #logout, #content').toggleClass('active');
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
            });
       </script>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!--Import materialize.css-->
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        
        <link rel = "stylesheet" type="text/css" href="css/homepage.css">
        

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>   
      
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.20/jquery.fancybox.min.css" />
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.20/jquery.fancybox.min.js"></script> 
    </head>
    
    <script>
        function showLogin() {
            $("#logindiv").slideToggle();
        }
        
        $(document).ready(function(){
            $('.modal').modal({
                dismissible: true, 
                opacity: 0.7,
                startingTop: '20%',
                endingTop: '30%',
            });
          });

    
    
    </script>
        
    <body>
    
    	<div id="left"></div>
		<div id="right"></div>
		<div id="top"></div>
		<div id="bottom"></div>
       
        <div id="navbar">
            <div id="tbox">
                <p id="title"> this.<br>pic </p>
            </div>
            
            <a id="search"><i class="material-icons" id="magglass">search</i></a>
            <form method="get" action="photoSearch" id="searchBar"><input type="text" id="searchbox" name="search"></form>
            
            <a class="modal-trigger" href="#logindiv" id="loginb">LOGIN</a> 
            
        </div>
        
        <div id = "signupdiv">
            <div id=signupwrapper>
                <form method="POST" action="register"> 
                    <p id="usernamet">/username</p><input type="text" id="username" name="username"> <br>
                   
                    <p id="passwordt">/password</p><input type="password" id="password" name="password">
                   
                    <p id="desct">/description</p> 
                    
                    <!-- <input type="text" id="description" name="desc"> --> 
                    <textarea id="description" name="desc"></textarea>
                    <br> <span id="maxCount">Character:</span> <span id="keyCount">120</span><br>
                	
                	<input id = "signupb" type="submit" value="SIGN UP"> 
                </form>
              </div>
        </div>
    
        
        <div id="feed">
            <img src="img/public/1.jpg" class="img">
            <img src="img/public/2.jpg" class="img">
            <img src="img/public/3.jpg" class="img">
            <img src="img/public/4.jpg" class="img">
            <img src="img/public/5.jpg" class="img">
            <img src="img/public/6.jpg" class="img">
            <img src="img/public/7.jpg" class="img">
            <img src="img/public/8.jpg" class="img">
            <img src="img/public/9.jpg" class="img">
            <img src="img/public/10.jpg" class="img">
            <img src="img/public/11.jpg" class="img">
            <img src="img/public/12.jpg" class="img">
            <img src="img/public/13.jpg" class="img">
            <img src="img/public/14.jpg" class="img">
            <img src="img/public/15.jpg" class="img">
 
            <a href="#" id="showb">show more</a>
        </div>
        
        
      <div id="logindiv" class="modal">
        <div class="modal-content">
            <form action="login" method="POST">
	            <p id="usernamet">/username</p>
	            <input type="text" id="username" name="username"> <br> 
	
	            <p id="passwordt">/password</p>
	            <input type="password" id="password" name="password"><br><br>
	       	
	       	 	<input type="checkbox" name="remember" class="filled-in checkbox-black" id="filled-in-box" checked="checked"/>
	       	 	<label for="filled-in-box">Remember me</label> <br>   
	           	<input type="submit" value="login" id="loginbmodal">
            </form>
        </div>
      </div> 
    </body>
    
    <script>
        $("document").ready(function() {
            $(function () {
                $(".img").slice(0, 6).show();
                 $("#showb").on('click', function (e) {
                    e.preventDefault();
                    $("#showb").fadeOut(150); 
                    $("#showb").fadeIn(150); 
                    $(".img:hidden").slice(0, 3).fadeIn(900);
                    if ($(".img:hidden").length == 0) {
                        $("#showb").fadeOut("fast");
                    }

                    $('html,body').animate({
                        scrollTop: $(this).offset().top
                    }, 1500);   
                });
            });

            //Characters remaining for description sign up.
            $("textarea#description").keypress(function(e) {
                //count = $("textarea#description").val().length;
                count = $("span#keyCount").html();
                console.log("keypress" + count);


                if(count > 0) {
                    count--;
                    $("span#keyCount").html(count);
                }

                else e.preventDefault();

            });

            //Characters remaining for description sign up.
            $("textarea#description").keyup(function(e) {
                if(e.keyCode == 8 || e.keyCode == 46) {
                    var descLength = $("textarea#description").val().length;
                        count = $("span#keyCount").html();
                        console.log("keyup" + count);

                        if(descLength == 0) {
                            count = 120;
                            $("span#keyCount").html(count);
                        }

                        else
                            if(count != 120) {
                                count++;
                                $("span#keyCount").html(count);
                            }
                }

            })

            //Submit form once image if clicked.
            $("a#search").click(function() {
                $("form#searchBar").submit();
            });
        });

     </script>
</html>
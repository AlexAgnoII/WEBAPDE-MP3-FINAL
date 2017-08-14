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
        
    <body>
    
    	<div id="left"></div>
		<div id="right"></div>
		<div id="top"></div>
		<div id="bottom"></div>
        
        <div id="searchmodal" class="modal">
            <div class="modal-content">
                <a id="searchbmodal"><i class="material-icons" id="magglassmodal">search</i></a>
                <form method="get" action="photoSearch" id="searchBar"><input type="text" id="searchbox" name="search"></form>
                
            </div>
      </div> 
        
        <div id="navbar">
        	<a class="dropdown-button btn" href='#' data-activates="menu" id="tbox">
            <p id="title"> this.<br>pic</p></a>
            
            <a class="modal-trigger" href="#searchmodal" id="searchb"><i class="material-icons" id="magglass">search</i></a>
            
            <a class="modal-trigger" href="#loginmodal" id="loginb">LOGIN</a> 
            
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
    
    <!-- modal div for pics -->
    	<div id="picmodal" class="modal">
            <div class="pwrapper">
                    <img src="img/public/1.jpg" class="imgmodal">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">not_admin</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                  
                </div>
         </div> 
    	<!-- end of modal div -->
        
        <div id="feed">
        	<a class="modal-trigger" href="#picmodal" id="imgwrapper">
        	<img src="img/public/1.jpg" class="img"></a> 

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
        
        
      <div id="loginmodal" class="modal">
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
    
    <script src="scripts/homepageScript.js">
     </script>
</html>
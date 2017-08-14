<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        
        <title>Insert title here</title>
        
        <!--Import Google Icon Font-->        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!--Import materialize.css-->
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        
        <link rel = "stylesheet" type="text/css" href="css/userfeed.css">
        

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
            <div id="tbox">
                <p id="title"> this.<br>pic </p>
            </div>
            
              <a class="modal-trigger" href="#searchmodal" id="searchb"><i class="material-icons" id="magglass">search</i></a>
            
            <a href="logout" id="logoutb">LOGOUT</a> 
            
        </div>
    
    
 	    <div id="header">
              <a class="dropdown-button btn" href='#' data-activates="menu" id="dropmenu"> <i class="material-icons" id="icon">menu</i></a>

              <!-- menu contents -->
              <ul id="menu" class='dropdown-content'>
              	  
                  <li><a href="userfeed.jsp">home</a></li>
                  <li><a href="profile.jsp">profile</a></li>
                  <li><a href="logout">logout</a></li>
                   <!-- Redirects to logout servlet. -->
              </ul>

              
            <a id="search"><i class="material-icons" id="magglass">search</i></a>
            <form method="get" action="photoSearch" id="searchBar"><input type="text" id="searchbox" name="search"></form>
        </div> 
        
        <!-- This is a test, you can use this for showing attributes from the session. -->
			<!-- Username: ${sessionScope.un} <br> -->
          
    
        <div id="feed">
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/private/1.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">admin_</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
       	
       	<div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/public/1.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">not_admin</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/private/2.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">admin_</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/public/2.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">not_admin</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/private/3.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">admin_</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/public/3.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">not_admin</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/private/4.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">admin_</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/public/4.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">not_admin</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/private/5.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">admin_</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            
            <div class ="fwrapper">
                <div class="pwrapper">
                    <img src="img/public/5.jpg" class="img">
                </div>
                
                <div class="iwrapper">
                    <p class="uname">not_admin</p><br><br>
                    <li style="list-style-type:none"><div class="divider"></div></li>
                    <p class="cap">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                </div>
                
                <div class="iwrapperbottom">
                    <i class="material-icons" id="logos">supervisor_account</i>
                    
                    <i class="material-icons" id="logos">add_location</i>
                </div>
            </div>
            

           <a href="#" id="showb">show more</a>
            
        </div>
 
 	 <script src="scripts/userfeedScript.js"></script>
</body>
</html>
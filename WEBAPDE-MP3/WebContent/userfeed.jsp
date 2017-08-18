<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
                <input type="text" id="searchbox" name="search"></form>
            </div>
         </div>
         
          <div id="uploadmodal" class="modal">
		        UPLOAD STUFF GOES HERE
		        
		  </div>
        
         <div id="sharepicmodal" class="modal">
       		 	Add tags to <span id="sharePChosen"></span>:
       		 	<br>Enter tags: <input type = "text" name = "tags">
        		
        
         </div>
        
         <div id="addtagmodal" class="modal">
        		Share <span id="tagPChosen"></span> to: 
        		<br>Share to: <input type = "text" name = "share">
         </div> 
        
        <div id="navbar">
                <a class="dropdown-button btn" href='#' data-activates="menu" id="tbox">
                <p id="title"> this.<br>pic</p></a>
                
                 <ul id="menu" class='dropdown-content'>
                  <li><a href="userfeed.jsp">home</a></li>
                  <li><a href="profile.jsp">profile</a></li>
                  <li><a class="modal-trigger" href="#uploadmodal">upload</a></li>
                   <!-- Redirects to logout servlet. -->
              </ul>
            
              <a class="modal-trigger" href="#searchmodal" id="searchb"><i class="material-icons" id="magglass">search</i></a>
            
            <a href="logout" id="logoutb">LOGOUT</a> 
            
        </div>
   
        <!-- This is a test, you can use this for showing attributes from the session. -->
			<!-- Username: ${sessionScope.un} <br> -->
          
    
        <div id="feed">
        	<c:if test = "${not empty photoList}">
        		<c:forEach items="${photoList}" var="p">
		            <div class ="fwrapper">
		                <div class="pwrapper">
		                    <img src="${p.photo_url}" class="img">
		                </div>
		                
		                <div class="iwrapper">
		                    <p class="uname"> 
			                    	<a data-userName="${p.user_username}" class="userNameClicky">${p.user_username}</a>
			                    

		                    </p>
		                    <br>
		                    <br>
		                    <li style="list-style-type:none"><div class="divider"></div></li>
		                    <p class="cap">${p.photo_description}</p>
		                </div>
		                
		                <div class="iwrapperbottom">
		                	<c:if test="${sessionScope.un == p.user_username}">
		                      	<a class="modal-trigger sharepicb" href="#sharepicmodal" data-photoId="${p.photo_id}" data-photoName="${p.photo_title}"> <!-- switched sharepicb from ID to Class -->
		                      		<i class="material-icons logos">supervisor_account</i>
		                      	</a>
		                      
		                      	<a class="modal-trigger addtagb" href="#addtagmodal" data-photoId="${p.photo_id}" data-photoName="${p.photo_title}"> <!-- switched addtagb from ID to Class -->
		                      		<i class="material-icons logos">add_location</i>
		                      	</a>
		                	</c:if>
		                </div>
		                
		            </div>
	            </c:forEach>
	           <a href="#" id="showb">show more</a>
           </c:if>
           
           <c:if test = "${empty photoList}">
              No photos at the moment.
           </c:if>
            
            
        </div>
 
 	 <script src="scripts/userfeedScript.js"></script>
</body>
</html>
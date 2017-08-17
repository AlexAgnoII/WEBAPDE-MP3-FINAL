<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
        
        <link rel = "stylesheet" type="text/css" href="css/profile.css">
        

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>   
      
   
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
              <div id="uploadwrapper">
                  
                  <form method="post" action="upload" id="uploadPic">
                      
                    <input type="file" id= "uploadb" name="pic" accept="image/*" onchange="readURL(this);" data-classIcon="icon-plus"><br><hr>
                        Title: <input type = "text" name ="title" id="titlef"><br>
                        Description: <input type = "text" name = "description" id="descf"><br>
                        Tags: <input type = "text" name = "tags" id="tagsf"><br>
                        
                        <input type="radio" value="private" name="privacy"/> <label for="test2" class="lbl">Privacy</label>            
                       
                        <input type="radio" value="public" name="public"/> <label for="test2" class="lbl">Public</label><br>
                      
                        Share to<input type = "text" name = "share" id="sharef"><br>
                    </form>

                <div id="question">
                    <a class="waves-effect waves-light btn" id="uploadbm">Upload</a>
                    <a class="waves-effect waves-light btn" id="backbm" href="profile.jsp">Back</a> <br>
                </div>

              </div>      
		  </div>
        
         <div id="sharepicmodal" class="modal">
       		 	SHARE PIC  STUFF GOES HERE
        
         </div>
        
         <div id="addtagmodal" class="modal">
        		ADD TAG STUFF GOES HERE
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
        
        <div id="uwrapper">
            <img src="img/userpic.png" id="userdp">
            <div id="unamewrapper"><p id="uname">${user.users_username}</p></div>
            <p id="userdesc">${user.users_description}</p>
      
        </div>
         
        <!-- Switched searchb ID to class.-->
        <div id = "feed">
	        <c:if test = "${not empty photoList}">
	        
	        	<c:forEach items="${photoList}" var="p">
		         <div id="${p.photo_id}" class="modal">
		            <div class="pwrapper">
		                    <img src="${p.photo_url}" class="imgmodal">
		                </div>
		                
		                <div class="iwrapper">
		                    <p class="uname">${p.photo_title}</p><br><br>
		                    <li style="list-style-type:none"><div class="divider"></div></li>
		                    <p class="cap">${p.photo_description}</p>
		                </div>
		                
		                <div class="iwrapperbottom">
		                	<c:if test="${sessionScope.un == p.user_username}">
		                      	<a class="modal-trigger sharepicb" href="#sharepicmodal" > <!-- switched sharepicb from ID to Class -->
		                      		<i class="material-icons logos">supervisor_account</i>
		                      	</a>
		                      
		                      	<a class="modal-trigger addtagb" href="#addtagmodal" > <!-- switched addtagb from ID to Class -->
		                      		<i class="material-icons logos">add_location</i>
		                      	</a>
		                	</c:if>
		                </div>
		         	</div> 
		         	
		        	<a class="modal-trigger searchb" href="#${p.photo_id}"> 
		        	<img src="${p.photo_url}" class="img"></a>
	  			</c:forEach>
	            <a href="#" id="showb">show more</a>
	        </c:if>
	        
	        <c:if test = "${empty photoList}">
	        	No photos.
	        </c:if>
        </div>
        
      <script src="scripts/profileScript.js"></script>
 
</body>
</html>
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
        
        <link rel = "stylesheet" type="text/css" href="css/searchResult.css">
        

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
            <input type="text" id="searchbox" name="search">

        </div>
     </div> 
    
    <div id="navbar">
        <a class="dropdown-button btn" href='#' data-activates="menu" id="tbox">
        <p id="title"> this.<br>pic</p></a>

         <ul id="menu" class='dropdown-content'>
          <li><a href="homepage.jsp">Back</a></li>

        </ul>

         <a class="modal-trigger" href="#searchmodal" id="searchb"><i class="material-icons" id="magglass">search</i></a>
		
		<c:if test="${empty un}">
        	<a class="modal-trigger" href="#loginmodal" id="loginb">LOGIN</a> 
        </c:if>
        <c:if test="${not empty un}">
        	<a class="modal-trigger" href="logout" id="loginb">LOGOUT</a>
        </c:if> 
        <!-- <a href="logout" id="logoutb">LOGOUT</a> -->
            
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
      
         <div id="sharepicmodal" class="modal">
       		 	SHARE PIC  STUFF GOES HERE
        
         </div>
        
         <div id="addtagmodal" class="modal">
        		ADD TAG STUFF GOES HERE
         </div> 
         
    <div id="feed"> 
    	<h1 id="theResults">Search results for: ${term}</h1>
		  <c:if test = "${not empty photoList}">
        		<c:forEach items="${photoList}" var="p">
		            <div class ="fwrapper">
		                <div class="pwrapper">
		                    <img src="${p.photo_url}" class="img">
		                </div>
		                
		                <div class="iwrapper">
		                    <p class="uname"> 
			                    <c:if test="${sessionScope.un != p.user_username}">
			                    	<a data-userName="${p.user_username}" class="userNameClicky">${p.user_username}</a>
			                    </c:if>
			                    
			                    <c:if test="${sessionScope.un == p.user_username}">
			                    	${p.user_username}
			                    </c:if>
		                    </p>
		                    <br>
		                    <br>
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
		                	<br>
		                </div>
		                
		            </div>
	            </c:forEach>
	           <a href="#" id="showb">show more</a>
           </c:if>
		
		<c:if test = "${empty photoList}">
			<p id="notFound">No photos found!</p>
		</c:if>
		


	</div>   
			<script src="scripts/searchResultScript.js">
		</script>
</body>
</html>
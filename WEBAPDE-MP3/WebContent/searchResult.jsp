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
            <form method="get" action="photoSearch" id="searchBar"><input type="text" id="searchbox" name="search"></form>

        </div>
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
    
    <div id="feed"> 
		<c:if test = "${not empty Photo}">
			<c:forEach items="${Photo}" var = "p">
				
				<div class="picwrapper">
					<img src="${p.url}" alt="${p.title}" class="pics">
	                <p class="un">${p.uploader}</p><br>
	                <p class="caption">${p.description}</p> <br><hr>
	                <p id="tags">
	                	<c:forEach items="${p.tags}" var = "t">
	                		#${t} 
	                	</c:forEach>
	                </p>
	            </div>
			</c:forEach>
		</c:if>
		
		<c:if test = "${empty Photo}">
			<p id="notFound">No photo found!</p>
		</c:if>
		
		<script src="scripts/searchResultScript.js">
		</script>
	</div>   
</body>
</html>
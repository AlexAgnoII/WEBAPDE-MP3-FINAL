<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

		<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
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
        
      
</head>
<body>
	  <div id="header">
              <a class="dropdown-button btn" href='#' data-activates="menu" id="dropmenu"> <i class="material-icons" id="icon">menu</i></a>

              <!-- menu contents -->
              <ul id="menu" class='dropdown-content'>
              	  
                  <li><a href="homepage.jsp">Back</a></li>
                   <!-- Redirects to logout servlet. -->
              </ul>
              
            <a id="search"><i class="material-icons" id="magglass">search</i></a>
            <form method="get" action="photoSearch" id="searchBar"><input type="text" id="searchbox" name="search"></form>
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
			<h1 id="notFound">No photo found.</h1>
		</c:if>
		
		<script>
			$(document).ready(function() {
				 //Submit form once image if clicked.
		        $("a#search").click(function() {
		        	$("form#searchBar").submit();
		        });
			});
			
		</script>
	</div>   
</body>
</html>
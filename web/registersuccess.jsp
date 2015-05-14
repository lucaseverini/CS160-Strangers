<!-- 
	registersuccess.jsp

    JSP for the successfull registration page
        
    SJSU - CS160 - Strangers
	May-5-2015
-->

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
	<title>CarMatch</title>
	<link href="style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
	<%@ include file="header.jsp" %>
    <h1 id="pageTitle">Registration Success</h1>
        <% String name = (String) request.getAttribute("username"); %>
        <p>Your account has been made, <%= name %> </p> 
    </body>
</html>

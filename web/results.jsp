<!-- 
	results.jsp

    JSP for the result page
        
    SJSU - CS160 - Strangers
	May-5-2015
-->

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="carmatch.beans.Vehicle, java.util.List, java.util.LinkedList" %>

<!DOCTYPE html>
<html>
<head>
	<title>Search Results - CarMatch</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="header.jsp" %>

<% LinkedList<Vehicle> arr = (LinkedList<Vehicle>)request.getAttribute("results"); %>
<% if (arr != null) { %>
    <% if (!arr.isEmpty()) { %>
<h1 id="pageTitle">Search Results</h1>
<table id="searchResults">
	<tr>
		<th>Price</th>
		<th>Brand</th>
		<th>Model</th>
	</tr>
	<% for (Vehicle vehicle : arr) { %> 
	<tr>
		<td><%= (int)vehicle.getPrice()%></td>
		<td><%= (String)vehicle.getMaker()%></td>
		<td><%= (String)vehicle.getModel()%></td>
		<td>
		<form action="checkout.jsp" method = "GET">
		<input type="submit" name="buy" value="buy">
		</form>
		</td>
	</tr>
	<% } %>
<% } else { %>
<h1 id="pageTitle">No Match</h1>
<p>We couldn't find any listings matching your query.</p>
<!-- This could be better, for example including what we searched for so the user can spot any mistakes they made. -->
<% }} else { %>  
<h1 id="pageTitle">Error</h1>
<p>servlet not called</p>
<% } %>
</table>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="carmatch.beans.Vehicle, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<title>Search Results - CarMatch</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="header.jsp" %>
<h1 id="pageTitle">Search Results</h1>
<table id="searchResults">
	<tr>
		<th>Price</th>
		<th>Brand</th>
		<th>Model</th>
	</tr>
	<% for (Vehicle vehicle : request.getAttribute("results")) { %> 
	<tr>
		<td>$${vehicle.price / 100}</td>
		<td>${vehicle.brand}</td>
		<td>${vehicle.model}</td>
		<td>
		<form action="checkout.jsp" method = "GET">
		<input type="submit" name="buy" value="buy">
		</form>
		</td>
	</tr>
	<% } %>
	
</table>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
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
	<tr>
		<td>1</td>
		<td>Ford</td>
		<td>Forerunner</td>
		<td>
		<form action="checkout.jsp" method = "GET">
		<input type="submit" name="buy" value="buy">
		</form>
		</td>
	</tr>
	<tr>
		<td>2</td>
		<td>Honda</td>
		<td>Accord</td>
		<td>
		<form action="checkout.jsp" method = "GET">
		<input type="submit" name="buy" value="buy">
		</form>
		</td>
	</tr>
	<tr>
		<td>3</td>
		<td>Tesla</td>
		<td>Roadster</td>
		<td>
		<form action="checkout.jsp" method = "GET">
		<input type="submit" name="buy" value="buy">
		</form>
		</td>
	</tr>
	
</table>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Advanced Search - CarMatch</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="header.jsp" %>
<h1 id="pageTitle">Advanced Search</h1>
<form action="results" method="GET">
	<div>
		Price: <input type="number" name="priceFrom">
		to <input type="number" name="priceTo">
	</div>
	<div>Model: <input type="text" name="model"></div>
	<div>Brand: <input type="text" name="brand"></div>
	<div><input type="submit" value="Search"></div>
</form>
</html>

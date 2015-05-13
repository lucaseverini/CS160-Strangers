<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>CarMatch</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="header.jsp" %>
	
	<!-- Where our content will be -->
	<p id="content">Placeholder for other stuff<p>
	
	<!-- Dunno where to put the search box -->
	<form action="results" method = "GET">
		Search for cars: <input type="text" name="maker">
		<input type="submit" value = "Search">
	</form>
	<br></br>
	<a href="./search.jsp" id="advanceSearch"> Advanced Search </a> 
</body>
</html>

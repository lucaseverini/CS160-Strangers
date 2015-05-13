<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>CarMatch</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="header.jsp" %>
<h1 id="pageTitle">Create Account</h1>
<form method="POST" action="registerServlet">
	<label><span class="labelText">Username:</span><input type="text" name="username">
	<label><span class="labelText">Password:</span><input type="password" name="password">
	<label><span class="labelText">Confirm password:</span><input type="password" name="confirmpassword">
</form>
</body>
</html>
<!-- Start of header -->
<div class="header"> 
	<h1 id="logo" > CarMatch </h1>
	<% // Temporary user detection until we create the real account system
	if (request.getParameter("user") == null) { %>
	<form action="" method="POST" id="login">
		Username: <input type="text" class="smallbox" name="user">
		Password: <input type="password" class="smallbox" name="pass">
		<input type="submit" value="Login" class="smallbox">
	</form>
	<% } else { %>
	<form action="" method="POST" id="logout">
			<span class="user">${param.user}</span>
			<input type="submit" value="Logout" class="smallbox">
	</form>
	<% } %>
</div>
<!-- End of header -->
<!-- Start of header -->
<div class="header"> 
	<h1 id="logo" > CarMatch </h1>
	<% // Temporary user detection until we create the real account system
	if (session.getAttribute("user") == null) { %>
	<form action="/LoginServlet" method="POST" id="login">
		Username: <input type="text" class="smallbox" name="user">
		Password: <input type="password" class="smallbox" name="pass">
		<input type="submit" value="Login" class="smallbox">
	</form>
	<% } 
        else 
        { 
            String user = (String) session.getAttribute("user");
            
        %>
	<form action="/LogoutServlet" method="POST" id="logout">
			<span class="user"><%=user %></span>
			<input type="submit" value="Logout" class="smallbox">
	</form>
	<% } %>
</div>
<!-- End of header -->

<!-- Start of header -->
<div class="header"> 
	<h1 id="logo" ><a href="/">CarMatch</a></h1>
	<% // Temporary user detection until we create the real account system
	if (session.getAttribute("user") == null) { %>
	<form action="/LoginServlet" method="POST" id="login">
		<label>Username: <input type="text" class="smallbox" name="user"></label>
		<label>Password: <input type="password" class="smallbox" name="pass"></label>
		<input type="submit" value="Login" class="smallbox">
		<div id="accountInvite">Need an account? <a href="/registerform.jsp">Register</a></div>
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

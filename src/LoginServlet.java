/*
	LoginServlet.java

    SJSU - CS160 - Strangers

	May-5-2015
*/

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Properties;

public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
    private String user;
    private String pass;
    private int id;
	private Properties props;
	private String dbUrl;
	private String dbUser;
	private String dbPassword;
	
	@Override
    public void init() throws ServletException
    {
        user = null;
        pass = null;
		id = 0;
 
        try
		{
			InputStream stream = this.getClass().getResourceAsStream("../build.properties");
			props = new Properties();
			props.load(stream);	

		    Class.forName("com.mysql.jdbc.Driver");
 			dbUser = props.getProperty("mysql-userid");
			dbPassword = props.getProperty("mysql-password");
			dbUrl = props.getProperty("mysql-url") + "/" + props.getProperty("mysql-db");
		}
        catch(Exception e)
        {
			e.printStackTrace();
        } 
	}
    
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        
        out.println("<html><body>");
		
        boolean valid = false;
		
		Connection connection = null;
		Statement statement = null;
		
        try
		{
			user = request.getParameter("user");
			pass = request.getParameter("pass");
			
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            statement = connection.createStatement();
			String query = "Select * from car_match.access where UserName='" + user + "' AND Password='" + pass + "'";
            ResultSet rs = statement.executeQuery(query);
            if(rs.next())
            {
                valid = true;
                user = rs.getString("UserName");
                id = rs.getInt("User");
            }
            else
			{
                valid = false;
			}
			
            rs.close();			
        }
        catch(SQLException e)
        {
            valid = false;
            out.println(e.getMessage() + "<br></br>");
        }
 		finally
		{
			try
			{
				if(statement != null)
				{
					statement.close();
				}
				
				if(connection != null)
				{
					connection.close();
				}
			}
			catch(SQLException ex)
			{
				ex.printStackTrace();
			}
		}
       
        if(valid)
        {
           HttpSession session = request.getSession();
           session.setAttribute("user", user);
           session.setAttribute("id", id);
           session.setMaxInactiveInterval(30*60);
		   String contextPath = "/";
           String encodedURL = response.encodeRedirectURL(contextPath);
           response.sendRedirect(encodedURL);
        }      
        else
		{
            out.println("Invalid User/Password!");
		}
        
        out.println("</html></body>");
        out.close();
    }
}

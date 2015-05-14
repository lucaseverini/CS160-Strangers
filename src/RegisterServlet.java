/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.sql.*;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Robert
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
 	private Properties props;
	private String dbUser;
	private String dbPassword;
	private String dbUrl;
	
	@Override
    public void init() throws ServletException
    {
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
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            Connection connection = null;
            Statement statement = null;
            String name = request.getParameter("username");
            String pass = request.getParameter("password");           
            try
            {
 		connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		statement = connection.createStatement();
                String query = "Select * from car_match.access where UserName='" + name + "'";
                //checking for empty fields
                if(name.equals("") || pass.equals(""))
                {
                    this.getServletContext().getRequestDispatcher("/blankfield.jsp").forward(request, response);
                    
                }
                else
                {
                    ResultSet rs = statement.executeQuery(query);
                    
                    // servlet checks if username is taken. If taken, then go to failure page.
                    if(rs.next())
                    {                    
                        request.setAttribute("username", name);
                        this.getServletContext().getRequestDispatcher("/registerfail.jsp").forward(request, response);
                    }
                    else
                    {
                        ResultSet idValue = statement.executeQuery("select max(User) from access");
                        //Fields of access table are User (int, essentially an id number), role (int, changes permission depending on number) username(string) pass(string)
                        //If the table is populated, the servlet increments the User table and inserts the data. Otherwise, it starts from one.
                        if(idValue.next())
                        {
                            int userId = idValue.getInt("max(User)")+1;
                            statement.executeUpdate("insert into access values (" + userId + ", 3, '" + name + "', '" + pass + "')");
                            request.setAttribute("username", name);
                            this.getServletContext().getRequestDispatcher("/registersuccess.jsp").forward(request, response);                             
                        }
                        else
                        {
                            statement.executeUpdate("insert into access values (1, 3, '" + name + "', '" + pass + "')");                       
                        }
                        idValue.close();
                        rs.close();
                    }
                }
                
            }
            catch(SQLException e)
            {
		PrintWriter out = response.getWriter();
                out.println("<html><body>" + e.getMessage() + "<br></br>");
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
    }
}
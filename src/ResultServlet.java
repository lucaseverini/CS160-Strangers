/*
	ResultServlet.java

    SJSU - CS160 - Strangers

	May-5-2015
*/

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;
import carmatch.beans.Vehicle;
import java.util.Properties;

//incomplete
public class ResultServlet extends HttpServlet
{
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
	
	@Override
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String maker = request.getParameter("maker");
		String model = request.getParameter("model");
		String priceTo = request.getParameter("priceTo");
		String priceFrom = request.getParameter("priceFrom");
		String query = "";
		
		Connection connection = null;
		Statement statement = null;
		
		LinkedList<Vehicle> cars = new LinkedList<Vehicle>();
		try
		{
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			statement = connection.createStatement();
			
			if (!maker.equals(""))
			{
				query += "SELECT * FROM vehicle WHERE manufacturer='" + maker + "'";
			}
			if (!model.equals(""))
			{
				query += "SELECT * FROM vehicle WHERE model='" + model + "'";
			}
			if ((!priceTo.equals("")) || !priceFrom.equals(""))
			{

				if ((!priceTo.equals("")) && !priceFrom.equals(""))
				{
					query += "SELECT * FROM vehicle WHERE price>=" + priceFrom + " AND price<= " + priceTo;
				}
				else if (!priceTo.equals(""))
				{
					query += "SELECT * FROM vehicle WHERE price<= " + priceTo;
				}
				else
				{
					query += "SELECT * FROM vehicle WHERE price>=" + priceFrom;

				}
			}
			
			ResultSet rs = statement.executeQuery(query); 
			while(rs.next())
			{
				Vehicle x = new Vehicle();
				x.setPrice(rs.getInt("Price"));
				x.setMaker(rs.getString("Manufacturer"));
				x.setModel(rs.getString("Model"));
				cars.add(x);
			}
			
			request.setAttribute("results", cars);
			this.getServletContext().getRequestDispatcher("/results.jsp").include(request, response);
			
			rs.close();	
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

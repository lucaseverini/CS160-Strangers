import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


//incomplete
/* This assumes that it will run as the top-level file, and includes results.jsp. But our search forms currently link directly to results.jsp.
We'll need to move some things around before this will work.
*/

public class ResultServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String price = request.getParameter("price");
		String sql = "vehicle";
		String query = "";
		String sqlResult = "";

		Connection connection = null;
		Statement statement = null;
		
		try
		{
			String url = ""; //Put in db location here 
			String username = ""; 
			String password = "";
			
			connection = DriverManager.getConnection(url, username, password);
			statement = connection.createStatement();
			
			if (!make.equals(""))
			{
				query += "SELECT * FROM vehicle where maker=" + make;
			}
			
			// Construct a LinkedList of Vehicles
			// Call request.setAttribute("results", <constructed list>)
			this.getServletContext().getRequestDispatcher("/results.jsp").include(request, response);
		}	
		catch(SQLException ex)
		{
			sqlResult = "Error: " + ex.getMessage();
		}
		finally
		{
			try
			{
				statement.close();
				connection.close();
			}
			catch(SQLException ex)
			{
				ex.printStackTrace();
			}
		}
	}
}

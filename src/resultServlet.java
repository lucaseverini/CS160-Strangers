import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
//incomplete
public class resultServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOExcepton
	{
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String price = request.getParameter("price");
		String sql = "vehicle";
		String query = "";
		try
		{
			String url = ""; //Put in db location here 
			String username = ""; 
			String password = ""
			Connection connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
			if (!make.equals(""))
			{
				query += "SELECT * FROM vehicle where maker=" + make;
			}
			/**
			 *
			 * need to output html 
			 * */

		}	
		catch(SQLException e)
		{
			sqlResult = "Error: " + e.getMessage();
		}
		
	}
	statement.close();
	connection.close();
}

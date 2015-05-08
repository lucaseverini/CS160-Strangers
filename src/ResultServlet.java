import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;
import carmatch.beans.Vehicle;
//incomplete
/* This assumes that it will run as the top-level file, and includes results.jsp. But our search forms currently link directly to results.jsp.
We'll need to move some things around before this will work.
*/
public class ResultServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String priceTo = request.getParameter("priceTo");
		String priceFrom = request.getParameter("priceFrom");
		String query = "";
		Connection connection = null;
		Statement statement = null;
		LinkedList<Vehicle> cars = new LinkedList<Vehicle>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/car_match"; // Need to switch away from hardcoded details
			String username = "root"; 
			String password = "root";
			connection = DriverManager.getConnection(url, username, password);
			statement = connection.createStatement();
			if (!make.equals(""))
			{
				query += "SELECT * FROM vehicle WHERE manufacturer=" + make;
			}
			if (!model.equals(""))
			{
				query += "SELECT * FROM vehicle WHERE model=" + model;
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
		catch(Exception e)
		{
			// TODO: Do something more user-friendly
			e.printStackTrace();
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

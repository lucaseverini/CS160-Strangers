import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;
//incomplete
public class resultServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOExcepton
	{
		Class.forName("com.mysql.jdbc.Driver");
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String priceTo = request.getParameter("priceTo");
		String priceFrom = request.getParameter("priceFrom");
		String query = "";
		String sqlResult = "";
		LinkedList<vehicle> cars = new LinkedList<vehicle>();
		try
		{
			String url = "jdbc:mysql://localhost:3306/car_match"; //Put in db location here 
			String username = "root"; 
			String password = "root"
			Connection connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
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
			request.setAttribute("results", cars)
			this.getServletContext().getRequestDispatcher("/results.jsp").include(request, response);
			rs.close();	
		}	
		catch(SQLException e)
		{
			sqlResult = "Error: " + e.getMessage();
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

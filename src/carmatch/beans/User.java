/*
	User.java

    SJSU - CS160 - Strangers

	May-5-2015
*/

package carmatch.beans;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * Java Bean for user data
 */
public class User implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	static Connection connection = null;
	static Statement statement = null;
	static String query = null;
	
	private long code;
	private String name;
	private String address;
	private String city;
	private String state;
	private String zip;
	private String email;
	
	public User() 
	{
		code = 0;
		name = "";
		address = "";
		city = "";
		state = "";
		zip = "";
		email = "";
	}

	public void setCode(long code) 
	{
		this.code = code;
		
		if(connection == null)
		{
			try
			{
				InputStream stream = this.getClass().getResourceAsStream("../build.properties");
				Properties props = new Properties();
				props.load(stream);	

				Class.forName("com.mysql.jdbc.Driver");
				String dbUser = props.getProperty("mysql-userid");
				String dbPassword = props.getProperty("mysql-password");
				String dbUrl = props.getProperty("mysql-url") + "/" + props.getProperty("mysql-db");

				connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				statement = connection.createStatement();
				query = "Select * from User where Code=" + this.code;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			} 
		}

        try
		{
			ResultSet rs = statement.executeQuery(query);
			if(rs.next())
			{
				name = rs.getString("Name");
				address = rs.getString("Address");
				city = rs.getString("City");
				state = rs.getString("State");
				zip = rs.getString("Zip");
				email = rs.getString("Email");
			}

			rs.close();			
		}
        catch(SQLException e)
        {
			e.printStackTrace();
        }
	}

	public long getCode() 
	{
		return code;
	}
		
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}

	public String getAddress() 
	{
		return address;
	}

	public void setAddress(String address) 
	{
		this.address = address;
	}
	
	public String getCity() 
	{
		return city;
	}

	public void setCity(String city) 
	{
		this.city = city;
	}
	
	public String getState() 
	{
		return state;
	}

	public void setState(String state) 
	{
		this.state = state;
	}

	public String getZip() 
	{
		return zip;
	}

	public void setZip(String zip) 
	{
		this.zip = zip;
	}
}
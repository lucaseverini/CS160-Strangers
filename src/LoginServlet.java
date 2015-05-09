import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class LoginServlet extends HttpServlet
{
    private String user;
    private String pass;
    private int id;
    public void init() throws ServletException
    {
        user = null;
        pass = null;
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        user = request.getParameter("user");
        pass = request.getParameter("pass");
        PrintWriter out = response.getWriter();
        
        out.println("<html><body>");
        boolean valid = false;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_match", "root", "password");
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery("Select * from  car_match.access where UserName='" + user + "' AND Password='" + pass + "'");
            if(rs.next())
            {
                valid = true;
                user = rs.getString("UserName");
                id = rs.getInt("User");
            }
            else
                valid = false;
            
            rs.close();
            s.close();
            con.close();
        }
        catch(SQLException e)
        {
            valid = false;
            out.println(e.getMessage() + "<br></br>");
        }
        catch(ClassNotFoundException e)
        {
            valid = false;
            out.println(e.getMessage() + "<br></br>");
        } 
        
        if(valid)
        {
           HttpSession session = request.getSession();
           session.setAttribute("user", user);
           session.setAttribute("id", id);
           session.setMaxInactiveInterval(30*60);
           String encodedURL = response.encodeRedirectURL("index.jsp");
           response.sendRedirect(encodedURL);
        }
        
        else
            out.println("Invalid User/Password!");
        
        
        out.println("</html></body>");
        out.close();
    }
}
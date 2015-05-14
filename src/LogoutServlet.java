/*
	LogoutServlet.java

    SJSU - CS160 - Strangers

	May-5-2015
*/

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	private Properties props;

	@Override
	public void init() throws ServletException
    {
        try
		{
			InputStream stream = this.getClass().getResourceAsStream("../build.properties");
			props = new Properties();
			props.load(stream);	
		}
        catch(Exception e)
        {
			e.printStackTrace();
        } 
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session = request.getSession(false);
        if(session != null)
        {
            session.invalidate();
        }
		
		String contextPath = "/";
        String encodedURL = response.encodeRedirectURL(contextPath);
        response.sendRedirect(encodedURL);
    }
}



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class connector
 */
@WebServlet("/connector")
public class connector extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		String s=request.getParameter("t1");
		String s1=request.getParameter("t2");
		if(s.equals("display all"))
		{
			
			RequestDispatcher r1=request.getRequestDispatcher("userdetails.jsp");
			r1.forward(request, response);
		}
		else if(s.equals("search User"))
		{
			
			RequestDispatcher r2=request.getRequestDispatcher("searchuser.jsp");
			r2.forward(request, response);
		}
		
		 else if(s.equals("delete User"))
		{
			
			RequestDispatcher r4=request.getRequestDispatcher("deluser.jsp");
			r4.forward(request, response);
		}
		 else if(s1.equals("send mail"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}

		
	
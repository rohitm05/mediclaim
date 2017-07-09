

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class userdata2
 */
@WebServlet("/userdata2")
public class userdata2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			String nm=request.getParameter("t1");
			String pass=request.getParameter("t2");
			if(nm.equals("admin")&&pass.equals("admin"))
			{
				HttpSession ses=request.getSession();
				ses.setAttribute("user", "admin");
				RequestDispatcher rd=request.getRequestDispatcher("staffprime.jsp");
				rd.forward(request, response);
			}
			else
			{
				PrintWriter pr=response.getWriter();
				pr.println("Login Failed");
				RequestDispatcher rd=request.getRequestDispatcher("insurancelogin.jsp");
				rd.include(request, response);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

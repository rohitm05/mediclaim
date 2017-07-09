

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
 * Servlet implementation class stafflogin
 */
@WebServlet("/stafflogin")
public class stafflogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			PrintWriter out=response.getWriter();
			String aid=request.getParameter("t1");
			String apass=request.getParameter("t2");
			if(aid.equals("admin")&&apass.equals ("admin"))
			{
				HttpSession ses=request.getSession(false);
				ses.setAttribute("admin", "admin");
				RequestDispatcher rd=request.getRequestDispatcher("staff_main.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("Wrong admin id or password");
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

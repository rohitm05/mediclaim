

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
 * Servlet implementation class logout1
 */
@WebServlet("/logout1")
public class logout1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	try
	{
		PrintWriter out=response.getWriter();
		HttpSession ses=request.getSession(false);
		ses.invalidate();
		out.println("You have been successfully logged out");
		RequestDispatcher rd=request.getRequestDispatcher("welcome.html");
		rd.include(request, response);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}

}

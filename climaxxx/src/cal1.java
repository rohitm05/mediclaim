

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import p1.connect;

/**
 * Servlet implementation class cal1
 */
@WebServlet("/cal1")
public class cal1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			PrintWriter out=response.getWriter();
			double bal=0.0,cov=0.0,bal3=0.0;
			HttpSession ses=request.getSession();
			Connection con=connect.getcon();
			String uid1=(String)ses.getAttribute("uid");
			String pr=(String)ses.getAttribute("pr");
			String dc=(String)ses.getAttribute("dc");
			String sql5="delete from disease2 where procode=?";
			System.out.println(pr);
			PreparedStatement ps3=con.prepareStatement(sql5);
			ps3.setString(1, pr);
			ps3.execute();
			RequestDispatcher rd=request.getRequestDispatcher("reject1.jsp");
			rd.include(request, response);
				
			
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}

}

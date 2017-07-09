

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import p1.*;
/**
 * Servlet implementation class signincheck
 */
@WebServlet("/signincheck")
public class signincheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		String s1=request.getParameter("t1");
		String s2=request.getParameter("t2");
		String sql="select * from usr where uid=? and password=?";
		Connection cn=connect.getcon();
		PreparedStatement ps=cn.prepareStatement(sql);			
		ps.setString(1, s1);
		ps.setString(2, s2);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			HttpSession ses=request.getSession();
			ses.setAttribute("users", s1);
			RequestDispatcher rd=request.getRequestDispatcher("cardnumber.jsp");
			rd.forward(request, response);
		}
		else
		{
			PrintWriter pr=response.getWriter();
			pr.println("Wrong user ID/Password combination");
			RequestDispatcher rd=request.getRequestDispatcher("clientsignin.jsp");
			rd.include(request, response);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

	}
}



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.jrockit.jfr.RequestDelegate;

import p1.connect;

import java.sql.*;
/**
 * Servlet implementation class uidcheck
 */
@WebServlet("/uidcheck")
public class uidcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			String uid=request.getParameter("t1");
			String sql="select cardno from usr where uid=?";
			Connection cn=connect.getcon();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, uid);
			ResultSet rs=ps.executeQuery();
			PrintWriter pr=response.getWriter();
			while(rs.next())
				{
					pr.println("Card number is "+rs.getString(1));
					RequestDispatcher rd=request.getRequestDispatcher("uidcheck.jsp");
					rd.include(request, response);
				}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

import p1.*;
import java.util.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import p1.connect;
import java.sql.*;
/**
 * Servlet implementation class release
 */
@WebServlet("/release")
public class release extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			PrintWriter pr1=response.getWriter();
			String st1=request.getParameter("t1");
			if(!st1.equals(""))
			{
			Connection cn=connect.getcon();
			String sql="delete from usr where cardno =?";
			String sql1="delete from card where cardno=?";
			String sql2="select name from usr  where cardno=?";
			PrintWriter pr=response.getWriter();
			PreparedStatement ps=cn.prepareStatement(sql);
			PreparedStatement ps1=cn.prepareStatement(sql1);
			PreparedStatement ps2=cn.prepareStatement(sql2);
			ps2.setString(1, st1);
			ResultSet rs=ps2.executeQuery();
			if(rs.next())
			{
			ps.setString(1, st1);
			ps1.setString(1, st1);
			ps1.execute();
			ps.execute();
			pr.println("User Deleted");
			RequestDispatcher rd=request.getRequestDispatcher("users.jsp");
			rd.include(request,response);
			}
			else
			{
				pr.println("Wrong card number");
				RequestDispatcher rd=request.getRequestDispatcher("deluser.jsp");
				rd.include(request,response);
			}

			}
			else
			{
				pr1.println("Card Number Should Not be blank");
				RequestDispatcher rd=request.getRequestDispatcher("deluser.jsp");
				rd.include(request,response);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}



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

import com.sun.jmx.snmp.agent.SnmpMib;

import java.sql.*;
import p1.connect;
import java.util.*;

/**
 * Servlet implementation class balinput
 */
@WebServlet("/balinput")
public class balinput extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pr=response.getWriter();
		try
		{
		String b=request.getParameter("t1");
		double bal=Double.parseDouble(b);
		if(!b.equals("")&&(b.charAt(0))!='-')
		{
		Connection cn=connect.getcon();
		HttpSession ses=request.getSession(false);
		String cd=(String)ses.getAttribute("curd");
		String sql1="select * from card where cardno=?";
		String sql="update card set insured=?,balamt=? where cardno=?";	
		PreparedStatement ps=cn.prepareStatement(sql);
		PreparedStatement ps1=cn.prepareStatement(sql1);
		ps1.setString(1, cd);
		ResultSet rs=ps1.executeQuery();
		if(rs.next())
		{
		String bal1=rs.getString(4);
		String rev=rs.getString(5);
		double rev1=Double.parseDouble(rev);
		double bal2=Double.parseDouble(bal1);
		bal=bal+bal2;
		double bal3 = bal-rev1;
		ps.setDouble(1, bal);
		ps.setDouble(2, bal3);
		ps.setString(3, cd);
		ps.execute();
		pr.println("MONEY ADDED SUCCESSULLY");
		RequestDispatcher rd=request.getRequestDispatcher("staffprime.jsp");
		rd.include(request, response);
		}
		}
		else
		{
			pr.println("INVALID INPUT");
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

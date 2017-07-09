

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;
import p1.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class diseasesubmit
 */
@WebServlet("/diseasesubmit")
public class diseasesubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		PrintWriter pr=response.getWriter();
		String code=request.getParameter("t1");
		HttpSession ses=request.getSession(false);
		String id=(String)ses.getAttribute("users");
		String sql=("insert into disease2 values(?,?,?)");
		Connection cn=connect.getcon();
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, code);
		int pc=(int)(Math.random()*10000);
		ps.setInt(3, pc);
		ps.execute();
		pr.println("Wait for claim approval");
		RequestDispatcher rd= request.getRequestDispatcher("claimapprove.jsp");
		rd.include(request, response);
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
}
}

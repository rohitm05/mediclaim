import java.io.File;
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
import javax.servlet.http.Part;

import p1.connect;

/**
 * Servlet implementation class cal
 */
@WebServlet("/cal")
public class cal extends HttpServlet {
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
			String sql="select coverage from disease_det where d_code=?";
			String sql6="select prevclaims from card where uid=?";
			String sql1="select balamt from card where uid=?";
			String sql5="delete from disease2 where procode=?";
			PreparedStatement ps=con.prepareStatement(sql);
			PreparedStatement ps1=con.prepareStatement(sql1);
			PreparedStatement ps6=con.prepareStatement(sql6);
			PreparedStatement ps3=con.prepareStatement(sql5);
			ps.setString(1, dc);
			ps1.setString(1, uid1);
			ps6.setString(1, uid1);
			ps3.setString(1, pr);
			ResultSet rs=ps.executeQuery();
			ps3.execute();
			if(rs.next())
			{
				String cov1=rs.getString(1);
				 cov=Double.parseDouble(cov1);
				 System.out.println(cov);
			}
			ResultSet rs1=ps1.executeQuery();
			if(rs1.next())
			{
				String bal1=rs1.getString(1);
				 bal=Double.parseDouble(bal1);
				 System.out.println(bal);
			}
			ResultSet rs6=ps6.executeQuery();
			if(rs6.next())
			{
				String bal4=rs6.getString(1);
				 bal3=Double.parseDouble(bal4);
				System.out.println(bal3);
			}
			if(bal>=cov)
			{
				double newbal=bal-cov;
				double s=cov+bal3;
				String sql3="update card set balamt=? ,prevclaims=? where uid=?";
				PreparedStatement ps2=con.prepareStatement(sql3);
				ps2.setDouble(1, newbal);
				ps2.setDouble(2, s);
				ps2.setString(3, uid1);
				ps2.execute();
				out.println("Money deducted successfully.Process successfully completed");
				RequestDispatcher rd=request.getRequestDispatcher("nodalapprove.jsp");
				rd.include(request, response);
			}
			else
			{
				out.println("Insufficient balance in Smart card of the user.Please send a mail to the insurance staff regarding that");
				RequestDispatcher rd=request.getRequestDispatcher("nodalapprove.jsp");
				rd.include(request, response);
				
			}
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}

}

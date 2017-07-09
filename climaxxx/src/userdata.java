

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import p1.connect;

/**
 * Servlet implementation class userdata
 */
@WebServlet("/userdata")
@MultipartConfig(fileSizeThreshold=1024*1,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class userdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR="image1";
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			PrintWriter out=response.getWriter();
			String savePath="C:"+File.separator+SAVE_DIR;//File.separator is used for "\" in windows
			File fileSaveDir=new File(savePath);//create the directory path where image will be uploaded
			
			if(!fileSaveDir.exists()){
				fileSaveDir.mkdir();
			}//check filder exists or not . If not then create the folder autometically
			
			String nm=request.getParameter("t1");
			String pass=request.getParameter("t2");
			String email=request.getParameter("t3");
			String mob=request.getParameter("t4");
			String addr=request.getParameter("t5");
			int id=(int)(Math.random()*1000);
			int cno=(int)(Math.random()*10000000);
			String cno1="ab"+cno;
			String uid="uid"+id;
			HttpSession ses=request.getSession();
			ses.setAttribute("userid", uid);
			HttpSession ses1=request.getSession();
			ses.setAttribute("cno", cno1);
			HttpSession ses2=request.getSession();
			ses.setAttribute("pass",pass );
			Part part=request.getPart("file");
			String filePath=extractFile(part);
			String fileName=filePath.substring(filePath.lastIndexOf("\\")+1,filePath.length());		
			part.write(savePath+File.separator+fileName);
			Connection con=connect.getcon();
			PreparedStatement ps=con.prepareStatement("insert into usr values(?,?,?,?,?,?,?,?)");
			PreparedStatement ps1=con.prepareStatement("insert into card values(?,?,?,?,?,?,?)");
			String fileAdd=savePath+File.separator+fileName;
			ps.setString(1, nm);
			ps.setString(2, pass);
			ps.setString(3, email);
			ps.setString(4, mob);
			ps.setString(5, fileAdd);
			ps.setString(6, addr);
			ps.setString(7,uid);
			ps.setInt(8,cno);
			ps1.setInt(1,cno);
			ps1.setString(2, nm);
			ps1.setString(3, mob);
			ps1.setString(4, "0");
			ps1.setString(5, "0");
			ps1.setString(6, "0");
			ps1.setString(7, uid);
			ps.execute();
			ps1.execute();
			RequestDispatcher rd=request.getRequestDispatcher("mailjsp.jsp");
			rd.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private String extractFile(Part part){
		String contentDisp=part.getHeader("Content-Disposition");
		String[] item=contentDisp.split(";");
		for (String s : item) 
		{
			if(s.trim().startsWith("filename")){
				return s.substring(s.indexOf("=")+2,s.length()-1);
			}
		}
		return "";
		
	}


	}

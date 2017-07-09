package p1;
import java.sql.*;
public class connect
{
	static String driver="com.ibm.db2.jcc.DB2Driver";
	static Connection cn=null;
	static String url="jdbc:db2://localhost:50000/claim";
	static String user="ROHITMUKHERJEE";
	static String pass="ARADHANA";
	public static Connection getcon()
	{
		try
		{
			Class.forName(driver);
			cn=DriverManager.getConnection(url,user,pass);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cn;
	}
}

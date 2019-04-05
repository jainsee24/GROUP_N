

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("uname");
		String pass=request.getParameter("password");
		 Connection con=null;
         Statement Stmt=null;
         ResultSet Res=null;
         try{
         	String url="jdbc:mysql://localhost:3306/COMPANY";
         	String user="root";
         	String pass1="ajit123q";
         	con=DriverManager.getConnection(url,user,pass1);
         	Stmt=(Statement) con.createStatement();
         	Res=((java.sql.Statement) Stmt).executeQuery("select * from INF where user='Harry'");
         	if(Res.next() && Res.getString("user").equals(uname) && Res.getString("password").equals(pass))
         	{
         	  RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("index.jsp");
         	  dispatcher.forward(request, response);
         	}
         	else
         	{
         		 RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("error.jsp");
            	  dispatcher.forward(request, response);
         	}
         
         }
         catch(SQLException e){
         	System.out.println("an error occured");
         	e.printStackTrace();
         }
	}

}

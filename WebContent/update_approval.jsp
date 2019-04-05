<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/COMPANY";
String user = "root";
String dbpsw = "ajit123q";
String status=request.getParameter("Approved");
//System.out.println("Yo man"+status.length);
String is_approved="false";
String user1=request.getParameter("person_approving");
String phd_guy=request.getParameter("phd_name");
if(status.equals("one"))
is_approved="true";	
String sql="UPDATE approval SET action_done='true',is_approved='"+is_approved+"' WHERE phd_name='"+phd_guy+"' AND person_approving='"+user1+"'";
try{
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	System.out.println("Database updated successfully");
}
catch(Exception e)
{
	e.getMessage();
}
%>
</body>
</html>
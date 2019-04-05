<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
            Connection con=null;
            Statement Stmt=null;
            ResultSet Res=null;
            try{
            	String url="jdbc:mysql://localhost:3306/COMPANY";
            	String user="root";
            	String pass="ajit123q";
            	String dbuser=(String)session.getAttribute("name");
            	String pass1=(String)session.getAttribute("password");
            	con=DriverManager.getConnection(url,user,pass);
            	Stmt=con.createStatement();
            	Res=Stmt.executeQuery("select * from phd_data where user='"+dbuser+"' and password='"+pass1+"';");
            	if(Res.next())
            	{
            	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">

[type="date"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
}
[type="date"]::-webkit-inner-spin-button {
  display: none;
}
[type="date"]::-webkit-calendar-picker-indicator {
  opacity: 0;
}

/* custom styles */
body {
  padding: 4em;
  background: #e5e5e5;
  font: 13px/1.4 Geneva, 'Lucida Sans', 'Lucida Grande', 'Lucida Sans Unicode', Verdana, sans-serif;
}
label {
  display: block;
}
input {
  border: 1px solid #c4c4c4;
  border-radius: 20px;
  background-color: #fff;
  padding: 3px 5px;
  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
  width: 300px;
}
	input {
    border: 5px solid white; 
    -webkit-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    -moz-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    padding: 15px;
    background: rgba(255,255,255,0.5);
    margin: 0 0 10px 0;
}

		p{
			font-size:20px;
		}
		h1{
			font-size: 20px;
		}
		h{
			font-size: 17px;
		}
		body{
			background-color: wheat;
			

  		}
  		h11{
  			font-size: 23px;
  		}
.header img {
  float: right;
  width: 350px;
  height: 300px;
  background: #555;
}
.form-submit-button {

background: #B9DFFF;

color: #fff;

border: 1px solid #eee;

border-radius: 20px;

box-shadow: 5px 5px 5px #eee;

text-shadow:none;

}

.form-submit-button:hover {

background: #016ABC;

color: #fff;

border: 1px solid #eee;

border-radius: 20px;

box-shadow: 5px 5px 5px #eee;

text-shadow:none;

}


	</style>
	<title>Thesis form </title>
</head><body>

	
	

<form action="save_form_fill.jsp" method="post" enctype="multipart/form-data" target="_blank" ">
	<p>To,<br>The Deputy/Assistant Registar (ACADEMIC)<br><br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspThe following student, registered for the Ph.D. Programme at IIT Indore, presented the <b>OPEN SEMINAR</b>, as per the details below.<br>
	</p>

	<div id ="aa" style="float: left;">
	<table cellpadding="10">

<tbody><tr>
<td><b><h1>Name of Ph.D. student: Mr./ Mrs.</b></h1></td>
<td><input type="text" name="First_Name" size="50" value=<%=Res.getString("name") %> readonly>
</td>
</tr>
<tr>
<td><b><h1>Roll No.</b></h1></td>
<td><input type="text" name="Roll_no" maxlength="50" size="50" value=<%=Res.getString("roll") %> readonly>  
</td>
</tr>
<tr>
<td><b><h1>Discipline/ Center/ School:</b></h1></td>
<td><input type="text" name="dcs" maxlength="50" size="50" value=<%= Res.getString("discipline") %> readonly>  
</td>
</tr>
 
 

<tr>
<td><b><h1>Date of joining the Ph.D. program</b></h1></td>
 <div class="sel sel--black-panther">
<td>
	<label for="dateofjoin"></label>
<input type="date" name="dateofjoin" id="dateofjoin" required="required" />
</td>
</tr>

<tr>
<td><b><h1>Date of Registration to the Ph.D. program</h1></b></td>
 
<td>
	<label for="dateofreg"></label>
<input type="date" name="dateofreg" id="dateofreg" required="required" />
</td>
<tr>
<td><b><h1>Date of Confirmation to the the Ph.D. programme</h1></b></td>
 
<td>
	<label for="dateofcon"></label>
<input type="date" name="dateofcon" id="dateofcon" required="required" />
</td>
</tr>

<tr>
<td><b><h1>Date of Open Seminar</h1></b></td>
 
<td>
	<label for="dateofsem"></label>
<input type="date" name="dateofsem" id="dateofsem">
</td>
</tr></table>
<br><br><br>

	<h11>Upload Thesis:</h11>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	 <input type="file" name="thesis" required>
<br>
<br>
<table>

	<tbody><tr>
		<td>
			<h1><b> Subject of gmail <input type="text" name="subject" required="required" /></b></h1>
		</td>
	</tr>
	<tr>
		<td>
			<h1><b>Recommadation/ Remarks of Dean, Academic Affairs : </b></h1>
		</td>
	</tr>
<tr><td></tr>
</tbody></table>
		<textarea rows="10" cols="100" name="comment1" placeholder="Write Recommadation here....." required="required" /></textarea ><br><br>

<h1><b>Email Address of professors...Separated by ',' : </b></h1>
<textarea rows="10" cols="100" name="all_emails" placeholder="Write all email address here......" ></textarea ><br><br>
		
<button type="submit" name="nameform" value="Submit" class="form-submit-button" align="center">Submit</button>

</div>
	<div class="header">
  <img src="C:\Users\Ajit123\workspace\Academic_portal\WebContent\logo.jpg" >
</div>

<div id="bb" style="float: left;background-color: red;"></div>
<iframe frameborder="0" scrolling="no" style="background-color: transparent; border: 0px; display: none;" src="./f_files/saved_resource.html"></iframe><div id="GOOGLE_INPUT_CHEXT_FLAG" input="" input_stat="{&quot;tlang&quot;:true,&quot;tsbc&quot;:true,&quot;pun&quot;:true,&quot;mk&quot;:true,&quot;ss&quot;:true}" style="display: none;"></div></body>
<%
            	}
            
            }
            catch(SQLException e){
            	System.out.println("an error occured");
            	e.printStackTrace();
            }
            
 %>
</html>
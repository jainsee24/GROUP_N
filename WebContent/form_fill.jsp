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
		p{
			font-size:20px;
		}
		h1{
			font-size: 20px;
		}
		h{
			font-size: 17px;
		}

	</style>
	<title>Approving</title>
</head>
<body>
	<script>
function myFunction() {
  var x = document.createElement("INPUT");
  x.setAttribute("type", "file");
  document.body.appendChild(x);
}
</script>
<form action="save_form_fill.jsp" method="post" id="nameform" enctype="multipart/form-data">
	<p>To,<br>The Deputy/Assistant Registrar (ACADEMIC)<br><br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspThe following student, registered for the Ph.H. Programme at IIT Indore, presented the <b>OPEN SEMINAR</b>, as per the details below.<br>
	</p>
	<table cellpadding = "10">
<!----- First Name ---------------------------------------------------------->
<tr>
<td><b>Name of Ph.D. student: Mr./ Mrs.</b></td>
<td><input type="text" name="First_Name" size="50" value=<%=Res.getString("name") %> readonly>
</td>
</tr>
<tr>
<td><b>Roll No.</b></td>
<td><input type="text" name="Roll_no" maxlength="50"/ size="50" value=<%=Res.getString("roll") %> readonly> 
</td>
</tr>
<tr>
<td><b>Discipline/ Center/ School:</b></td>
<td><input type="text" name="dcs" maxlength="50"/ size="50" value=<%= Res.getString("discipline") %> readonly> 
</td>
</tr>
 
 
<!----- Date Of Birth -------------------------------------------------------->
<tr>
<td><b>Date of joining the Ph.D. programme</b></td>
 
<td>
<select name="jphdd" id="jphdd" >
<option value="-1">Day:</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
 
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
 
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
 
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
 
<option value="31">31</option>
</select>
 
<select id="jphdm" name="jphdm">
<option value="-1">Month:</option>
<option value="January">Jan</option>
<option value="February">Feb</option>
<option value="March">Mar</option>
<option value="April">Apr</option>
<option value="May">May</option>
<option value="June">Jun</option>
<option value="July">Jul</option>
<option value="August">Aug</option>
<option value="September">Sep</option>
<option value="October">Oct</option>
<option value="November">Nov</option>
<option value="December">Dec</option>
</select>
 
<select name="jphdy" id="jphdy">
 
<option value="-1">Year:</option>

<option value="2019">2019</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
</select>
</td>
</tr>

<tr>
<td><b>Date of Registration to the Ph.D. programme</b></td>
 
<td>
<select name="rphdd" id="rphdd">
<option value="-1">Day:</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
 
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
 
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
 
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
 
<option value="31">31</option>
</select>
 
<select id="rphdm" name="rphdm">
<option value="-1">Month:</option>
<option value="January">Jan</option>
<option value="February">Feb</option>
<option value="March">Mar</option>
<option value="April">Apr</option>
<option value="May">May</option>
<option value="June">Jun</option>
<option value="July">Jul</option>
<option value="August">Aug</option>
<option value="September">Sep</option>
<option value="October">Oct</option>
<option value="November">Nov</option>
<option value="December">Dec</option>
</select>
 
<select name="rphdy" id="rphdy">
 
<option value="-1">Year:</option>

<option value="2019">2019</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
</select>
</td>
</tr>

<tr>
<td><b>Date of Confirmation to the the Ph.D. programme</b></td>
 
<td>
<select name="cphdd" id="cphdd">
<option value="-1">Day:</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
 
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
 
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
 
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
 
<option value="31">31</option>
</select>
 
<select id="cphdm" name="cphdm">
<option value="-1">Month:</option>
<option value="January">Jan</option>
<option value="February">Feb</option>
<option value="March">Mar</option>
<option value="April">Apr</option>
<option value="May">May</option>
<option value="June">Jun</option>
<option value="July">Jul</option>
<option value="August">Aug</option>
<option value="September">Sep</option>
<option value="October">Oct</option>
<option value="November">Nov</option>
<option value="December">Dec</option>
</select>
 
<select name="cphdy" id="cphdy">
 
<option value="-1">Year:</option>

<option value="2019">2019</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
</select>
</td>
</tr>

<tr>
<td><b>Date of Open Seminar</b></td>
 
<td>
<select name="dosd" id="dosd">
<option value="-1">Day:</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
 
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
 
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
 
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
 
<option value="31">31</option>
</select>
 
<select id="dosm" name="dosm">
<option value="-1">Month:</option>
<option value="January">Jan</option>
<option value="February">Feb</option>
<option value="March">Mar</option>
<option value="April">Apr</option>
<option value="May">May</option>
<option value="June">Jun</option>
<option value="July">Jul</option>
<option value="August">Aug</option>
<option value="September">Sep</option>
<option value="October">Oct</option>
<option value="November">Nov</option>
<option value="December">Dec</option>
</select>
 
<select name="dosy" id="dosy">
 
<option value="-1">Year:</option>

<option value="2019">2019</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
</select>
</td>
</tr>
<tr>
	<td></td>
	<td><h1>REPORT OF THE OPEN SEMINAR</h1></td>
</tr>
<tr><td colspan="2"><h1>The student submitted a comprehensive report of the research work carried out by him / her and made an oral presentation of the same to the PSPC members. The PSPC makes the following observations and recommendations.</h1></td></tr>
<tr><td colspan="2"><h>1.The work done by the candidate towards the degree of Doctor of Philosophy (Ph.D.) is, as of date: (please tick ONE of the two options (a) and (b) below)</h></td></tr>
<tr>
             <td colspan="2">
                 <div class="radio">
                     <label><input type="radio" id='regular' name="optradio">A) ADEQUATE for the submission of the Ph.D. Synopsis and Thesis to be submitted within maximum ONE month from the date of OPEN SEMINAR, incorporating the suggestions (if any) made in item 2, in consultation with the Ph.D. Supervisor.</td></tr></label>
                 </div>
             </td>
         </tr>
         <tr>
             <td colspan="2">
                 <div class="radio">
                     <label><input type="radio" id='express' name="optradio">B) INADEQUATE for the submission of the Ph.D. Synopsis and Thesis in its present form and major modifications / additions / changes are required. The student must incorporate the improvements / modifications / changes suggested in item 2, and give the OPEN SEMINAR again.</label>
                </div>
                </td>
         </tr>
<tr><td colspan="2">
2. Additional comments / observations / recommendations of the PSPC 
    <b>(please write on a  separate sheet  and attach. The student must also be given a copy).</b>
<input type="file" name="2f">
</td></tr>

<tr><td colspan="2">
	3. Publications arising out of the Ph.D. Thesis to be submitted <b>(please attached separate sheets with complete bibliographic details and indicating whether published / accepted / communicated).</b>
<input type="file" name="3f">

</td></tr>

<tr><td colspan="2">
	4. Other Recognition in the form of patents/awards/fellowship/etc. from the Ph.D. Thesis.
    <b>(please attach a separate sheet with complete details).</b>

<input type="file" name="4f">

</td></tr>
</table>
<br><br><br>
<table cellpadding="10" border="2px" align="center">
	<tr>
			<col width="200">
			<col width="300">
			<col width="300">
		<td colspan="3" align="center">  
<h><b>Names and Signatures with Date of all the Members of the OPEN SEMINAR Panel:</b> </h>
</td>
	</tr>
		<tr>
			
			<td></td>
		<td align="center"><h1>Name</h1></td>
		<td align="center"><h1>Signature with date</h1></td>
</tr>
<tr>
	<td rowspan="3"><h1><b>Ph.D Supervisors</b></h1></td>
	<td>1. <input type="text" name="n11"></td>
	<td><input type="file" name="s11"></td>
</tr>
<tr>
	<td>2. <input type="text" name="n12"></td>
	<td><input type="file" name="s12"></td>
</tr>
<tr>
	<td>3. <input type="text" name="n13"></td>
	<td><input type="file" name="s13"></td>
</tr>

<tr>
	<td rowspan="3"><h1><b>Other PSPC Members(Atleast two)</b></h1></td>
	<td>1. <input type="text" name="n21"></td>
	<td><input type="file" name="s21"></td>
</tr>
<tr>
	<td>2. <input type="text" name="n22"></td>
	<td><input type="file" name="s22"></td>
</tr>
<tr>
	<td>3. <input type="text" name="n23"></td>
	<td><input type="file" name="s23"></td>
</tr>

<tr >
	<td rowspan="4" height="200px">
		<h1>Must be forwarded through Convener, <b>Discipline Post Graduate Committee (DPGC):</b></h1>
	</td>
	<td rowspan="4" colspan="2" style="width: 259px; vertical-align:top" height="200px"><h1>Recommendation/Remarks of Convener, DPGC:<br>
		<textarea rows="4" cols="50" name="comment" form="usrform" placeholder="Enter Text here...."></textarea><br><br>
		Signature With Date: <input type="file" name="sgndpgc"><br>Name:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="Namedpgc">

	</h1></td>
</tr>
</table>
<table>
	<tr>
		<td>
			<h1><b>Number of additional sheets attached <input type="text" name="addsheet"></b></h1>
		</td>
	</tr>
	<tr>
		<td>
			<h1><b>Recommadation/ Remarks of Dean, Academic Affairs : </b></h1>
		</td>
	</tr>
<tr><td>
	<h1>Upload Thesis:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h1>
	 <input id="thesis1" type="file" name="thesis"></td>
</tr>
</table>

		<textarea rows="10" cols="100" name="comment1" form="usrform1" placeholder="Enter Text here....">
</textarea><br><br>

<button type="submit" name="nameform" value="Submit">Submit</button>

</form>
</body>
<%
            	}
            
            }
            catch(SQLException e){
            	System.out.println("an error occured");
            	e.printStackTrace();
            }
            
 %>
</html>
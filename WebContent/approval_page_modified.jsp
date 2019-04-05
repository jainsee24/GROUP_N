<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Approving Form</title>
	<style type="text/css">
			body {
				background-color: wheat;
		  padding: 4em;
		  font: 13px/1.4 Geneva, 'Lucida Sans', 'Lucida Grande', 'Lucida Sans Unicode', Verdana, sans-serif;
		}
:root {
	--primary-c: #2196F3;
	--secondary-c: #B2D7F5;
	
	--white: #FDFBFB;
	
	--text: #082943;	
	--bg: var(--primary-c);
}

ul {
	list-style-type: none;
	padding-left: 50px;
	margin: 0;
}

li {
	display: block;
	position: relative;
	padding: 20px 0px;
}

h2 {
	margin: 10px 0;
	font-weight: 900;
}
.card {
	display: flex;
	flex-direction: column;	
	background: var(--white);
	width: 300px;
	padding: 20px 25px;
	border-radius: 20px;
	box-shadow: 0 19px 38px rgba(0, 0, 0, 0.13);
}

input[type=radio] {
	position: absolute;
	visibility: hidden;
}

label { 
	cursor: pointer; 
	font-weight: 400;
}

.check {
	width: 30px; height: 30px;
	position: absolute;
	border-radius: 50%;
	transition: transform .6s cubic-bezier(0.68, -0.55, 0.27, 1.55);
}

/* Reset */
input#one ~ .check { 
	transform: translate(-50px, -25px); 
	background: var(--secondary-c); 
}
input#two ~ .check { 
	transform: translate(-50px, -83px); 
	background: var(--primary-c);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

/* Radio Input #1 */
input#one:checked ~ .check { transform: translate(-50px, 33px); }

/* Radio Input #2  */
input#two:checked ~ .check { transform: translate(-50px, -25px); }



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
		#a{
			height: 600px;
			width: 400px;
			float: left;
		}
		#b{
			background-color: lightblue;
				height: 640px;
				width: 500px;
					float: left;
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
</head>
<script type="text/javascript">
$(document).ready(function() {
    $("#formID").validate({
        rules : {
            login : {
                required : true                 
            }
        },
    });
});
</script>
<body>

	<form action="update_approval.jsp" method="post"  required="required" id="formID">
		<div id="a"></div>
		<div id="b">
			<div id="d" align="center"	>
				<h1>Approved By</h1>
				<input type="text" name="person_approving" required="required" />
				<br>
				<br>
				<h1>Approved To (Ph.D. Student)</h1>
				<input type="text" name="phd_name" required="required" />
				<br>
				<br>
				<div class="card">

	<h2>Please Select one of the followings options-</h2>
	
	<ul>
		<li>
			<input type="radio" name="Approved" id="one" value="one" checked  required="required" />
			<label for="one">Approved</label>
			
			<div class="check"></div>
		</li>
		
		<li>
			<input type="radio" name="Approved" id="two" value="two" required="required" />
			<label for="two">Not Approved</label>
			
			<div class="check"></div>
		</li>
	</ul>
</div>
<br><br>
			<input type="submit" value="Submit" align="center" class="form-submit-button">
			</div>
		</div>

	</form>
</body>
</html>
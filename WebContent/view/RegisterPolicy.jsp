<%@ page import="com.policy.data.Policy" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.policy.service.PolicyService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1,Unicode #8896 / U+22C1 " pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*, java.lang.*" %>


<!DOCTYPE html> <!-- created by Hamza at 3pm   -->
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  


</head>
<body>
<div class="container">
  <div  id="form_style" >
  
 <header id="RegisterPolicy">

  <form id="CreateFormUI" method= "post" action ="../MainServlet" onsubmit="getFormData(request,response)" >
  	<div class="form-group">
		<table align="center" >
			<h1 align="center"> Register Policy </h1>
			<tr> 
			
				<td> Policy Name </td>
				<td> <input type="text" name="policy_name" required = "required" pattern="([^\s][A-z0-9\s]+){2,100}"/> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td>   <button type="reset" value="Reset">Reset form</button> </td>
				
			</tr>
				
				
			
			<tr>
				<td> Type of Insurance </td>
				<td> <input type="text" name="policyType" required = "required" pattern="([^\s][A-z0-9\s]+){2,100}"/> </td>
				
			</tr>
				
			<tr>	
				<td> Number of Nominee's </td>
				<td>
						
					<input type="text" name="nominee" id="display" value="0" oninput="updateNumber()" required="required" pattern="^[0-9]*$" >
				    <input type="button" value="+" id="inc" onclick="incNumber()"/>
				    <input type="button" value="-" id="dec" onclick="decNumber()"/>
				</td> 
			</tr>

    			<tr> 
	    			<td> Tenure </td>
	    			<td> <br>
	    				<input type="radio" name="year" value="1" checked onclick="hide();"/> 1 Year<br>
	  					<input type="radio" name="year" value="2" onclick="hide();"/> 2 Year<br>
	  					<input type="radio" name="year" value="3" onclick="hide();" /> 3 Year <br>
	    				<input type="radio" name="year" value="custom" id="cust" onclick="show();" /> Custom	 
	    				<input type="text" 	name="year" value="4" id="area" style= "display: none;" oninput="validate()">
 				
	    			</td>
				</tr>
			
				<tr> 
					<td> Sum Assured </td>
					<td> <br>
						 Min: <input type="text" id="min" name="min" value="0" oninput="validate()"/> <br>
					     Max:<input type="text" id="max" name="max" value="1"  oninput="validate()" />
					</td>
				</tr>
<!-- 				<tr> 
					<td> List Pre-Requisites</td>
					<td>
				   		
				   		<div id="certificationtog">
						   <p class="setting">
						   	<br>
						   	  <input type="button" id="addrows" name="add rows" class="addperson" value="Add Rows" onclick="add();" />
						      <input type="button" id="removerows" class="removerows" value="Delete Rows" onclick="remove();" />  
						      <br>
						    <span id="myspan" ></span>
						   	<span style="width: 0px; margin-left: 20px; font-weight: bold; float: none; ">  <br>
						        
						      </span>

						     
						      <br><br>

						   </p>
						</div>
					</td>
				</tr> -->
				
				<tr>
					<td> Pre-req </td>
					<td><br><br>
					<textarea rows="4" cols="50" placeholder="input your pre-req" name="pre-req">
					</textarea>
				 	</td>
				
				</tr>
				
			
		</table>
		
		<div class="clearfix" align="center">
			
			<input type="submit" value="Register" id="check" />
			<button type="cancel" class="cancelbtn">Cancel</button>
			
    	</div >
		<div align="center">
			<a href="url"></a>
			<p><a href="#" style="color:dodgerblue">Click here</a> to login.</p>
		</div>
		</div>
		
	</form>
	</header>
	</div>
	</div>
	
	<script src = "../javascript/PolicyValidation.js"> </script>
</body>
</html>
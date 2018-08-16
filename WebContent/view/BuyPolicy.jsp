<!--  Created by Domenic Garreffa August 4:30  -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<script type="text/javascript" src="../javascript/BuyPolicyLogic.js">
</script>

<title>Buy a policy</title>
</head>
<body>

<div class = "container">
<h1> Purchase a Policy</h1>

	<form>
	  <!-- TODO: Fill in with data from DB 
	  		-Domenic Garreffa  9:36 Aug 15, 2018
	  	-->
	  <div class="form-group">
	    <label for="insuranceTypes">Insurance Types</label>
	    <select class="form-control" id="insuranceTypes" name="insuranceTypes">
	      <option>Accidental</option>
	      <option>term</option>
	      <option>Pension Scheme</option>
	    </select>
	  </div>
	  
	   
	  <!-- TODO: Fill in with data from DB 
	  		-Domenic Garreffa  9:35 Aug 15, 2018
	  	-->
	  <div class="form-group">
	    <label for="policies">Policy Types</label>
	    <select class="form-control" id="policies" name="policies">
	      <option>Populate </option>
	      <option>term</option>
	    </select>
	  </div>
	  
	  <!-- TODO: Fill in with data from DB 
	  		-Domenic Garreffa  9:30 Aug 15, 2018
	  	-->
	  <p>Tenure: 1 year  </p>
	  
	  <div class="form-group">
	    <label for="premium">Select Premium</label>
	    <select class="form-control" id="premium" name = "premium">
	      <option>Quarterly</option>
	      <option>Half-Yearly</option>
	      <option>Annually</option>
	    </select>
	  </div>
	  
	  <!-- TODO: Populate select with data from DB 
	  		-Domenic Garreffa 9:34 Aug 15, 2018
	  	-->  
	  	<!-- Min is 500 and max is 1000. Dynamically
	  	add values in increments of 100?
	  		Domenic Garreffa 4:45 Aug 14, 2018
	   -->
	 <div class="form-group">
	   <label for="sumAssured">Select Sum Assured</label>
	   <select class="form-control" id="sumAssured" name="sumAssured">
		    <option>500</option>
		    <option>600</option>
	      	<option>700</option>
		    <option>800</option>
		    <option>900</option>
		    <option>1000</option>
	   </select>
	 </div>
	  
	  <!-- TODO: Premium value is dynamically shown  
	  		-Domenic Garreffa 9:37 Aug 15, 2018
	  	--> 
	<p>Premium Amount: 1 year  </p>
	  
	<div class="form-group">
	   <label for="birthCertificate">Upload birth certificate</label>
	   <input type="file" class="form-control-file" id="birthCertificate" name="birthCertificate">
	</div>
	  
	<div class="form-group">
	    <label for="panCard">Upload PAN card</label>
	    <input type="file" class="form-control-file" id="panCard" name="panCards">
	  </div>
	
	 <!-- TODO: Populate the check boxes with medical questions from DB  
	  		-Domenic Garreffa 9:55 Aug 15, 2018
	  	--> 
	<p> Check all that apply </p>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="medicalDetail1" name="medicalDetails">
	  <label class="form-check-label" for="defaultCheck1">
	    Medical Question 1
		</label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="" id="medicalDetail2" name="medicalDetails">
	  <label class="form-check-label" for="defaultCheck2">
	    Medical Question 2
	  </label>
	</div>
	
	 <!-- TODO: Populate the drop down with a list of agent IDs/possibly names 
	  		-Domenic Garreffa 10:21 Aug 15, 2018
	  	--> 
	<div class="form-group">
	    <label for="agents">Agent name</label>
	    <select class="form-control" id="agents" name="agents">
	      <option>(id) Joe Schmo</option>
	      <option>Barry Young</option>
	      <option>Jerry Something))</option>
	    </select>
	  </div>
	  
	    <!-- TODO: Policy initiation date to be dynamically added  
	  		-Domenic Garreffa 10:20 Aug 15, 2018
	  	--> 
	<p>Policy Initiation Date: August 20, 2018  </p>
	  
	<hr>
	<p> Nominees <p>
	<div class="form-group row">
	    <button type="button" id="addNomineeButton" class="btn btn-primary btn-sm m-2" onclick="addNominee();">Add</button>
		<button type="button" id="removeNomineeButton" class="btn btn-secondary btn-sm m-2" onclick="removeNominee();">Remove</button>
    </div>
	
	  <div class = "row" id = "nominees">
	
	  </div>
	<hr>
</form>

<!-- TODO: Redirect only if the user confirmed the purchase.  -->
	<div class="form-group row">
	    <button type="button" id="buyPolicy" class="btn btn-success  m-2" name="buyPolicy" onclick="promptUserBeforeBuying();">Buy</button>
		<button type="button" id="cancel" class="btn btn-danger  m-2" name="cancel">Cancel</button>
    </div>
</div>
</body>
</html>
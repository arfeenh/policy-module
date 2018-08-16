<!--  Created by Domenic Garreffa on Aug 16-->

<%@ page import="com.policy.data.Policy"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	Policy policy = (Policy)session.getAttribute("policy");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="alert alert-success" role="alert">
	  Policy is successfully registered!
	</div>
	<div class = "container">
		<div class="jumbotron">
		  
		  <p> Policy Name: </p> <h1 class="display-4" > <%= '\t' + policy.getPolicyName() %></h1>
		  
		  <p class="lead"> id: <%= policy.getPolicyId() %></p>
		  <hr class="my-4">
		  <p> Number of Nominees: <%= policy.getNumberNominees()  %></p>
		  <p> Tenure: <%= policy.getTenure()  %> years  </p>
		  <p> Sum Assured: $<%= policy.getMinSum() %> - $<%= policy.getMaxSum() %> </p>
		  
		  <!-- Add new line in between each pre-requisite -->
		  <p> Pre-Requisites: <%= policy.getPreReqs() %> </p>
		   
		  <form method = "get" action="../MainServlet">
		  <button class="btn btn-primary btn-lg" type = "submit" name="action" value="viewPolicyBackButton"> Back </button>		  
		  </form>
		</div>
	</div>
		
</body>
</html>
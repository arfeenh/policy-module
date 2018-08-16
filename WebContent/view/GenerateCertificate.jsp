<!-- CREATED BY NICHOLAS KAULDHAR -->
<!-- August 16 2018 3:00PM -->
<!-- Certificate Generation Screen (Admin view) -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Certificate</title>
<%@ page import="com.policy.data.Policy" %>
<%@ page import= "com.policy.dao.PolicyDao" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
</head>
<body>

<form action = "../CertServlet" method = "get">
	Select Policy : 
	<select name = "policyID">
		<%
			try {
				List<Policy> k;
				if (session.getAttribute("allPolicies") == null){
					k = PolicyDao.getAllPolicies();
					session.setAttribute("allPolicies", k);
				}
				else{
					k = (List<Policy>)session.getAttribute("allPolicies");
				}
				
				for(int x = 0; x < k.size(); x++){
					%><option value = "<%= k.get(x).getPolicyId() %>"><%=k.get(x).getPolicyName() %></option> <%
				}
			}     
			catch(Exception e){
				e.printStackTrace();
			}
	
		%>
	</select><br>
	Enter Customer ID: 
	<input type = "text" name = "customerID"><br>
	<input type = "submit" value = "Generate Certificate">
	
	
</form>
</body>
</html>
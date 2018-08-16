<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.policy.data.Nominee"%>
<%@ page import="com.policy.data.Policy"%>
<%@ page import="java.text.Format"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	// Dummy policy data	
	Policy policy = new Policy();
	policy.setPolicyId(1);
	policy.setPolicyName("Tom cat");
	policy.setTenure(1.1);
	policy.setMinSum(100.50);
	policy.setMaxSum(1000000.50);
	policy.setPaymentsPerYear(2);
	policy.setPremiumAmonut(2500);
	policy.setStartDate(new Date());
	
	// Nominee data
	List<Nominee> myNominees = new ArrayList<Nominee>();
	myNominees.add(new Nominee());
	myNominees.add(new Nominee());
	myNominees.add(new Nominee());
	myNominees.get(0).setNomineeName("Nominee A");
	myNominees.get(1).setNomineeName("Nominee B");
	myNominees.get(2).setNomineeName("Nominee C");
	//policy.setNominees(myNominees);
	policy.setNumberNominees(myNominees.size());
	
	// Dummy session object
	session.setAttribute("policy", policy);
	Policy myPolicy = (Policy)session.getAttribute("policy");
	
	// Get values from the session object
	int policyId = myPolicy.getPolicyId();
	String policyName = myPolicy.getPolicyName();
	double policyTenure = myPolicy.getTenure();
	String sumAssured = "$" + (int)myPolicy.getMinSum() + " to $" + (int)myPolicy.getMaxSum();
	//List<Nominee> policyNominees = myPolicy.getNominees();
	int paymentsPerYear = myPolicy.getPaymentsPerYear();
	String premiumType;
	if(paymentsPerYear == 1) {
		premiumType = "Annually";
	} else if(paymentsPerYear == 2) {
		premiumType = "Half-yearly";
	} else if(paymentsPerYear == 4) {
		premiumType = "Quarterly";
	} else {
		premiumType = "Undefined";
	}
	
	double premiumAmount = myPolicy.getPremiumAmount();
	
	// convert startDate to expireDate
	Date startDate = myPolicy.getStartDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	cal.setTime(startDate);
	cal.add(Calendar.YEAR, (int)policyTenure);
	cal.add(Calendar.MONTH, (int)((policyTenure-(int)policyTenure)*10));
	String expireDate = sdf.format(cal.getTime());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Policy</title>
<style>
body {
	margin: 10px;
}

#policy-details {
	text-align: center;
}

table {
	margin: 25px auto 25px auto;
	text-align: left;
}

td {
	padding: 5px 15px;
}

.tbl-labels {
	font-weight: bold;
}

button {
	text-align: center;
	margin: 10px 20px 10px 20px;
	padding: 10px 20px;
}
</style>
</head>
<body>
	<div id="policy-details">
		<h1>Policy Details</h1>
		<table>
			<tr>
				<td class="tbl-labels">Policy ID</td>
				<td class="tbl-data"><%= policyId %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Policy Name</td>
				<td class="tbl-data"><%= policyName %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Tenure</td>
				<td class="tbl-data"><%= policyTenure %> Year(s)</td>
			</tr>
			<tr>
				<td class="tbl-labels">Premium Type</td>
				<td class="tbl-data"><%= premiumType %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Premium Amount</td>
				<td class="tbl-data">$<%= premiumAmount %></td>
			</tr>
			<%
				for (int i = 0; i < myNominees.size(); i++) {
			%>
			<tr>
				<td class="tbl-labels">Nominee</td>
<%-- 				<td class="tbl-data"><%= policyNominees.get(i).getNomineeName() %></td>
 --%>			</tr>
			<%
				}
			%>
			<tr>
				<td class="tbl-labels">Sum Assured</td>
				<td class="tbl-data"><%= sumAssured %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Policy Expire Date</td>
				<td class="tbl-data"><%= expireDate %></td>
			</tr>
		</table>
		<button id="update-nominees">Update Nominees</button>
		<button id="go-back-customer-home">Go Back</button>
	</div>
	<script>
		// Button click event listener for update nominees;
		// When clicked, redirect page to "updateNominees.jsp"
		document.getElementById("update-nominees").addEventListener("click",
				function() {
					window.location.href = "updateNominee.jsp";
				});

		// Button click event listener for go back button;
		// When clicked, redirect page to customer home page
		document.getElementById("go-back-customer-home").addEventListener(
				"click", function() {
					// window.location.href = "updateNominee.jsp";
					alert("Go back to customer homepage");
				});
	</script>
</body>
</html>
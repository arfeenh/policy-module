package com.policy.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.policy.data.Policy;
import com.policy.service.PolicyService;
import com.policy.dao.PolicyDao;
/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * Use this to differentiate multiple submit buttons in a single form
		 * 
		 * Updated by Domenic Garreffa on Aug 16, 2018
		 */
		String action = request.getParameter("action");
		if(action != null) {
			switch(action) {
			case "viewPolicyBackButton": 
				request.getSession().removeAttribute("policy");
				response.sendRedirect("view/admin.jsp");
				break;
		}
			return;
		}
		
		// TODO Auto-generated method stub
		HttpSession hses = request.getSession(true);
		
		//SERVLET WILL SEND AGENT ID CALLING A FUNCTION OF A CLASS AND RETURN A STRING OF CUSTIDS.
		response.setContentType("text/html");
		if (request.getParameter("SearchCust")!=null) {
			String[] array = {"1","2","3","4","5"}; //RETRIEVE CUSTOMER ARRAY
			
			String agentid = request.getParameter("agent");
			if (agentid!=null) {
				hses.setAttribute("agentid", agentid);
			}else {
				hses.setAttribute("agentid", " ");
			}
			hses.setAttribute("custid", array);
			getServletContext().getRequestDispatcher("/ViewPolicyByAgent.jsp").forward(request, response);
		}else if (request.getParameter("SearchPolicy")!=null) {
			
			String[] array = {}; //RETRIEVE POLICY ARRAY
			
			String custid = request.getParameter("custid");
			hses.setAttribute("cust", custid);
			hses.setAttribute("policyid", array);
			getServletContext().getRequestDispatcher("/ViewPolicyByAgent.jsp").forward(request, response);
		}else if (request.getParameter("view")!=null) { //AFTER CLICKING VIEW POLICIES.
			String policyid = request.getParameter("policyid");
			hses.setAttribute("policyid", policyid);
			String agentid = (String) hses.getAttribute("agentid");
			String custid = (String) hses.getAttribute("cust");
			System.out.println(agentid);
			System.out.println(custid);
			System.out.println(policyid);
		}	
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String referer = request.getHeader("referer"); //added by hamza 16 aug 11pm
		
		if(referer.contains("RegisterPolicy.jsp")) {
		   	HttpSession ses = request.getSession();
		   	
		   	String polName = request.getParameter("policy_name");
		   	ses.setAttribute("policy_name", polName);
	   		 
			int numNominees = Integer.parseInt(request.getParameter("nominee"));
		   	ses.setAttribute("nominee", numNominees);
		   	
			double numTenure = Double.parseDouble(request.getParameter("year"));
		   	ses.setAttribute("year", numTenure);
		   	
		   	double minSum = Double.parseDouble(request.getParameter("min"));
		   	ses.setAttribute("min", minSum);
		   	
		   	double maxSum = Double.parseDouble(request.getParameter("max"));
		   	ses.setAttribute("max", maxSum);
		   	
		   	String preReq = request.getParameter("pre-req");
		   	ses.setAttribute("pre-req", preReq);
		   	
		   	String PolicyType = request.getParameter("policyType");
		   	ses.setAttribute("policyType", PolicyType);
		   	
		   	Policy obj = new Policy();
		   	
		   	obj.setPolicyName(polName);
		   	obj.setNumberNominees(numNominees);
		   	obj.setTenure(numTenure);
		   	obj.setMinSum(minSum);
		   	obj.setMaxSum(maxSum);
		   	obj.setPreReqs(preReq);
		   	obj.setPolicyType(PolicyType);
		   	
		   	ses.setAttribute("policy", obj);

		   	
		   	PolicyService obj1 = new PolicyService();
		   	obj1.addPolicy(obj);
		   	
		   	
		   	response.sendRedirect("view/ViewPolicy.jsp");
		}
		else if(referer.contains("UpdatePolicy.jsp")) {
			PolicyDao array = new PolicyDao();
			//array.selectAllPolicyNameAndPolicyID()
		}

	 
	}
}

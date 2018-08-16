/**
 * Created by Domenic Garreffa on Aug 15.
 * 
 * This is a service class and also known as a business logic class. 
 * Add any validation checks or access data using DAO's in this class.
 * 
 */
package com.policy.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.policy.dao.PolicyDao;
import com.policy.data.Policy;

public class PolicyService {
	private PolicyDao policyDao;
	
	public PolicyService() {
		this.policyDao = new PolicyDao();
	}
	
	
	
	/**
	 * Generates a unique PolicyID and inserts a Policy into the database.
	 * @param policy - An initialized policy object 
	 * @return true if the policy was successfully added and false otherwise.
	 */
	public boolean addPolicy(Policy policy){
		if(policy == null) {
			System.out.println("Policy object given is null");
			return false;
		}
		
		//Access PolicyDAO for max ID
		Integer uniqueID = null;
		//Add one to ensure uniqueness.
		try {
			uniqueID = policyDao.getLargestID() + 1;
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		if(uniqueID == null) {
			uniqueID = 101; //No Policies exist. This is the starting policy ID
		}
		
		//Set ID.
		policy.setPolicyId(uniqueID);
		
		boolean isInserted = false;
		try {
			isInserted = policyDao.insert(policy);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isInserted;
	}
	
	public ArrayList<String> getAllPoliciesNameAndID() {
		try {
			
			return policyDao.selectAllPolicyNameAndPolicyID();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("No policies exist");
		return null;
	}
	
	public Policy getPolicyById(int ID) {
		try {
			return policyDao.selectAllPolicyByID(ID);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}

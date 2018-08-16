/*
 * Created by Domenic Garreffa on August 15, 2018
 */

var nomineeForm = `
	<div class="card-header">
	<!--  Name  -->
	 	<div class="form-group">
		    <label for="name">Enter nominee name</label>
		    <input type="text" class="form-control" id="name" >
	 	</div>
	</div>
	<div class="col card-body"x>
	 	<!-- Relationship -->
	 	<div class="form-group">
		   <label for="relationship">Select relationship</label>
		   <select class="form-control" id="relationship" name="relationship">
			    <option>Father</option>
			    <option>Mother</option>
		      	<option>Spouse</option>
		   </select>
		 </div>
		 
		 <!--  Purpose  -->
	 	<div class="form-group">
		    <label for="purpose">Purpose</label>
			<textarea id="purpose" name="purpose" class="form-control" rows="2" id="comment"></textarea>  	
	   </div>
	   
	   <!--  Name  -->
	 	<div class="form-group">
		    <label for="percentage">Enter a percentage between 0 and 100</label>
		    <input type="text" class="form-control" id="percentage" name="percentage" >
	 	</div>
	 	
	 	<div class="form-group">
		    <label for="identification">Upload identification</label>
		    <input type="file" class="form-control-file" id="identification" name="identification">
		</div>
	</div>
	</div>`;

	var numberOfNominees = 0;
	//TODO - Change this number based off 
	var maxNumberOfNominees = 3; //Get from DB

	function addNominee(){
		numberOfNominees++;
		if(numberOfNominees > maxNumberOfNominees){
			numberOfNominees = maxNumberOfNominees;
			return;
		}
		
		var updatedNomineeForm = '<div class="col card m-1" id = "nominee' + numberOfNominees + '">' + nomineeForm; 
		console.log(updatedNomineeForm);
		var nominees = document.getElementById("nominees");
		nominees.insertAdjacentHTML('beforeend', updatedNomineeForm);
	}
	
	function removeNominee(){
		if(numberOfNominees <= 0){
			return;
		}
		var nominee = document.getElementById("nominee" + numberOfNominees);
		numberOfNominees--;
		nominee.remove();
		
	}
	
	
	function promptUserBeforeBuying(){
		window.confirm("Are you sure you want to submit?");
	}
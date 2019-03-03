<?php

$con = new mysqli("localhost", "root", "","software");
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

$usertype=$_GET["usertype"];


	if($usertype !="")
	{
	$res=mysqli_query($con,"SELECT * FROM user_type_option INNER JOIN usertype ON usertype.UserType_Id='". $usertype."' AND user_type_option.usertype_ID='". $usertype."' ");
 	    echo"<select>";
		
		//test
		while($row=mysqli_fetch_array($res))
	{  
		echo"<option>".$row['ID']."</option>";
	
	}
	echo"</select>";
	} 
	

	
?>
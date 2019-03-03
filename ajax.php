<?php

$con = new mysqli("localhost", "root", "","software");
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

$Country=$_GET["Country"];


	if($Country !="")
	{
	$res=mysqli_query($con,"select *
					   from address 
					   where  $Country=SRK ");
	    echo"<select>";
	while($row=mysqli_fetch_array($res))
	{  
		echo"<option>".$row['Address']."</option>";
	
	}
	echo"</select>";
	}
	

	
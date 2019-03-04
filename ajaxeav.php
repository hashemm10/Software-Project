<?php

$con = new mysqli("localhost", "root", "","software");
if (!$con) 
{
    die("Connection failed: " . mysqli_connect_error());
}

$usertype=$_GET["usertype"];

$text="Text";
$number="number";
$combo="Combo Box";
$checkbox="checkbox";
$date="date";
$time="time";
$datetime="datetime-local";
$file="file";
$url="url";
$email="email";
$password="password";
$radio="radio";
$tel="tel";

	if($usertype !="")
	{
	$res=mysqli_query($con,"SELECT * FROM user_type_option INNER JOIN usertype ON usertype.UserType_Id='". $usertype."' AND user_type_option.usertype_ID='". $usertype."' ");
		while($row=mysqli_fetch_array($res))
	{  
		$options=$row['optionsID'];
		$result=mysqli_query($con,"SELECT * FROM options INNER JOIN user_type_option ON user_type_option.optionsID='". $options."' AND options.optionsID='". $options."' ");
	
		while($row2=mysqli_fetch_array($result))
		{  
			$optionname=$row2['type']; 
			
			echo "<tr>";
			echo "<td>" . $row2['name'] . ": "."</td>";
			
			if($optionname==$text || $optionname==$date || $optionname==$time || $optionname==$datetime || $optionname==$file || $optionname==$url || $optionname==$email || $optionname==$password || $optionname==$tel || $optionname==$number){
			echo "<input type='".$optionname."'><br>";
			break;
			}
			
			else if($optionname==$combo){
			echo "<select>";
			echo "</select>";
			break;
			}
			
			else if($optionname==$checkbox){
			echo "<input type='".$optionname."'><br>";
			break;
			}
			
			else if($optionname==$radio){
			echo "<input type='".$optionname."'><br>";
			break;
			}
			
			echo "</tr>";
			break;		
		}
	}
	}
	
	

	
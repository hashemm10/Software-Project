<?php
$con = mysqli_connect("localhost", "root", "","software");
if(isset($_POST['submit']))
{
		$FirstName = $_POST["firstname"];
        $LastName = $_POST["lastname"];
        $Email = $_POST["email"];
        $Password = $_POST["password"];
        $Gender = $_POST["gender"];
        $Nationality = $_POST["nationality"];
        $Address_id = $_POST["address"];
		$Tel = $_POST["tel"];
        $Age = $_POST["age"];
		$UserType = $_POST["UserType"];
		
		$sql = "Insert INTO users(`FirstName`, `LastName`, `Email`, `Password`, `Gender`, `Nationality`, `Address_id`, `TELID`, `Age`, `UserType_Id`) values('".$FirstName."','".$LastName."','".$Email."','".$Password."','".$Gender."','".$Nationality."','".$Address_id."','".$Tel."','".$Age."', '".$UserType."')";
		mysqli_query($con , $sql);
		header("Location: Home.html");
}
?>
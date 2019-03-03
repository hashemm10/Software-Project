<?php
$con = new mysqli("localhost", "root", "","software");
if(isset($_POST['submit']))
{
		$course_name = $_POST["course_name"];
        $credithrs = $_POST["credithrs"];
        $semester = $_POST["semester"];
        $department = $_POST["department"];
        $specialization = $_POST["specialization"];
        $successrate = $_POST["successrate"]; 
		$Availability = $_POST["Availability"];
		
		$sql = "INSERT INTO `course`(`name`, `credithrs`, `semester`, `department`, `specialization`, `successrate`, `Availability`) values('".$course_name."','".$credithrs."','".$semester."','".$department."','".$specialization."','".$successrate."', '".Availability."')";
		mysqli_query($con , $sql);
		//header("Location: Home.html");
}
?>
<?php
$con = new mysqli("localhost", "root", "","software");
if(isset($_POST['submit']))
{
		$registration_date = $_POST["registration_date"];
        $midterm_grade = $_POST["midterm_grade"];
        $final_grade = $_POST["final_grade"];
        $classwork_grade = $_POST["classwork_grade"];
        $course_grade = $_POST["course_grade"];
		
		$sql = "INSERT INTO `registration_details`(`registration_ID`, `registration_date`, `course_ID`, `midterm_grade`, `final_grade`, `classwork_grade`, `course_grade`) VALUES ('".$."','".$registration_date."','".$midterm_grade."','".$final_grade."','".$classwork_grade."','".$course_grade."')";
		mysqli_query($con , $sql);
		// header("Location: Home.html");
}
?>
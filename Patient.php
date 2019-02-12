<html>
<head>   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style.css">

</head>
<title> Welcome</title>
<body>

<div class="welcome" id="section1">
<h1>Patient Page</h1>

<h3><br>Welcome,<?php if(!isset($_SESSION)){session_start();} echo"". $_SESSION['FirstName']." ". $_SESSION['LastName']." ";   ?></h3><br>
<div class="doctorbuttons">
<a href="Signout.php"><button name="logout">logout</button></a><br>
  <button id="View">View Your Profile</button><br>
  <button id="Edit">Edit Your Profile</button><br>
  <a href="DeleteAccount.php"><button id="Delete">Delete Your Account</button></a><br>
</div>
</div>
	
<div id="ViewProfile"><?php
if (!isset($_SESSION)){
    session_start();
}

	echo "
	<p> FirstName: ". $_SESSION['FirstName']." </p>
	<p> LastName: ". $_SESSION['LastName']." </p>
	<p> Email: ". $_SESSION['Email']." </p>
    <p> Password: ". $_SESSION['Password']." </p>
    <p> Blood Type: ". $_SESSION['BloodType']." </p>
    <p> Phone Number: ". $_SESSION['PhoneNumber']." </p>
    <p> Age: ". $_SESSION['Age']." </p>
	<p> Gender: ". $_SESSION['Gender']." </p><br> ";

?>
</div>

<div id="EditProfile">
<?php

if (!isset($_SESSION)){
    session_start();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "software";

// create connection
$conn = new mysqli ($servername, $username, $password, $dbname);

if(isset($_POST['submit'])){ // check if form was submitted
    $sql = "update users set FirstName = '" . $_POST["FirstName"] . 
	"' , LastName ='" . $_POST["LastName"] .  
	"' , Email ='" . $_POST["Email"] . 
    "' , Password ='" . $_POST["Password"] . 
    "' , Age ='" . $_POST["Age"] . 
	"' , PhoneNumber ='" . $_POST["PhoneNumber"] . "'  WHERE Email = '" . $_POST["Email"] . "'";
    $result = mysqli_query($conn, $sql);
    if($result){
        $_SESSION["FName"] = $_POST["FirstName"];
        $_SESSION["LName"] = $_POST["LastName"];
        $_SESSION["Email"] = $_POST["Email"];
        $_SESSION["Password"] = $_POST["Password"];
        $_SESSION["PhoneNumber"] = $_POST["PhoneNumber"];
        $_SESSION["Age"] = $_POST["Age"];


        header("Location:Patient2.php");
    }
	else{
        return $sql;
    }
}

echo "
<head>
<title> edit </title>
</head>
<h1> Edit Profile </h1>
<form action='' method='post'>
	<label> FirstName: <label>
	<input type='text' value='".$_SESSION['FirstName']."' name='FirstName'><br>
	<label> LastName: <label>
	<input type='text' value='".$_SESSION['LastName']."' name='LastName'><br>
	<label> Email: <label>
	<input type='text' value='".$_SESSION['Email']."' name='Email'><br>
	<label> Password: <label>
	<input type='text' value='".$_SESSION['Password']."' name='Password'><br>
	<label> PhoneNumber: <label>
    <input type='text' value='".$_SESSION['PhoneNumber']."' name='PhoneNumber'><br>
    <label> Age: <label>
	<input type='text' value='".$_SESSION['Age']."' name='Age'><br>
	<input type='submit' value='submit' name='submit'><br> 
	</form> ";
?>
</div>


	<script>

    $(document).ready(function(){
    $("#View").click(function(){
        $("#ViewProfile").toggle();
        $("#DateTimePicker").hide();
        $("#EditProfile").hide();
        $("#ViewBooking").hide();
        $("#EditBooking").hide();

    });
    });

    $(document).ready(function(){
    $("#Edit").click(function(){
        $("#EditProfile").toggle();
        $("#DateTimePicker").hide();
        $("#ViewProfile").hide();
        $("#ViewBooking").hide();
        $("#EditBooking").hide();

    });
    });
	</script>
	
</body>
</html>
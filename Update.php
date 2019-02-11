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


        header("Location:uplink.php);
    }else{
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
    <select name='Age' id='Age'><option value='".$_SESSION['Age']."' disabled selected>Age</option></select><br>
	<input type='submit' value='submit' name='submit'><br> 
	</form> ";
?>
</div>
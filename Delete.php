<?php

if (!isset($_SESSION)){
    session_start();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "software";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// sql to delete a record
$sql = "DELETE FROM users WHERE Email = '" . $_SESSION['Email'] . "'";

if (mysqli_query($conn, $sql)) {
	header("Location:Home.html");
}

mysqli_close($conn);
?>
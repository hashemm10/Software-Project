<?php

session_start();

$servername = "localhost";
$username = "root";
$pasword = "";
$dbname = "software";

// create connection
$conn = new mysqli ($servername, $username, $pasword, $dbname);

if(isset($_POST['submit'])){ // check if form was submitted
    $sql = "select * from users where Email = '" . $_POST["Email"] . "' and Password ='" . $_POST["Password"] . "'";
    //echo $sql;
    $result = mysqli_query($conn, $sql);

    if($row = mysqli_fetch_array($result)){
         $_SESSION["FirstName"] = $row["FirstName"];
        $_SESSION["LastName"] = $row["LastName"];
        $_SESSION["Email"] = $row["Email"];
        $_SESSION["Password"] = $row["Password"];
        $_SESSION["UserType_Id"] = $row["UserType_Id"];
        $_SESSION["Gender"] = $row["Gender"];
        $_SESSION["BloodType"] = $row["BloodType"];
        $_SESSION["PhoneNumber"] = $row["PhoneNumber"];
        $_SESSION["Age"] = $row["Age"];
        if($_SESSION['UserType_Id']==2)
        {
            
        header("Location:Patient.html");
        }
        else if($_SESSION['UserType_Id']==1)
		{header("Location:Doctor.html");}
        else
		{header("Location:Receptionist.html");}
    }else{
        echo "Invalid Email or Password";
    }
}
?>
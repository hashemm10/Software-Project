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
    $result = mysqli_query($conn, $sql);

    if($row = mysqli_fetch_array($result))
	{
		$_SESSION["FirstName"] = $row["FirstName"];
        $_SESSION["LastName"] = $row["LastName"];
        $_SESSION["Email"] = $row["Email"];
        $_SESSION["Password"] = $row["Password"];
        $_SESSION["Gender"] = $row["Gender"];
        $_SESSION["Nationality"] = $row["Nationality"];
        $_SESSION["Address_id"] = $row["Address_id"];
		$_SESSION["TELID"] = $row["TELID"];
        $_SESSION["Age"] = $row["Age"];
		$_SESSION['UserType_Id'] = $row["UserType_Id"];
		$UT = $_SESSION['UserType_Id'];
		
	 $sql = "select * from typelink where UserType_Id = $UT";
     $result = mysqli_query($conn, $sql);
     if($row = mysqli_fetch_array($result)){
		 $LinkID=$row['LinkID'];
		 
		 $sql="select * from links where LinkID=$LinkID";
		 $result = mysqli_query($conn, $sql);
		 if($row = mysqli_fetch_array($result)){
         $PhysicalAddress =$row['PhysicalAddress'];
		 header ('Location: '.$PhysicalAddress);
        }
  

  
    }
}

	else{echo "Invalid Email or Password";}
}
?>

<?php
$con = new mysqli("localhost", "root", "","software");
if(isset($_POST['submit']))
{
    if($_POST['AType']=="Patient")
        {
            $UserTypeId=2;            
        }
        else if($_POST['AType']=="Doctor"){            $UserTypeId=1;            
        }
        else{            $UserTypeId=3;            
        }
    $FirstName =$_POST['firstname'];
    $LastName =$_POST['Lastname'];
    $Email =$_POST['email'];
    $Password =$_POST['password'];
    $Gender =$_POST['gender'];
    $BlType =$_POST['BType'];
    $PhoneNumber =$_POST['PhoneNumber'];
    $Age =$_POST['Age'];
	$sql = "Insert INTO users(FirstName,LastName,Email,Password,Gender,PhoneNumber,BloodType,Age,UserType_Id) values('".$FirstName."','".$LastName."','".$Email."','".$Password."','".$Gender."','".$PhoneNumber."','".$BlType."','".$Age."','".$UserTypeId."')";
    mysqli_query($con , $sql);
    header("Location:Home.html");
}
?>
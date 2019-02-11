<html>
<body>
		  <div class="diplaydata">
		  <?php

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
	<p> Account Type: ". $_SESSION['AccountType']." </p>
	<p> Gender: ". $_SESSION['Gender']." </p><br> ";

?></div>		  
</body>

</html>
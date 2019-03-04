<html>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 

<?php

$con = new mysqli("localhost", "root", "","software");
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
 <form name="form1" action="" method="post">

<table>
<tr>
<td>Select User	Type:</td>
<td>
<select id = "usertypeid" name ="ss" onChange="usertype()">
 <option>Select Usertype</option>
						<?php
					 	  $sql="select * from usertype";
						  $result = mysqli_query($con, $sql);
						  while($row = mysqli_fetch_array($result))
								{
					    ?>
							    <option  value= "<?php echo $row["UserType_Id"];?>"> <?php echo $row["Type"];?> </option>
						 <?php
								}
						?>
						
						
						
</select>
</td>
</tr>

<tr>
<td>
<div id="options" >
</div>
</td>
</tr>
</table>
</form>



<script>
 function usertype()
 {
 
 var request = new XMLHttpRequest();
 request.open("GET","ajaxeav.php?usertype="+document.getElementById("usertypeid").value,false);
 request.send(null);
 document.getElementById("options").innerHTML= request.responseText;				
 }
 
</script>
</html>
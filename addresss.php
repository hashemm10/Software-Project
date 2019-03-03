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
<td>Select Country:</td>
<td>
<select id = "countryid"onChange="country()">
 <option> select Country</option>
						 <?php
						  $sql="select * from address";
						  $result = mysqli_query($con, $sql);
						   while($row = mysqli_fetch_array($result))
						    {
								$Referncekey=$row["SRK"];
								$sql="select *from address where AID =$Referncekey";
		                        $result = mysqli_query($con, $sql);
							    while($row = mysqli_fetch_array($result))
								{
					     ?>
							    <option value= "<?php echo $row["AID"];?>"> <?php echo $row["Address"];?> </option>
						<?php
							    }
							} 
							 
							 
							 
							
						 
						 ?>
</select>
</td>
</tr>


<tr>
<td>Select City:</td>
<td>

<div id="Cityid" >

<select onChange="city()">

<option value= "<?php echo $row["AID"];?>">
select
</option>
</select>

</div>
</td>
</tr>

<tr>
<td>Select District:</td>
<td>

<div id="Districtid" >

<select>

<option>
select
</option>
</select>

</div>
</td>
</tr>
</table>
</form>


 <script>
 function country()
 {
 
 var request = new XMLHttpRequest();
 request.open("GET","ajax.php?Country="+document.getElementById("countryid").value,false);
 request.send(null);
 document.getElementById("Cityid").innerHTML= request.responseText;
 
 }
 
 </script>
 <script>
  function city()
 {
 
 var request = new XMLHttpRequest();
 request.open("GET","ajax.php?City="+document.getElementById("Cityid").value,false);
 request.send(null);
 document.getElementById("Districtid").innerHTML= request.responseText;
 
 }
 </script>
 

</html>
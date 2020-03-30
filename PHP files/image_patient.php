<?php
    $var = mysqli_connect("54.194.181.59", "BB", "BB");
    mysqli_select_db($var, "PatientsDB") or die(mysqli_error());
	$image_empno = $_GET['patientNo'];
    $sql = "Select picture from emp where patientNo=$image_empno" ;
    $resultset = mysqli_query($var, "$sql") or die("Invalid query: " . mysqli_error());
	$row = mysqli_fetch_array($resultset);
	header('Content-type: image/jpeg');
	echo $row[0];
   	mysqli_close($var);
?>


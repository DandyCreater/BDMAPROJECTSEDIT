<?php
	$db = mysqli_connect('localhost','root','','bdma');
	if (!$db){
		echo "Database connection failed";
	}

	$username = $_POST['username'];
	$password = $_POST['password'];

	$sql ="SELECT * FROM tbl_m_user WHERE username = '".$username."' AND password = '".$password."'";

	$result = mysqli_query($db,$sql);
	while($row = mysqli_fetch_assoc($result))
    $test[] = $row; 
	$count = mysqli_num_rows($result);

	if ($count == 1){
		echo json_encode($test);
	}
	else {
		echo json_encode("Error");
	}

?>	


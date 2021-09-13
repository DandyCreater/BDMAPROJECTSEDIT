<?php
	$db = mysqli_connect('localhost','root','','bdma');
	if (!$db){
		echo "Database connection failed";
	}
		
	
		$id = $_POST['id'];
		
		$username = $_POST['username'];
		$email = $_POST['email'];
		$fullname = $_POST['fullname'];
		$dept = $_POST['dept'];
		$no_hp = $_POST['no_hp'];	
		$password = $_POST['password'];
		$result = updateDb($id, $username, $email, $fullname, $dept, $no_hp, $password, $db);
		
		if($result){
			// $response['image'] = $image;
			$response['email'] = $email;
			$response['fullname'] = $fullname;
			$response['dept'] = $dept;
			$response['no_hp'] = $no_hp;
			$response['email'] = $email;
			$response["message"] = "Edit data berhasil"; 
			echo json_encode($response);	


		}
		else{
			$response["message"] = "Error - ID tidak ditemukan"; 
			echo json_encode($response);
		
		}	
	function updateDb($id, $username, $email, $fullName, $dept, $noHp, $password, $db){

	
		$update_all = "UPDATE tbl_m_user SET fullname ='".$fullName."', email = '".$email."', no_hp = '".$noHp."', dept = '".$dept."', password = '".$password."' WHERE username = '".$username."'";
		if(mysqli_query($db, $update_all)){
			return true;
		} else {
			return false;
		}
		
	}
?>

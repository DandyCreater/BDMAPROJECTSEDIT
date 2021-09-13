<?php
	$db = mysqli_connect('localhost','root','','bdma');
	if (!$db){
		echo "Database connection failed";
	}
		
		// $username = isset()
		$id = $_POST['id'];
		// $image = $_POST['image'];
		$username = $_POST['username'];
		$email = $_POST['email'];
		$fullname = $_POST['fullname'];
		$dept = $_POST['dept'];
		$no_hp = $_POST['no_hp'];	
		$password = $_POST['password'];
		$result = updateDb($id, $username, $email, $fullname, $dept, $no_hp, $password, $db);
		// echo $fullname;
		// $response = array("error" => FALSE);

		// $sql = "UPDATE tbl_m_user SET fullname = '".$fullname."' AND email = '".$email."' AND dept = '".$dept."' AND no_hp = '".$no_hp."' AND password = '".$password."' WHERE id = '".$id."'" ;

		// $sql ="SELECT * FROM tbl_m_user WHERE username = '".$username."'";

		// $result = mysqli_query($db,$sql);
		// $count = mysqli_num_rows($result);
		// $value = mysqli_fetch_array($result);
		// $response = array();

		// echo "Isi Value : ".$value["email"];

		// if ($count == 1){
		// 	$response["message_find_user"] = "User berhasil ditemukan"; 

			// $update_all = "UPDATE tbl_m_user SET fullname = '".$fullname."' AND email = '".$email."' AND dept = '".$dept."' AND no_hp = '".$no_hp."' AND password = '".$password."' WHERE username = '".$username."'" ;
			// $query_update = mysqli_query($db, $update_all);
			// if ($query_update){
			// 	$response['email'] = $email;
			// 	$response['fullname'] = $fullname;
			// 	$response['dept'] = $dept;
			// 	$response['no_hp'] = $no_hp;
			// 	$response['email'] = $email;
			// 	// echo json_encode($response);
			// 	$response["message"] = "Success"; 
			// 	echo json_encode($response);
			// 	// echo json_encode($update_all);
			// } else {
			// 	$response["message"] = "error"; 
			// 	echo json_encode($response);
			// }
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
			// $response["error"] = TRUE;
			// 	$response["message"] = "Perubahan Gagal"; 
			// 	echo json_encode($response);
		}	// echo json_encode("Error");
	function updateDb($id, $username, $email, $fullName, $dept, $noHp, $password, $db){

		// $update_all = "UPDATE tbl_m_user SET fullname = '".$fullName."' AND email = '".$email."' AND dept = '".$dept."' AND no_hp = '".$noHp."' AND password = '".$password."' WHERE id = '".$id."'" ;
		$update_all = "UPDATE tbl_m_user SET fullname ='".$fullName."', email = '".$email."', no_hp = '".$noHp."', dept = '".$dept."', password = '".$password."' WHERE username = '".$username."'";
		// $query_update = mysqli_query($db, $update_all);
		if(mysqli_query($db, $update_all)){
			return true;
		} else {
			return false;
		}
		
	}
?>

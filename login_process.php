<?php
	session_start();
	require_once 'inc/usr_servicer.class.php';

	$email=$_POST['email'];
	$password=$_POST['password'];
	
	$id="";
	$lev="";
	$usr_servicer=new usr_servicer_class();
	$res=$usr_servicer->check_login($email, $password, $id,$lev);
	if($res)
	{
		
		$_SESSION['messagefkId'] = $id;
		
		$_SESSION['messagefkEmail'] = $email;
		$_SESSION['messagefkLev'] =$lev;
		
// 		echo "<script>";
// 			echo "alert($lev)";
// 		echo "</script>";
		
		header("Location: main.php");
	}
	else 
	{
		header("Location: index.php?error=1");
	}
	





?>
<?php
	require_once 'sql_tools.class.php';

	class usr_servicer_class
	{
		private $table='user';
		
		
		
		
		// 验证登录,并返回id和name
		public function check_login($email,$password,&$id,&$lev)
		{
			$sql_tools=new sql_tools_class();
				
			$sql="select * from $this->table where email='$email';";
			$res=$sql_tools->execute_dql($sql);
			$row=$res[0];
			$id=$row['id'];
			$lev=$row['lev'];
				
			$password2=$row['password'];
			/* if($password2==md5($password))
			{
				return true;
			}
			else
			{
				return false;
			} */
			return true;
		}
		
	 
		//设置cookie
		public function set_cookie($email,$password,$checkbox)
		{
			setcookie("email",$email,time()+30*24*3600);
			
			if($checkbox)
			{
				setcookie("password",$password,time()+30*24*3600);
			}
			else
			{
			 	if(!empty($_COOKIE['password']))
				{
					setcookie('password',"",time()-250);
				} 
			}
		}
		
		
		//设置session
		public function set_session($id,$email,$name,$password)
		{
			$_SESSION["id"]=$id;
			$_SESSION["email"]=$email;
			$_SESSION["name"]=$name;
			$_SESSION["password"]=$password;
		}
		
		
		
		
	}


?>
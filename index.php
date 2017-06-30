<?php
	session_start();
?>

<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/index.css" />
	<script src="js/jquery.js"></script>
	<script src="js/main.js"></script>
	<script >

	</script>
</head>


<body>
	

	
	<div id="left_div">
		<div id="left_inner_div">
			<div class="elem_div" id="navigate_div">
				<span id="navigate_span1">学生入口</span><a href="main.php"><span id="navigate_span2">游客入口</span></a>
			</div>
			<form action="login_process.php" method="post">
				<div class="elem_div" id="email_div">
					<span class="email_password_span">邮箱</span> <span><input class="input" type="text" name="email"></span>
				</div>
				<div class="elem_div" id="password_div">
					<span class="email_password_span">密码</span> <span><input class="input" type="password" name="password"></span>
				</div>
				<div class="elem_div" id="submit_div">
					<input id="submit" type="submit" name="submit" value="登录">
				</div>
			</form>
			<div class="elem_div" id="advice_div">
				<span id="advice_span1">友情提示：</span><br/>
				<span id="advice_span2">请用数字校园统一认证邮箱</span>
			</div>
			<div class="elem_div">
				<span id="warn_span"></span><br/>
				
			</div>
		</div>
			<!-- <input id="test" type="button" name="button" value="测试">	 -->
	</div>
	<?php 
		if(isset($_GET['error']))
		{
			echo "<script>";
			echo 'document.getElementById("warn_span").innerHTML="密码或邮箱有误！";';
			echo "</script>";
		}
	
	?>


	
</body>
</html>




<?php
session_start();
require_once("inc/init.php");
$title = "信息反馈系统提交問題";
include_once('inc/header.inc.php');

$messagefkId    = isset($_SESSION['messagefkId']) ? $_SESSION['messagefkId'] : "";
$messagefkEmail    = isset($_SESSION['messagefkEmail']) ? $_SESSION['messagefkEmail'] : "";
$messagefkLev    = isset($_SESSION['messagefkLev']) ? $_SESSION['messagefkLev'] : "";

if(strcmp($messagefkLev, "") == 0){
	header('Location:login.php?messageCode=1');
}

$type  =  1;
?>
<div class="wrap container">
<?php include_once('inc/top.inc.php'); ?>
<?php include_once('inc/nav.inc.php'); ?>
    <div class="content">
        <div class="page-header" style="text-align: center;">
            <h2>提交问题</h2>
        </div>
        <div class="mini-layout content-inner">

            <form method="post" action="">
                <ul class="unstyled">
                    <li>标&nbsp;&nbsp;题： <input id="title" name="title"
                        type="text" value="" placeholder="标 题"> <i
                        class="text-error width1 height1">*</i> <em
                        id="_txt_title">标题(由5-30个字符组成)</em>
                    </li>
                    <li>类&nbsp;&nbsp;型： <select id="depart_id"
                        name="depart_id"
                        style="width: 402px; font-size: 14px;">
                            <option value="0">请选择类型</option>
                    </select> <i class="text-error width1">*</i> <em
                        id="_txt_depart_id">请选择类型！</em>
                    </li>
                    <li>小类&nbsp;&nbsp;型： <select id="block_id"
                        name="block_id"
                        style="width: 402px; font-size: 14px;">
                            <option value="0">请选择小类型</option>
                    </select> <i class="text-error width1">*</i> <em
                        id="_txt_block_id">请选择小类型！</em>
                    </li>

                    <li>姓&nbsp;&nbsp;名： <input id="name" name="name"
                        type="text" value=""> <i
                        class="text-error width1">*</i> <em
                        id="_txt_name">请填写姓名</em>
                    </li>
                    <li>邮&nbsp;&nbsp;箱： <input id="email" name="email"
                        type="text"
                        value="<?php echo $messagefkEmail;?>" disabled>
                        <i class="text-error width1">*</i> <em
                        id="_txt_email">请填写邮箱</em>
                    </li>

                    <li>手&nbsp;&nbsp;机： <input id="phone" name="phone"
                        type="text" value=""> <i
                        class="text-error width1">*</i> <em
                        id="_txt_phone">请填写手机号码</em>
                    </li>
                    <li>
                        <div class="content-left">
                            问题描述:<i class="text-error width1">*</i>
                        </div>
                        <div class="content-center">
                            <textarea name="content" id="content"
                                class="content"></textarea>
                        </div>

                    </li>
                    <li>
                        <button class="btn btn-large btn-primary"
                            id="submit">提交</button>
                    </li>
                </ul>

            </form>
        </div>
    </div>
</div>
<script
    src="js/suggest.js<?php echo "?t=".time ();?>"></script>
<script>
$(document).ready(function(){
	$(".nav-top ul li.nav<?php echo $type; ?>").addClass("active");
});
</script>
<?php include_once('inc/footer.inc.php'); ?>
<?php include_once('inc/end.php'); ?>

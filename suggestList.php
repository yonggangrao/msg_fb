<?php
session_start();
require_once("inc/init.php");
$title = "我的反馈问题列表";
include_once('inc/function.php');
include_once('inc/header.inc.php');

$messagefkId    = isset($_SESSION['messagefkId']) ? $_SESSION['messagefkId'] : "";
$messagefkEmail    = isset($_SESSION['messagefkEmail']) ? $_SESSION['messagefkEmail'] : "";
$messagefkLev    = isset($_SESSION['messagefkLev']) ? $_SESSION['messagefkLev'] : "";


if(strcmp($messagefkLev, "") == 0){
	header('Location:login.php?messageCode=1');
}


$name    = isset($_GET['name']) ? $_GET['name'] : "";
$state    = isset($_GET['state']) ? $_GET['state'] : "";


if(strcmp($name,"") == 0){
	$name = "nav_user";
	$state = 1;
}


$type  =  2;
?>
<div class="wrap container">
<?php include_once('inc/top.inc.php'); ?>
<?php include_once('inc/nav.inc.php'); ?>
	<div class="content">
		<div class="page-header" style="text-align:center;">
			<h2>我提交过的建议问题</h2>
		</div>
		<div class="row">
			<div class="span2 bs-docs-sidebar">
				<ul class="nav nav-list bs-docs-sidenav">
					<li class="user_nav1 active">
						<a href="javascript:void(0);" onclick="getHtml('nav_user',1);">
							<i class="icon-chevron-right"></i> 全部
						</a>
					</li>
					<li  class="user_nav2">
						<a href="javascript:void(0);" onclick="getHtml('nav_user',2);">
							<i class="icon-chevron-right"></i> 等待审核中
						</a>
					</li>
					<li  class="user_nav3">
						<a href="javascript:void(0);" onclick="getHtml('nav_user',3);">
							<i class="icon-chevron-right"></i> 等待受理中
						</a>
					</li>
					<li  class="user_nav4">
						<a href="javascript:void(0);" onclick="getHtml('nav_user',4);">
							<i class="icon-chevron-right"></i> 正在维修中
						</a>
					</li>
					<li  class="user_nav5">
						<a href="javascript:void(0);" onclick="getHtml('nav_user',5);">
							<i class="icon-chevron-right"></i> 等待评价中
						</a>
					</li>
                    <li  class="user_nav6">
                        <a href="javascript:void(0);" onclick="getHtml('nav_user',6);">
                            <i class="icon-chevron-right"></i> 完成的
                        </a>
                    </li>
                    <li  class="user_nav7">
                        <a href="javascript:void(0);" onclick="getHtml('nav_user',7);">
                            <i class="icon-chevron-right"></i> 未通过审核的
                        </a>
                    </li>
				</ul>
			</div>
			<div class="span7 mini-layout">

			</div>
		</div>
	</div>
</div>
<script>

var now_state = 1;
var now_page = 1;
var now_name = "nav_user";

function remove_active(){
	$(".content .row ul.nav li.active").removeClass("active");
}

function setUrl(name,state){
	var _state = {title:'',url:window.location.href.split("?")[0]};
    history.pushState(_state,'','?name='+name+'&state='+state);	
}

function ajax_fun(name,state, page){
	setUrl(name,state);
	$.post("inc/ajax.php",{
		name:name,
            page:page,
		state:state
	},function(d){
		if(d.code==0){
			$(".span7.mini-layout").html(d.message);
			addListening();
		}
	},"json");
}
function addListening(){
    $(".pagination a.not_current").bind("click",function(e){
        var that = $(e.target);
        var text = that.text();
        if(text == "上一页"){
            now_page--;
        }else if(text == "下一页"){
            now_page++;
        }else{
            now_page = text;
        }
        ajax_fun(now_name,now_state, now_page);
    });
}
function getHtml(name,state){
	if(name == 'nav_user'){
	    now_state = state;
	    now_page = 1;
	    now_name = name;
		remove_active();
		$(".user_nav"+state).addClass("active");
		ajax_fun(now_name,now_state, now_page);
	}
}

$(document).ready(function(){
	$(".nav-top ul li.nav<?php echo $type; ?>").addClass("active");
	getHtml(<?php echo "\"$name\",$state";?>);
});
</script>
<?php include_once('inc/footer.inc.php'); ?>
<?php include_once('inc/end.php'); ?>

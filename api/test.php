<?php require_once('../config/db_config.php'); ?>
 <?php require_once('../function.class.php'); ?>
 <?php require_once("../multilingual/language_cn.php"); ?>
 <?php require_once('../session.php'); ?>
 
<?php 
$str="default_task_edit.php?editID=222&pagetab=mtask";
$str_64=urlencode($str);
echo $str_64;
echo base64_decode($str_64);
$str="......";
echo $str;
echo 5*$str;
$a['id']=86;
$qt = "SELECT * FROM `tk_task` where csa_project=" . $a ["id"] . " AND csa_remark4=-1  order by csa_remark6";
//and csa_to_user=".$_SESSION['MM_uid']."
$rt = mysql_query ( $qt, $tankdb ) or die ( mysql_error () );

while ( $at = mysql_fetch_assoc ( $rt ) ) {
echo $a['id']." ".$at["TID"]." ".$at["csa_text"];
getSubTaskList($at["TID"],$a['id']);
}
						
						
foreach ($_SESSION as $key => $value) {
	echo $key."=>".$value."<br>";
	
}

$str="<div style='background-color: #996699; width:100%; text-align:center;'>计划</div>";
$str=explode(";",$str);
$str=substr($str[0],29);
echo $str;
?>
<script type="text/javascript" src="../srcipt/jquery.min.js"></script>
<script type="text/javascript">

$.getJSON("../api/checkData.php",{date:"20151209",taskid:198}, function(data) {
	console.log(data.result);	

});
</script>
<script type="text/javascript" src="../srcipt/jquery.min.js"></script>
<script type="text/javascript">

function checkform(){
	console.log($("#csa_tb_backup3").val());

	if($("#csa_tb_backup3").val()==0){
		console.log("woshi 0");
		return false;
	}else{
		console.log($("#csa_tb_backup3"));

		}


	
}
checkform();
</script>
<style type="text/css">
option {
	background-color: #9C6;
	text-indent: 300pt;
	font-size: 24px;
	display: block;
	margin-left: 77px;
	padding-left: 55px;
	left: 33px;
	clip: rect(auto,auto,auto,33px);
}
</style>

<form action="<?php echo $_SERVER['PHP_SELF']?>" method="post"
	name="form1" id="form1" onsubmit='if($("#csa_tb_backup3").val()==0){$("#project_id").css("color","red");;return false;}'>
    
	<select name="project_id" id="project_id"
		onChange="console.log($('#project_id option:selected').attr('id'))"
		class="form-control">
		<option value="0">请选择任务</option>
        <option></option>
		<option id="1" value="vvvvvvv">11111111111111111</option>
		<option id="2" value="vv22v2vvvv">222222</option>
		<option value="333">3333</option>

	</select> <input id="csa_tb_backup3" value="0"> <input TYPe="submit" />
	<input type="button" onclick='javascript:checkform();'>
</form>

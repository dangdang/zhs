 <?php require_once('../config/db_config.php'); ?>
 <?php require_once('../function.class.php'); ?>
 <?php require_once("../multilingual/language_cn.php"); ?>
 <?php require_once('../session.php'); ?>
 <?php 
 header('Content-type: application/json');
 ?>
 [
 <?php
 if (empty($_GET['start'])) {
 	$start="2015-12-01";
 }else {
 	$start=$_GET["start"];
 }
 
 if (empty($_GET['end'])) {
 	$end="2015-12-30";
 }else {
 	$end=$_GET["end"];
 }
 
 mysql_select_db($database_tankdb, $tankdb);
 $q = 'SELECT * FROM tk_task inner join tk_status on tk_task.csa_remark2=tk_status.id where csa_to_user='.$_SESSION['MM_uid'].' and csa_plan_st>="'.$start.'" and csa_plan_et<="'.$end.'"';
 
 $result = mysql_query($q, $tankdb) or die(mysql_error());
 while ($a=mysql_fetch_assoc($result)){
 ?>
{
"id":"<?php echo $a["TID"]?>",
"title":"<?php echo strip_tags($a["csa_text"])?>",
"start":"<?php echo $a["csa_plan_st"]?>",
"end":"<?php echo $a["csa_plan_et"]?>",
"backgroundColor":"<?php 
$str=explode(";",$a["task_status_display"]);
echo substr($str[0],29);
?>",
"textColor":"black",
"url":"default_task_edit.php?editID=<?php echo $a["TID"]?>&pagetab=mtask"
},
<?php	
 }
 ?>
<?php
 $q = 'SELECT * FROM `tk_task_byday` INNER JOIN tk_status ON tk_task_byday.csa_tb_status = tk_status.id where csa_tb_year>="'.str_replace("-","",$start).'" and csa_tb_year<="'.str_replace("-","",$end).'"';
 $result = mysql_query($q, $tankdb) or die(mysql_error());
 while ($a=mysql_fetch_assoc($result)){
 ?>
{
"id":"<?php echo $a["csa_tb_backup1"];?>",
"title":"<?php echo substr(trim(strip_tags($a["csa_tb_text"])),0,100)?>",
"start":"<?php 
$logyear = str_split($a['csa_tb_year'],4);
$logmonth = str_split($logyear[1],2);
$logdate = $logyear[0]."-".$logmonth[0]."-".$logmonth[1];
echo $logdate;?>",
"backgroundColor":"<?php 
$str=explode(";",$a["task_status_display"]);
echo substr($str[0],29);
?>",
"textColor":"black",
"url":"log_view.php?date=<?php echo $a['csa_tb_year'];?>&taskid=<?php echo $a["csa_tb_backup1"]?>"
},
<?php	
 }
?>
{
"id":"0",
"title":"1",
"start":"1"
}]
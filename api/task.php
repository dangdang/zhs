 <?php require_once('../config/db_config.php'); ?>
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
 $q = 'SELECT * FROM tk_task where csa_plan_st>="'.$start.'" and csa_plan_et<="'.$end.'"';
 $result = mysql_query($q, $tankdb) or die(mysql_error());
 while ($a=mysql_fetch_assoc($result)){
 ?>
 {
 "id":"<?php echo $a["TID"]?>",
 "title":"<?php echo $a["csa_text"]?>",
 "start":"<?php echo $a["csa_plan_st"]?>",
 "end":"<?php echo $a["csa_plan_et"]?>"
 },
<?php	
 }
?>
{
"id":"0",
"title":"1",
"start":"1"
}]
 <?php require_once('../config/db_config.php'); ?>
 <?php require_once('../function.class.php'); ?>
 <?php require_once("../multilingual/language_cn.php"); ?>
 <?php require_once('../session.php'); ?>
 <?php
	header ( 'Content-type: application/json' );
	?>
<?php

	mysql_select_db ( $database_tankdb, $tankdb );
	$q = sprintf ( 'SELECT * FROM tk_task_byday where csa_tb_year=%s and csa_tb_backup1=%s', GetSQLValueString ( $_GET ['date'], "text" ), GetSQLValueString ( $_GET ['taskid'], "int" ) );
	
	$result = mysql_query ( $q, $tankdb ) or die ( mysql_error () );
	$count = mysql_num_rows ( $result );
	?>
{
"result":"<?php echo $count?>"
}
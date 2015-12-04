<?php require_once('../config/db_config.php'); ?>
<?php require_once('../function.class.php'); ?>
<?php require "../multilingual/language_cn".".php"; ?>
<?php

mysql_select_db($database_tankdb, $tankdb);
$query_Recordset1 = "SELECT * FROM `tk_project` ORDER BY id DESC";
$Recordset1 = mysql_query($query_Recordset1, $tankdb) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);
header("Content-Type: application/json;charset=utf-8");
?>
[
<?php do { ?>
{
"project_id":"<?php echo $row_Recordset1["id"]?>",
"project_name":"<?php echo $row_Recordset1["project_name"]?>",
"project_status":"<?php echo $row_Recordset1["project_status"]?>"
}
<?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
]
<?php
mysql_free_result($Recordset1);
?>

<?php
//error_reporting(0); //zhl: 异常处理？
$hostname_tankdb = "localhost";    //database host 
$database_tankdb = "tankdb";       //database name
$username_tankdb = "root";         //mysql user name
$password_tankdb = "";             //mysql password
$tankdb = mysql_connect($hostname_tankdb, $username_tankdb, $password_tankdb) or trigger_error(mysql_error(),E_USER_ERROR);
mysql_query("set names 'utf8'");

require "function.class.php";

$language = "cn";
$advsearch = get_item( 'advsearch' );//从表tank_item取回相应的值，主要是后天参数，
$outofdate = get_item( 'outofdate' ) ;//是否显示过期任务
?>
<?php require "multilingual/language_$language".".php"; ?>
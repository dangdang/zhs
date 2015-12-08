<?php
//error_reporting(0); //zhl: 异常处理？

$hostname_tankdb = "localhost";    //database host 
$database_tankdb = "tankdb";       //database name
$username_tankdb = "root";         //mysql user name
$password_tankdb = "";             //mysql password
$tankdb = mysql_connect($hostname_tankdb, $username_tankdb, $password_tankdb) or trigger_error(mysql_error(),E_USER_ERROR);
mysql_query("set names 'utf8'");
mysql_select_db ( $database_tankdb, $tankdb );

$KindEditorItems="'quickformat','bold','italic', 'underline','|',
		'formatblock', 'fontsize','forecolor', 'hilitecolor', 'removeformat','|',
		'indent','outdent','insertorderedlist', 'insertunorderedlist','|',
		'link','insertfile'";

$HOME="/zhs";

$a_approval_type=array(
		"1" => "创建项目",
		"2" => "删除项目"
		
);

?>
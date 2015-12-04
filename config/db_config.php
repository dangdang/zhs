<?php
$hostname_tankdb = "localhost";    //database host 
$database_tankdb = "tankdb";       //database name
$username_tankdb = "root";         //mysql user name
$password_tankdb = "";             //mysql password
$tankdb = mysql_connect($hostname_tankdb, $username_tankdb, $password_tankdb) or trigger_error(mysql_error(),E_USER_ERROR);
mysql_query("set names 'utf8'");

?>
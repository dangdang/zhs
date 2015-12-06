<?php
//error_reporting(0); //zhl: 异常处理？
//error_reporting(E_ALL ^ E_NOTICE);
require_once 'db_config.php';

require "function.class.php";

$language = "cn";
$advsearch = get_item( 'advsearch' );//从表tank_item取回相应的值，主要是后天参数，
$outofdate = get_item( 'outofdate' ) ;//是否显示过期任务

$KindEditorItems="'bold','italic', 'underline', 'removeformat','insertorderedlist', 'insertunorderedlist', 'indent','outdent',  'quickformat',  'forecolor', 'hilitecolor',  'formatblock', 'fontsize', 'link'"
 
?>
<?php require "multilingual/language_$language".".php"; ?>
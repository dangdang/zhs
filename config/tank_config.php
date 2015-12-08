<?php
require_once 'db_config.php';

require "function.class.php";
$advsearch = get_item( 'advsearch' );//从表tank_item取回相应的值，主要是后天参数，
$outofdate = get_item( 'outofdate' ) ;//是否显示过期任务

require "multilingual/language_cn.php"; 

?>
<?php require_once('config/tank_config.php'); ?>
<?php require_once('session_unset.php'); ?>
<?php require_once('session.php'); ?>
<?php
$url_project = $_SERVER["QUERY_STRING"] ;
$current_url = current(explode("&sort",$url_project));

if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

$currentPage = $_SERVER["PHP_SELF"];

$maxRows_Recordset1 = get_item( 'maxrows_project' );
$pageNum_Recordset1 = 0;
if (isset($_GET['pageNum_Recordset1'])) {
  $pageNum_Recordset1 = $_GET['pageNum_Recordset1'];
}
$startRow_Recordset1 = $pageNum_Recordset1 * $maxRows_Recordset1;

$colinputtitle_Recordset1 = "";
if (isset($_GET['inputtitle'])) {
  $colinputtitle_Recordset1 = $_GET['inputtitle'];
}

mysql_select_db($database_tankdb, $tankdb);
$query_Recordset1 = sprintf("SELECT * FROM tk_project 
							
							inner join tk_user on tk_project.project_to_user=tk_user.uid
							WHERE project_name LIKE %s ORDER BY tk_project.project_lastupdate DESC",  
GetSQLValueString("%" . $colinputtitle_Recordset1 . "%", "text"));
$query_limit_Recordset1 = sprintf("%s LIMIT %d, %d", $query_Recordset1, $startRow_Recordset1, $maxRows_Recordset1);
$Recordset1 = mysql_query($query_limit_Recordset1, $tankdb) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);

if (isset($_GET['totalRows_Recordset1'])) {
  $totalRows_Recordset1 = $_GET['totalRows_Recordset1'];
} else {
  $all_Recordset1 = mysql_query($query_Recordset1);
  $totalRows_Recordset1 = mysql_num_rows($all_Recordset1);
}
$totalPages_Recordset1 = ceil($totalRows_Recordset1/$maxRows_Recordset1)-1;

$queryString_Recordset1 = "";
if (!empty($_SERVER['QUERY_STRING'])) {
  $params = explode("&", $_SERVER['QUERY_STRING']);
  $newParams = array();
  foreach ($params as $param) {
    if (stristr($param, "pageNum_Recordset1") == false && 
        stristr($param, "totalRows_Recordset1") == false) {
      array_push($newParams, $param);
    }
  }
  if (count($newParams) != 0) {
    $queryString_Recordset1 = "&" . htmlentities(implode("&", $newParams));
  }
}
$queryString_Recordset1 = sprintf("&totalRows_Recordset1=%d%s", $totalRows_Recordset1, $queryString_Recordset1);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>综合所 - <?php echo $multilingual_project_file_management; ?></title> <!--TODO：zhl 修改wss-->
<link href="skin/themes/base/tk_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<?php require('head.php'); ?>
<br />
<table align="center" class="fontsize-s input_task_table glink">
  <tr valign="baseline">
  <td>
	  <span class="float_left"><?php echo $multilingual_breadcrumb_home; ?></span>
	  <span class="ui-icon month_next float_left"></span>
	  
	  <span class="float_left"><?php echo $multilingual_breadcrumb_filelist; ?></span>
	  	  
	  <span class="ui-icon month_next float_left"></span>
	  <span class="float_left"><?php echo $multilingual_project_file; ?></span>
</td>
</tr>
<tr valign="baseline">
      <td nowrap="nowrap">
	  <span class="input_task_title  margin-y" style="margin-top:0px;">
	  <div class="float_left"><?php echo $multilingual_project_file_list; ?></div>
	  </span>
	  </td>
    </tr>
	<?php if($totalRows_Recordset1 > "0"){?>
	<?php do { ?>
		<tr valign="baseline">
      <td nowrap="nowrap"  class="comment_list">
	  <div class="float_left">
	  <a href="file.php?projectID=<?php echo $row_Recordset1['id']; ?>&folder=1&pfile=1
	  " class="icon_folder"><?php echo $row_Recordset1['project_name']; ?></a>
	  </div>
</td>
    </tr>
    
	<?php
} while ($row_Recordset1 = mysql_fetch_assoc($Recordset1));
  $rows = mysql_num_rows($Recordset1);
  if($rows > 0) {
      mysql_data_seek($Recordset1, 0);
	  $row_Recordset1 = mysql_fetch_assoc($Recordset1);
  }
?>
	<tr valign="baseline">
      <td >
<table class="rowcon" border="0" align="center">
<tr>
<td>   <table border="0">
        <tr>
          <td><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
              <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, 0, $queryString_Recordset1); ?>#task"><?php echo $multilingual_global_first; ?></a>
              <?php } // Show if not first page ?></td>
          <td><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
              <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, max(0, $pageNum_Recordset1 - 1), $queryString_Recordset1); ?>#task"><?php echo $multilingual_global_previous; ?></a>
              <?php } // Show if not first page ?></td>
          <td><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
              <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, min($totalPages_Recordset1, $pageNum_Recordset1 + 1), $queryString_Recordset1); ?>#task"><?php echo $multilingual_global_next; ?></a>
              <?php } // Show if not last page ?></td>
          <td><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
              <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, $totalPages_Recordset1, $queryString_Recordset1); ?>#task"><?php echo $multilingual_global_last; ?></a>
              <?php } // Show if not last page ?></td>
        </tr>
      </table></td>
<td align="right">   <?php echo ($startRow_Recordset1 + 1) ?> <?php echo $multilingual_global_to; ?> <?php echo min($startRow_Recordset1 + $maxRows_Recordset1, $totalRows_Recordset1) ?> (<?php echo $multilingual_global_total; ?> <?php echo $totalRows_Recordset1 ?>)&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>	</td>
    </tr>
<?php } else {?>
<tr>
<td>
<div class="update_bg">
    <?php echo $multilingual_project_file_nofile; ?></div></td>
</tr>
<?php } ?>
	
  <tr>
    <td>&nbsp;</td>
  </tr> 

</table>
<p>&nbsp;</p>
<?php require('foot.php'); ?>
</body>
</html>
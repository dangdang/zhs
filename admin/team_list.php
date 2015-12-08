<?php require_once('../config/db_config.php'); ?>
<?php require_once('../function.class.php'); ?>
<?php require_once('../multilingual/language_cn.php'); ?>
<?php require_once('../session_unset.php'); ?>
<?php require_once('../session_admin.php'); ?>

<?php
if ((isset ( $_POST ["MM_update"] )) && ($_POST ["MM_update"] == "form1")) {
	$updateSQL = sprintf ( "UPDATE tk_team SET tk_team_name=%s,tk_team_order=%s WHERE id=%s", GetSQLValueString ( $_POST ['team_name'], "text" ),GetSQLValueString ( $_POST ['team_order'], "int" ),GetSQLValueString ( $_POST ['id'], "int" ) );
	
	mysql_select_db ( $database_tankdb, $tankdb );
	$Result1 = mysql_query ( $updateSQL, $tankdb ) or die ( mysql_error () );
}

if (isset ( $_GET ['editID'] )) {
	
	$qu = sprintf ( "SELECT * FROM tk_team WHERE id = %s", GetSQLValueString ( $_GET ['editID'], "int" ) );
	echo $qu;
	$ru = mysql_query ( $qu, $tankdb ) or die ( mysql_error () );
	$au = mysql_fetch_assoc ( $ru );
}

// delete
if ((isset ( $_GET ['delID'] )) && ($_GET ['delID'] != "") && ($_SESSION ['MM_Username'] != $multilingual_dd_user_readonly)) {
	$deleteSQL = sprintf ( "DELETE FROM tk_team WHERE id=%s", GetSQLValueString ( $_GET ['delID'], "int" ) );
	$Result1 = mysql_query ( $deleteSQL, $tankdb ) or die ( mysql_error () );
}

// 生成写入数据库的sql语句
if ((isset ( $_POST ["MM_insert"] )) && ($_POST ["MM_insert"] == "form1")) {
	$insertSQL = sprintf ( "INSERT INTO tk_team (tk_team_name, tk_team_order) VALUES (%s, %s)", GetSQLValueString ( $_POST ['team_name'], "text" ), GetSQLValueString ( $_POST ['team_order'], "int" ) );
	$Result1 = mysql_query ( $insertSQL, $tankdb ) or die ( mysql_error () );
}

// 获取数据库已有记录
$query_Recordset1 = "SELECT * FROM tk_team order by tk_team_order";
$Recordset1 = mysql_query ( $query_Recordset1, $tankdb ) or die ( mysql_error () );
$row_Recordset1 = mysql_fetch_assoc ( $Recordset1 );
$totalRows_Recordset1 = mysql_num_rows ( $Recordset1 );
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>综合所 - <?php echo $multilingual_projecttype_title; ?></title>
<link href="../skin/themes/base/tk_style.css" rel="stylesheet"
	type="text/css" />
<link href="../skin/themes/base/custom.css" rel="stylesheet"
	type="text/css" />
<link href="../skin/themes/base/lhgcheck.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="../srcipt/lhgcore.js"></script>
<script type="text/javascript" src="../srcipt/lhgcheck.js"></script>
<script type="text/javascript">
<!--
//判断相关字段是否存在，使用了lhgcheck.js
J.check.rules = [
	{name: 'team_name', mid: 'team_name_msg', requir: true, type: '',  warn: '<?php echo $multilingual_default_required4; ?>'},
	{name: 'team_order', mid: 'team_order_msg', type: 'rang', min: -1, warn: '<?php echo $multilingual_default_required5; ?>' }
   
];

window.onload = function()
{
    J.check.regform('form1');
}
//-->
</script>
<script type="text/javascript" src="srcipt/jquery.js"></script>
<script type="text/javascript" src="srcipt/js.js"></script>
</head>

<body>
<?php require('../admin_head.php'); ?>
<table border="0" cellspacing="5" cellpadding="12" width="100%">
		<tr>
			<td width="200px" class="set_menu_bg" valign="top"><?php require('../setting_menu.php'); ?></td>
			<td>
				<form action="<?php echo $_SERVER ['PHP_SELF']; ?>" method="post"
					name="form1" id="form1">
					<table class="filter_table" border="0" cellspacing="0"
						cellpadding="0">
						<thead>
							<tr>
								<th colspan="2">部门管理</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>部门名称:<br /> <input type="text" name="team_name"
									id="team_name"
									value="<?php if (isset ( $_GET ['editID'] )) { echo $au["tk_team_name"];}?>"
									size="32" class="width-p80" /><span id="team_name_msg"></span></td>
								<td><?php echo $multilingual_default_order; ?>:<br /> <input
									type="text" name="team_order" id="team_order"
									value="<?php if (isset ( $_GET ['editID'] )) { echo $au["tk_team_order"];}?>"
									size="32" /><span id="team_order_msg"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"><input type="submit"
									value="<?php echo $multilingual_global_action_save; ?>"
									<?php
									
									if ($_SESSION ['MM_Username'] == $multilingual_dd_user_readonly) {
										echo "disabled='disabled'";
									}
									?> /></td>
							</tr>
						</tfoot>
					</table>
					<?php if (isset ( $_GET ['editID'] )) {?>
					<input type="hidden" name="MM_update" value="form1" /> <input
						type="hidden" name="id"
						value="<?php echo $au['id']; ?>" />
					<?php } else {?>
							<input type="hidden" name="MM_insert" value="form1" />
					<?php }?>		
				</form>
				<p>&nbsp;</p>
				<div class="taskdiv">
					<table border="0" cellspacing="0" cellpadding="0" class="maintable">
						<thead class="toptable">
							<tr>
								<th>部门名称</th>
								<th><?php echo $multilingual_default_order; ?></th>
								<th colspan="2"><?php echo $multilingual_global_action; ?></th>
							</tr>
						</thead>
						<!--取出project_type 表里数据-->
<?php do { ?>
    <tr>
							<td width="50%"><?php echo $row_Recordset1['tk_team_name']; ?></td>
							<td width="20%"><?php echo $row_Recordset1['tk_team_order']; ?></td>
							<td width="15%"><a
								href="<?php echo $_SERVER ['PHP_SELF']; ?>?editID=<?php echo $row_Recordset1['id']; ?>"><?php echo $multilingual_global_action_edit; ?></a></td>
							<!--todo:增加编辑页面-->
							<td width="15%">
	  <?php if ($totalRows_Recordset1 > 1  && $_SESSION['MM_Username'] <> $multilingual_dd_user_readonly) { // Show if recordset not empty ?>
	  <a href="#"
								onclick="javascript:if(confirm( '<?php
		echo $multilingual_global_action_delconfirm6;
		?>'))self.location='<?php echo $_SERVER ['PHP_SELF']; ?>?delID=<?php echo $row_Recordset1['id']; ?>';"><?php echo $multilingual_global_action_del; ?></a>
	  <?php } else { // Show if recordset not empty ?> 

<?php echo $multilingual_global_action_del; ?>

<?php } // Show if recordset not empty ?>
	  </td>
						</tr>
<?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
</table>
				</div>


			</td>
		</tr>
	</table>	
<?php require('../foot.php'); ?>
</body>
</html>
<?php
mysql_free_result($Recordset1);
?>
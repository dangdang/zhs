 <?php require_once('../config/db_config.php'); ?>
 <?php require_once('../function.class.php'); ?>
 <?php require_once("../multilingual/language_cn.php"); ?>
 <?php require_once('../session.php'); ?>
<?php

	$restrictGoTo = $HOME . "user_error3.php";
	if ($_SESSION ['MM_rank'] < "2") {
		header ( "Location: " . $restrictGoTo );
		exit ();
	}
	
	$nowuser = $_SESSION ['MM_uid'];
	
	if ((isset ( $_POST ["approval_update"] )) && ($_POST ["approval_update"] == "form3")) {
		$q = sprintf ( "UPDATE tk_approval SET state=%s, comment=%s,update_date=now() WHERE ID=%s", GetSQLValueString ( $_POST ['state'], "int" ), GetSQLValueString ( $_POST ['comment'], "text" ), GetSQLValueString ( $_POST ["approval_id"], "int" ) );
		$r = mysql_query ( $q, $tankdb ) or die ( mysql_error () );
		?>
		<script type="text/javascript">window.parent.reload();</script>
		<?php
	}
	
	$q = "SELECT * FROM tk_approval WHERE id=" . $_GET ['approval_id'];
	$r = mysql_query ( $q ) or die ( mysql_error () );
	$a = mysql_fetch_assoc ( $r );
	
	?>
<link href="<?php echo $HOME;?>/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

<script type="text/javascript">
var P = window.parent, D = P.loadinndlg();   
function closreload(url)
{
    if(!url)
	    P.reload();    
}
function over()
{
    P.cancel();
}
	</script>

<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post"
	name="form3" id="form3">

	<div class="modal-header">

		<h4 class="modal-title" id="myModalLabel"><?php echo $a["subject"]; ?></h4>
	</div>
	<div class="modal-body">

		<div >
			<label for="tk_user_pass">请选择您的审批结果</label>
			<div>
				<select id="select4" name="state" class="form-control">
          <?php foreach ($a_approval_state as $k => $v){ ?>
          <option value="<?php echo $k?>"
						<?php if($a['state']==$k){ echo "selected=selected"; } ?>><?php echo $v;?></option>
          <?php } ?>
        </select>
			</div>

		</div>

		<div >
			<label for="comment">您的审批意见</label>
			<div>
				<textarea name="comment" id="comment" class="form-control" rows="5"></textarea>

			</div>
			<span class="help-block">* 不超过100字</span>
		</div>
		<div class="clearboth"></div>


	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default btn-sm"
			data-dismiss="modal" onclick="over();"><?php echo $multilingual_global_action_cancel; ?></button>
		<button type="submit" class="btn btn-primary btn-sm"
			data-loading-text="<?php echo $multilingual_global_wait; ?>"><?php echo $multilingual_global_action_save; ?></button>
		<input type="hidden" name="approval_id"
			value="<?php echo $_GET['approval_id'];?>" /> <input type="hidden"
			name="approval_update" value="form3" />
	</div>
</form>
<script type="text/javascript">
$('button[data-loading-text]').click(function () {
    var btn = $(this).button('loading');
    setTimeout(function () {
        btn.button('reset');
    }, 3000);
});
</script>
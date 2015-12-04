<script type="text/javascript">
function closreload(taskid)
{
    if(!taskid){
	    window.parent.reload();
    }else{
    	top.location="default_task_edit.php?editID="+taskid+"&pagetab=mtask";
    }
	
}
</script>
<?php echo "<script language='javascript'>closreload(taskid=".$_GET['taskid'].")</script>"; ?>
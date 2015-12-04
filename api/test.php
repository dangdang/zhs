<script type="text/javascript" src="../srcipt/jquery.min.js"></script>
<script type="text/javascript">

function checkform(){
	console.log($("#csa_tb_backup3").val());

	if($("#csa_tb_backup3").val()==0){
		console.log("woshi 0");
		return false;
	}else{
		console.log($("#csa_tb_backup3"));

		}


	
}
checkform();
</script>
<form action="<?php echo $_SERVER['PHP_SELF']?>" method="post"
	name="form1" id="form1" onsubmit='if($("#csa_tb_backup3").val()==0){$("#project_id").css("color","red");;return false;}'>
	<select name="project_id" id="project_id"
		onChange="console.log($('#project_id option:selected').attr('id'))"
		class="form-control">
		<option value="0">请选择任务</option>
		<option id="1" value="vvvvvvv">11111111111111111</option>
		<option id="2" value="vv22v2vvvv">222222</option>

	</select> <input id="csa_tb_backup3" value="0"> <input TYPe="submit" />
	<input type="button" onclick='javascript:checkform();'>
</form>

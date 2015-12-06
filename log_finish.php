<?php 
if(isset($_GET['url'])){
	$url=urldecode($_GET['url']);
	$reload=0;
}else{
	$reload=1;
	$url="";
}
?>
<script type="text/javascript">
function closreload(reload)
{
    if(reload==1){
	    window.parent.reload();
    }else{
    	top.location="<?php echo $url;?>";
    }
	
}
</script>
<?php 
echo "<script language='javascript'>closreload(".$reload.")</script>";
?>
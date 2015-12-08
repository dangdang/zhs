<?php 
$type = $_SERVER["QUERY_STRING"];
$self =$_SERVER['PHP_SELF'];
$pagename = end(explode("/",$self));
?>

<span class="<?php if($type == "type=setting"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/setting.php?type=setting"><?php echo $multilingual_set_baseset; ?></a></span>


<span class="<?php if($type == "type=setting_mail"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/setting.php?type=setting_mail"><?php echo $multilingual_set_mailset; ?></a></span>

<hr class="set_menu_hr" size="1">
<!--zhl:设置项目类型等相关属性-->
<span class="<?php if($pagename == "project_type_list.php"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/project_type_list.php"><?php echo $multilingual_projecttype_title; ?></a></span>
<span class="<?php if($pagename == "project_status.php"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/project_status.php"><?php echo $multilingual_projectstatus_title; ?></a></span>
<span class="<?php if($pagename == "project_member.php"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/project_member.php"><?php echo $multilingual_projectmem_title; ?></a></span>


<hr class="set_menu_hr" size="1"> <!--虚线分隔线-->

<span class="<?php if($pagename == "task_type_list.php"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/task_type_list.php"><?php echo $multilingual_tasktype_title; ?></a></span>
<span class="<?php if($pagename == "status_list.php"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/status_list.php"><?php echo $multilingual_taskstatus_title; ?></a></span>



<hr class="set_menu_hr" size="1">

<span class="<?php if($pagename == "team_list.php"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/admin/team_list.php"><?php echo $multilingual_dept_title; ?></a></span>
<span class="<?php if($pagename == "user_role_list.php"){echo "set_menu_onfocus";} else {echo "set_menu_nofocus";}?>"><a href="<?php echo $HOME;?>/admin/user_role_list.php">用户职务管理</a></span>

<hr class="set_menu_hr" size="1">

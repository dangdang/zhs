<?php
$url_project = $_SERVER["QUERY_STRING"] ;
$current_url = current(explode("&sort",$url_project));

$maxRows_Recordset1 = get_item( 'maxrows_project' );
$pageNum_Recordset1 = 0;
if (isset($_GET['pageNum_Recordset1'])) {
  $pageNum_Recordset1 = $_GET['pageNum_Recordset1'];
}
$startRow_Recordset1 = $pageNum_Recordset1 * $maxRows_Recordset1;


$sortlist = "project_lastupdate";
if (isset($_GET['sort'])) {
  $sortlist = $_GET['sort'];
}

$orderlist = "DESC";
if (isset($_GET['order'])) {
  $orderlist= $_GET['order'];
}

//表单中“按项目类型查询查询”表单的处理：复选框通过数组来传递多个数据，传回的只是被选中的数据
$where_project_type = "";
if (isset($_GET['project_type']))
{

    $where_project_type="AND ((project_type=";
    $project_type_arr = $_GET['project_type'];
    foreach($project_type_arr as $k=>$v)
    {
        $type_value = GetSQLValueString($v, "text"); /*保证传入的数据没有被注入*/
        if ($k==(count($project_type_arr)-1))
       {
           $where_project_type=$where_project_type .$type_value ."))";
       }
        else
        {
            $where_project_type=$where_project_type .$type_value .") or (project_type= "; /*增加选择条件*/

        }

    }
}else {
	$project_type_arr=Array();
	
}

//表单中“按名称查询”的处理：输入框通过get方法传递过来的数据
$colinputtitle_Recordset1 = "";
if (isset($_GET['inputtitle'])) {
  $colinputtitle_Recordset1 = $_GET['inputtitle'];
}

if ($pagetabs == "mprj" || $pagetabs == "jprj"){
$prjtouser = $_SESSION['MM_uid'];
if (isset($_GET['ptouser'])) {
  $prjtouser = $_GET['ptouser'];
}
}else {
$prjtouser = 0;
}


$prjtouser = GetSQLValueString($prjtouser, "int");

if($pagetabs == "jprj"){
$where = "tk_task.csa_to_user = $prjtouser AND tk_status_project.task_status NOT LIKE '%%$multilingual_dd_status_prjfinish%%' AND";
}else if($pagetabs == "closeprj"){
$where = "tk_status_project.task_status LIKE '%%$multilingual_dd_status_prjfinish%%' AND";
}
else if($prjtouser <> 0 ) {
$where = "project_to_user = $prjtouser AND tk_status_project.task_status NOT LIKE '%%$multilingual_dd_status_prjfinish%%' AND";
}else{
$where = "tk_status_project.task_status NOT LIKE '%%$multilingual_dd_status_prjfinish%%' AND";
} 


if($pagetabs == "jprj" ){
$where1 = "inner join tk_task on tk_project.id=tk_task.csa_project";
$where2 = "GROUP BY tk_project.id";
}else{
$where1 = "";
$where2 = "";
}

//从数据库里读取人员信息，为显示人员名称做准备
mysql_select_db($database_tankdb, $tankdb);
$query_Recordset_user = "SELECT * FROM tk_user ORDER BY uid ASC";
$Recordset_user = mysql_query($query_Recordset_user, $tankdb) or die(mysql_error());
$row_Recordset_user = mysql_fetch_assoc($Recordset_user);
$num_user = mysql_num_rows($Recordset_user);
$userNameArray=array();
do
{
	$userNameArray[$row_Recordset_user["uid"]]=$row_Recordset_user["tk_display_name"];
}while ($row_Recordset_user = mysql_fetch_assoc($Recordset_user));
mysql_data_seek($Recordset_user, 0);/*php函数，移动数据库指针，0表示指向第一个指针*/
$row_Recordset_user = mysql_fetch_assoc($Recordset_user);/*从数据库中获取一条记录*/

/*for($i=0;$i<=$num_user;$i++)
{
	$userArray[$i]['uid']=$row_Recordset_user["uid"];
	$userArray[$i]['name']=$row_Recordset_user["tk_display_name"];
	$row_Recordset_user = mysql_fetch_assoc($Recordset_user);
}*/







//从数据库里读取项目类型列表信息，为填充复选框做准备
mysql_select_db($database_tankdb, $tankdb);
$query_Recordset3 = "SELECT * FROM tk_project_type ORDER BY project_type_backup1 ASC";
$Recordset3 = mysql_query($query_Recordset3, $tankdb) or die(mysql_error());
$row_Recordset3 = mysql_fetch_assoc($Recordset3);
$totalRows_Recordset3 = mysql_num_rows($Recordset3);


//读取数据
mysql_select_db($database_tankdb, $tankdb);
$query_Recordset1 = sprintf("SELECT * FROM tk_project 
							
							inner join tk_user on tk_project.project_to_user=tk_user.uid /*内连接，两个表中至少有一条记录符合对比条件时才返回值*/
							inner join tk_status_project on tk_project.project_status=tk_status_project.psid
							INNER JOIN tk_project_type on tk_project.project_type=tk_project_type.ptid
							$where1 
							WHERE $where project_name LIKE %s $where_project_type $where2 ORDER BY %s %s",  /*ORDER BY tk_project.%s %s",*/
							GetSQLValueString("%" . $colinputtitle_Recordset1 . "%", "text"),
							GetSQLValueString($sortlist, "defined", $sortlist, "NULL"),/*按哪个字段来排序*/
							GetSQLValueString($orderlist, "defined", $orderlist, "NULL"));/*升序还是降序*/
							
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


	<!--综合查询表单-->
<div class="search_div pagemarginfix " xmlns="http://www.w3.org/1999/html"
	 xmlns:overflow="http://www.w3.org/1999/xhtml">
    <form id="form1" name="form1" method="get" action="<?php echo $pagename; ?>" class="saerch_form form-inline">
        <!--按项目类型查询，刷新表单后依然能保留项目类型-->
           <!--<label><?php /*echo $multilingual_project_type.":";*/?> </label>-->
        <div class="checkbox"></div>
        <div class="checkbox">

            <?php do {  ?>
            <label>
                <input type="checkbox" name="project_type[]" value="<?php echo $row_Recordset3['ptid']?>" <?php if (in_array($row_Recordset3['ptid'],$project_type_arr)) { echo  "checked";}?>>
                <?php echo $row_Recordset3['project_type_name']?>
            </label>
            <?php
            } while ($row_Recordset3 = mysql_fetch_assoc($Recordset3));
            $rows = mysql_num_rows($Recordset3);
            if($rows > 0)
            {
            mysql_data_seek($Recordset3, 0);/*php函数，移动数据库指针，0表示指向第一个指针*/
            $row_Recordset3 = mysql_fetch_assoc($Recordset3);/*从数据库中获取一条记录*/
            }  ?>

        </div>

        <!--按名称查询,查询后依然能保持输入框中的值-->

        <?php $showString=null;
        if (isset($_GET['inputtitle']))
        {
            $showString=$_GET['inputtitle'];
        }
        ?>
           <input  type="text" name="inputtitle" id="inputtitle"  class="form-control input-sm" placeholder="<?php echo $multilingual_projectlist_search; ?>" value=<?php echo $showString;?> >

        <!--保证按下查询按钮后，焦点依然在“所有项目”上,隐藏的input,主要是为了传值：当前的tab页是哪一个-->

        <input name="pagetab" id="pagetab" value="<?php echo $pagetabs;?>" style="display:none" />
        <button type="submit" name="bn_search_type" id="bn_seach_type" class="btn btn-default btn-sm" /><span class="glyphicon glyphicon-search" style="display:inline;"></span> <?php echo $multilingual_project_searchbtn ; ?></button>
    </form>
</div>


<!--原wss中按项目名称搜索的表单-->
<!--<div class="search_div pagemarginfix">
    <form id="form1" name="form1" method="get" action="<?php /*echo $pagename; */?>" class="saerch_form form-inline">
        <input  type="text" name="inputtitle" id="inputtitle" class="form-control input-sm" placeholder="<?php /*echo $multilingual_projectlist_search; */?>">
        <input name="pagetab" id="pagetab" value="<?php /*echo $pagetabs;*/?>" style="display:none" />
        <button type="submit" name="button11" id="button11" class="btn btn-default btn-sm" /><span class="glyphicon glyphicon-search" style="display:inline;"></span> <?php /*echo $multilingual_global_searchbtn; */?></button>
    </form>
</div>-->

<!--显示各条记录-->
<?php if ($totalRows_Recordset1 > 0) { // Show if recordset not empty ?>
<div class="table-zhl">
<table  class="table table-striped table-hover glink" width="98%"  >
<!--<table  class="table table-striped table-hover glink" width="98%"  >-->
<!--表头-->
<thead>
  <tr>
<!--表头：项目id-->
    <th>
    <!--点击字段名，会按照该字段名排序-->
	<a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.id&order=<?php
	  if ( $sortlist <> "tk_project.id"){
	  echo "DESC";
	  }else if( $sortlist == "tk_project.id" && $orderlist == "DESC"){
	  echo "ASC";
	  } else {
	  echo "DESC";
	  }
	  ?>" 
	  <?php 
	  if($sortlist=="tk_project.id" && $orderlist=="ASC"){
	  echo "class='sort_asc'";
	  } else if ($sortlist=="tk_project.id" && $orderlist=="DESC"){
	  echo "class='sort_desc'";
	  }
	  ?>>
	<?php echo $multilingual_project_id; ?></a></th>

<!--表头：项目名称-->
    <th>
	<a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_name&order=<?php
	  if ( $sortlist <> "tk_project.project_name"){
	  echo "DESC";
	  }else if( $sortlist == "tk_project.project_name" && $orderlist == "DESC"){
	  echo "ASC";
	  } else {
	  echo "DESC";
	  }
	  ?>"
	  <?php
	  if($sortlist=="tk_project.project_name" && $orderlist=="ASC"){
	  echo "class='sort_asc'";
	  } else if ($sortlist=="tk_project.project_name" && $orderlist=="DESC"){
	  echo "class='sort_desc'";
	  }
	  ?>>
	<?php echo $multilingual_project_title; ?></a></th>

	  <!--表头：项目重要度-->
	  <th>
		  <a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_importance&order=<?php
		  if ( $sortlist <> "tk_project.project_importance"){
			  echo "DESC";
		  }else if( $sortlist == "tk_project.project_importance" && $orderlist == "DESC"){
			  echo "ASC";
		  } else {
			  echo "DESC";
		  }
		  ?>"
		  <?php
		  if($sortlist=="tk_project.project_importance" && $orderlist=="ASC"){
			  echo "class='sort_asc'";
		  } else if ($sortlist=="tk_project.project_importance" && $orderlist=="DESC"){
			  echo "class='sort_desc'";
		  }
		  ?>>
		  <?php echo "项目重要度"; ?></a></th>

    <!--表头：项目类型--><!--todo:需修改项目类型-->
    <th>
    <a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project_type.project_type_backup1&order=<?php
        if ( $sortlist <> "tk_project_type.project_type_backup1"){
          echo "DESC";
        }else if( $sortlist == "tk_project_type.project_type_backup1" && $orderlist == "DESC"){
          echo "ASC";
        } else {
          echo "DESC";
        }
        ?>"
          <?php
          if($sortlist=="tk_project_type.project_type_backup1" && $orderlist=="ASC"){
              echo "class='sort_asc'";
          } else if ($sortlist=="tk_project_type.project_type_backup1" && $orderlist=="DESC"){
              echo "class='sort_desc'";
          }
          ?>>
      <?php echo $multilingual_project_type; ?></a></th>

	  <!--表头：项目来源--><!--todo:需修改项目类型-->
	  <th>
		  <a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_source&order=<?php
		  if ( $sortlist <> "tk_project_type.project_source"){
			  echo "DESC";
		  }else if( $sortlist == "tk_project_type.project_source" && $orderlist == "DESC"){
			  echo "ASC";
		  } else {
			  echo "DESC";
		  }
		  ?>"
		  <?php
		  if($sortlist=="tk_project_type.project_source" && $orderlist=="ASC"){
			  echo "class='sort_asc'";
		  } else if ($sortlist=="tk_project_type.project_source" && $orderlist=="DESC"){
			  echo "class='sort_desc'";
		  }
		  ?>>
		  <?php echo "项目来源"; ?></a></th>

<!--表头：项目code，隐藏？-->
    <th class="hide">
	<a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_code&order=<?php
	  if ( $sortlist <> "tk_project.project_code"){
	  echo "DESC";
	  }else if( $sortlist == "tk_project.project_code" && $orderlist == "DESC"){
	  echo "ASC";
	  } else {
	  echo "DESC";
	  }
	  ?>" 
	  <?php 
	  if($sortlist=="tk_project.project_code" && $orderlist=="ASC"){
	  echo "class='sort_asc'";
	  } else if ($sortlist=="tk_project.project_code" && $orderlist=="DESC"){
	  echo "class='sort_desc'";
	  }
	  ?>>
	<?php echo $multilingual_project_code; ?></a></th>

<!--表头：项目开始时间-->
    <th>
	<a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_start&order=<?php
	  if ( $sortlist <> "tk_project.project_start"){
	  echo "DESC";
	  }else if( $sortlist == "tk_project.project_start" && $orderlist == "DESC"){
	  echo "ASC";
	  } else {
	  echo "DESC";
	  }
	  ?>" 
	  <?php 
	  if($sortlist=="tk_project.project_start" && $orderlist=="ASC"){
	  echo "class='sort_asc'";
	  } else if ($sortlist=="tk_project.project_start" && $orderlist=="DESC"){
	  echo "class='sort_desc'";
	  }
	  ?>>
	<?php echo $multilingual_project_start; ?></a></th>

<!--表头：项目结束时间-->
    <th>
	<a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_end&order=<?php
	  if ( $sortlist <> "tk_project.project_end"){
	  echo "DESC";
	  }else if( $sortlist == "tk_project.project_end" && $orderlist == "DESC"){
	  echo "ASC";
	  } else {
	  echo "DESC";
	  }
	  ?>" 
	  <?php 
	  if($sortlist=="tk_project.project_end" && $orderlist=="ASC"){
	  echo "class='sort_asc'";
	  } else if ($sortlist=="project_end" && $orderlist=="DESC"){
	  echo "class='sort_desc'";
	  }
	  ?>>
	<?php echo $multilingual_project_end; ?></a></th>


	  <!--表头：项目全部负责人-->
	  <th>项目负责人</th>
	  <th>主管院长</th>
	  <th>主管总工</th>
	  <th>主管所长</th>
	  <th>主管主任工程师</th>
	  <th>项目组成员</th>

<!--表头：项目状态-->
    <th>
	<a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_status&order=<?php
	  if ( $sortlist <> "tk_project.project_status"){
	  echo "DESC";
	  }else if( $sortlist == "tk_project.project_status" && $orderlist == "DESC"){
	  echo "ASC";
	  } else {
	  echo "DESC";
	  }
	  ?>" 
	  <?php 
	  if($sortlist=="tk_project.project_status" && $orderlist=="ASC"){
	  echo "class='sort_asc'";
	  } else if ($sortlist=="tk_project.project_status" && $orderlist=="DESC"){
	  echo "class='sort_desc'";
	  }
	  ?>>
	<?php echo $multilingual_project_status; ?></a></th>

<!--表头：项目最后更新时间-->
    <th>
	<a href="<?php echo $pagename; ?>?<?php echo $current_url; ?>&sort=tk_project.project_lastupdate&order=<?php
	  if ( $sortlist <> "tk_project.project_lastupdate"){
	  echo "DESC";
	  }else if( $sortlist == "tk_project.project_lastupdate" && $orderlist == "DESC"){
	  echo "ASC";
	  } else {
	  echo "DESC";
	  }
	  ?>" 
	  <?php 
	  if($sortlist=="tk_project.project_lastupdate" && $orderlist=="ASC"){
	  echo "class='sort_asc'";
	  } else if ($sortlist=="tk_project.project_lastupdate" && $orderlist=="DESC"){
	  echo "class='sort_desc'";
	  }
	  ?>>
	<?php echo $multilingual_global_lastupdate; ?></a></th>
    </tr>
</thead>


<!-- 下面显示各条记录数据-->
<tbody>
  <?php do { ?>
    <tr>
      <td><?php echo $row_Recordset1['id']; ?></td> <!--项目id-->
      <td class="task_title"><a href="project_view.php?recordID=<?php echo $row_Recordset1['id']; ?>&pagetab=<?php echo $pagetabs; ?>" ><?php echo $row_Recordset1['project_name']; ?></a>&nbsp; </td>
      <td class="hide"><?php echo $row_Recordset1['project_code']; ?>&nbsp; </td>
	  <td><?php echo $row_Recordset1['project_importance']; ?>&nbsp; </td><!--项目重要度-->
      <td><?php echo $row_Recordset1['project_type_name']; ?>&nbsp; </td>
	  <td><?php echo $row_Recordset1['project_source']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['project_start']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['project_end']; ?>&nbsp; </td>
	 <!--项目第一负责人-->
<!--		<td><a href="user_view.php?recordID=<?php /*echo $row_Recordset1['project_to_user']; */?>"><?php /*echo $row_Recordset1['tk_display_name']; */?></a>&nbsp; </td>
-->	<!--项目负责人-->
		<td>
		  <?php $userArr=explode(',',$row_Recordset1['project_manager']); $num=count($userArr);
		  for($index=0;$index<$num;$index++)
		  {?><a href="user_view.php?recordID=<?php echo trim($userArr[$index]); ?>"><?php echo $userNameArray[trim($userArr[$index])];if ($num>1 and $index<($num-1)){echo ",";}; ?></a>&nbsp;
		  <?php } ?>
	  </td>
		<!--项目院长-->
		<td>
			<?php $userArr=explode(',',$row_Recordset1['project_dean']); $num=count($userArr);
			for($index=0;$index<$num;$index++)
			{?><a href="user_view.php?recordID=<?php echo trim($userArr[$index]); ?>"><?php echo $userNameArray[trim($userArr[$index])];if ($num>1 and $index<($num-1)){echo ",";}; ?></a>&nbsp;
			<?php } ?>
		</td>

		<!--项目主管总工-->
		<td>
			<?php $userArr=explode(',',$row_Recordset1['project_chief_engineer']); $num=count($userArr);
			for($index=0;$index<$num;$index++)
			{?><a href="user_view.php?recordID=<?php echo trim($userArr[$index]); ?>"><?php echo $userNameArray[trim($userArr[$index])];if ($num>1 and $index<($num-1)){echo ",";}; ?></a>&nbsp;
			<?php } ?>
		</td>

		<!--项目主管所长-->
		<td>
			<?php $userArr=explode(',',$row_Recordset1['project_Director']); $num=count($userArr);
			for($index=0;$index<$num;$index++)
			{?><a href="user_view.php?recordID=<?php echo trim($userArr[$index]); ?>"><?php echo $userNameArray[trim($userArr[$index])];if ($num>1 and $index<($num-1)){echo ",";}; ?></a>&nbsp;
			<?php } ?>
		</td>
		<!--项目主管主任工程师-->
		<td>
			<?php $userArr=explode(',',$row_Recordset1['project_Division_engineer']); $num=count($userArr);
			for($index=0;$index<$num;$index++)
			{?><a href="user_view.php?recordID=<?php echo trim($userArr[$index]); ?>"><?php echo $userNameArray[trim($userArr[$index])];if ($num>1 and $index<($num-1)){echo ",";}; ?></a>&nbsp;
			<?php } ?>
		</td>
		<!--项目组成员-->
		<td>
			<?php $userArr=explode(',',$row_Recordset1['project_member']); $num=count($userArr);
			for($index=0;$index<$num;$index++)
			{?><a href="user_view.php?recordID=<?php echo trim($userArr[$index]); ?>"><?php echo $userNameArray[trim($userArr[$index])];if ($num>1 and $index<($num-1)){echo ",";}; ?></a>&nbsp;
			<?php } ?>
		</td>


      <td><?php echo $row_Recordset1['task_status_display']; ?></td>
      <td><?php echo $row_Recordset1['project_lastupdate']; ?>&nbsp; </td>
      </tr>
    <?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
</tbody>
</table>
</div>

<table class="rowcon" border="0" align="center">
<tr>
<td><table border="0">
  <tr>
    <td><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, 0, $queryString_Recordset1); ?>"><?php echo $multilingual_global_first; ?></a>
        <?php } // Show if not first page ?></td>
    <td><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, max(0, $pageNum_Recordset1 - 1), $queryString_Recordset1); ?>"><?php echo $multilingual_global_previous; ?></a>
        <?php } // Show if not first page ?></td>
    <td><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, min($totalPages_Recordset1, $pageNum_Recordset1 + 1), $queryString_Recordset1); ?>"><?php echo $multilingual_global_next; ?></a>
        <?php } // Show if not last page ?></td>
    <td><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, $totalPages_Recordset1, $queryString_Recordset1); ?>"><?php echo $multilingual_global_last; ?></a>
        <?php } // Show if not last page ?></td>
  </tr>
</table></td>
<td align="right"><?php echo ($startRow_Recordset1 + 1) ?> <?php echo $multilingual_global_to; ?> <?php echo min($startRow_Recordset1 + $maxRows_Recordset1, $totalRows_Recordset1) ?> (<?php echo $multilingual_global_total; ?> <?php echo $totalRows_Recordset1 ?>)</td>
</tr>
</table>
<?php } else { // Show if recordset empty ?>  
  <div class="alert alert-warning" style="margin:6px;">

	<?php echo $multilingual_project_none; ?>

  </div>
<?php } // Show if recordset empty ?>
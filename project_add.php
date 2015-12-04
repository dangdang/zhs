<?php require_once('config/tank_config.php'); ?>
<?php require_once('session_unset.php'); ?>
<?php require_once('session.php'); ?>
<?php
$restrictGoTo = "user_error3.php";
if ($_SESSION['MM_rank'] < "4") {
    header("Location: ". $restrictGoTo);
    exit;
}

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
    $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}



if ( empty( $_POST['project_code'] ) ){
    $project_code = "'',";
}else{
    $project_code = sprintf("%s,", GetSQLValueString(str_replace("%","%%",$_POST['project_code']), "text"));
}

if ( empty( $_POST['project_text'] ) ){
    $project_text = "'',";
}else{
    $project_text = sprintf("%s,", GetSQLValueString(str_replace("%","%%",$_POST['project_text']), "text"));
}

if ( empty( $_POST['project_from_contact'] ) ){
    $project_from_contact = "'',";
}else{
    $project_from_contact = sprintf("%s,", GetSQLValueString(str_replace("%","%%",$_POST['project_from_contact']), "text"));
}

if ( empty( $_POST['project_start'] ) )
    $_POST['project_start'] = '0000-00-00';

if ( empty( $_POST['project_end'] ) )
    $_POST['project_end'] = '0000-00-00';

/*if ( empty( $_POST['project_source'] ) )
    $_POST['project_source'] ='';*/

$project_to_user='';
if ( empty( $_POST['selected_project_manager'] ) )
    $_POST['selected_project_manager'] = '';
else {
    $tempArray = $project_to_user = explode(',', $_POST['selected_project_manager']);
    $project_to_user = $tempArray[0];
  }


if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
    $insertSQL = sprintf("INSERT INTO tk_project (project_name, project_code, project_text, project_start, project_end, project_to_user, project_status,project_type,project_source,project_month_eval,project_manager,project_dean,project_chief_engineer,project_Director,project_Division_engineer,project_member,project_importance,project_from, project_from_user, project_to_dept, project_remark, project_from_contact) VALUES (%s, $project_code $project_text %s, %s, %s, %s,%s, %s, %s, %s,%s, %s, %s, %s,%s,%s,'', '', '', '', '')",
        GetSQLValueString($_POST['project_name'], "text"),
        GetSQLValueString($_POST['project_start'], "date"),
        GetSQLValueString($_POST['project_end'], "date"),
        GetSQLValueString($project_to_user, "text"),
        GetSQLValueString($_POST['project_status'], "text"),
        GetSQLValueString($_POST['project_type'], "text"),
        GetSQLValueString($_POST['project_source'], "text"),
        GetSQLValueString($_POST['project_month_eval'], "text"),
        GetSQLValueString($_POST['selected_project_manager'], "text"),
        GetSQLValueString($_POST['selected_project_dean'], "text"),
        GetSQLValueString($_POST['selected_project_chief_engineer'], "text"),
        GetSQLValueString($_POST['selected_project_Director'], "text"),
        GetSQLValueString($_POST['selected_project_Division_engineer'], "text"),
        GetSQLValueString($_POST['selected_project_member'], "text"),
        GetSQLValueString($_POST['project_importance'], "text"));


    mysql_select_db($database_tankdb, $tankdb);
    $Result1 = mysql_query($insertSQL, $tankdb) or die(mysql_error());
    $newID = mysql_insert_id();
    $insertGoTo = "project_view.php?recordID=$newID";
    if (isset($_SERVER['QUERY_STRING'])) {
        $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
        $insertGoTo .= $_SERVER['QUERY_STRING'];
    };
    header(sprintf("Location: %s", $insertGoTo));
};

$user_arr = get_user_select();

//获取tk_status数据库设定好的值
mysql_select_db($database_tankdb, $tankdb);
$query_Recordset3 = "SELECT * FROM tk_status_project ORDER BY task_status_pbackup1 ASC";
$Recordset3 = mysql_query($query_Recordset3, $tankdb) or die(mysql_error());
$row_Recordset3 = mysql_fetch_assoc($Recordset3);
$totalRows_Recordset3 = mysql_num_rows($Recordset3);

//获取tk_project_type数据库设定好的值
mysql_select_db($database_tankdb, $tankdb);
$query_RS_projet_type = "SELECT * FROM tk_project_type ORDER BY project_type_backup1 ASC";
$Recordset_project_type = mysql_query($query_RS_projet_type, $tankdb) or die(mysql_error());
$row_Recordset_project_type = mysql_fetch_assoc($Recordset_project_type);
$totalRows_Recordset_project_type = mysql_num_rows($Recordset_project_type);

?>
<?php require('head.php'); ?>
	<link type="text/css" href="skin/themes/base/ui.all.css" rel="stylesheet" />
    <link href="skin/themes/base/lhgcheck.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="srcipt/lhgcore.js"></script>
<!--    <script type="text/javascript" src="srcipt/lhgdialog.js"></script>-->
    <script type="text/javascript" src="srcipt/lhgcheck.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap-multiselect.css" type="text/css"/>
<script type="text/javascript" src="bootstrap/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="bootstrap/css/datepicker3.css" type="text/css"/>
<script type="text/javascript" src="bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="bootstrap/js/locales/bootstrap-datepicker.zh-CN.js"></script>


	<script type="text/javascript">
	$(function() {
		$('#datepicker').datepicker({
			format: "yyyy-mm-dd"
	<?php if ($language=="cn") {echo ", language: 'zh-CN'" ;}?>
		});
		$('#datepicker2').datepicker({
			format: "yyyy-mm-dd"
	<?php if ($language=="cn") {echo ", language: 'zh-CN'" ;}?>
		});
	});
	</script>
<script type="text/javascript">
/*lhgcheck插件，用来检查表单的值。name：表单中各控件的name,mid: 表单后紧跟的span的id ,主要是错误提示*/
J.check.rules = [
    { name: 'project_name', mid: 'projecttitle', type: 'limit', requir: true, min: 2, max: 32, warn: '<?php echo $multilingual_projectstatus_titlerequired; ?>' },
	{ name: 'datepicker', mid: 'datepicker_msg', type: 'date',  warn: '<?php echo $multilingual_error_date; ?>' },
	{ name: 'datepicker2', mid: 'datepicker2_msg', type: 'date',  warn: '<?php echo $multilingual_error_date; ?>' },
    { name: 'project_source', mid: 'projectSource', type: 'limit', requir: true },
    { name: 'selected_project_manager', mid: 'csa_to_user_msg', type: 'limit', requir: true,min:1 },
    { name: 'selected_project_dean', mid: 'project_dean_msg', type: 'limit', requir: true ,min:1},
    { name: 'selected_project_chief_engineer', mid: 'project_chief_engineer_msg', type: 'limit', requir: true ,min:1},
    { name: 'selected_project_Director', mid: 'project_Director_msg', type: 'limit', requir: true,min:1 },
    { name: 'selected_project_Division_engineer', mid: 'project_Division_engineer_msg', type: 'limit', requir: true,min:1 },
    { name: 'selected_project_member', mid: 'project_member_msg', type: 'limit', requir: true,min:1 },
];

window.onload = function()
{
    J.check.regform('form1');
};

function option_gourl(str)
{
if(str == '-1')window.open('user_add.php');
if(str == '-2')window.open('project_status.php');
}



</script>
<script charset="utf-8" src="editor/kindeditor.js"></script>
<script charset="utf-8" src="editor/lang/zh_CN.js"></script>
<script>
        var editor;
        KindEditor.ready(function(K) {
                editor = K.create('#project_text', {
			width : '100%',
			height: '100px',
			items:[
        'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
        'flash', 'media', 'insertfile', 'table', 'hr', 'map', 'code', 'pagebreak', 'anchor', 
        'link', 'unlink', '|', 'about'
]
});
        });
</script>
<!-- Initialize the plugin: -->
<script type="text/javascript">
  $(document).ready(function() {

					var orderCount = 0;
					$('#project_manager,#project_dean,#project_chief_engineer,#project_Director,#project_Division_engineer,#project_member').multiselect({

						enableCaseInsensitiveFiltering: true,
						maxHeight: 360,
						buttonWidth:500,
						filterPlaceholder: '<?php echo $multilingual_user_filter; ?>',
						//nonSelectedText: '<?php echo $multilingual_global_select; ?>',
						//includeSelectAllOption: true,
						selectAllValue: 0, // by zhl
						selectAllText: '<?php echo $multilingual_user_filter_selall; ?>',
						numberDisplayed: 15,
                        //记录选择的序号
                        onChange: function(option, checked) {
			                if (checked) {
			                    orderCount++;
			                    $(option).data('order', orderCount);//jquery的data()，给option一个值


			                }
			                else {
			                    $(option).data('order', '');
			                };
                            updateInputValue(this.$select[0].id);
			            },
			             /*onDropdownHidden: function(event) {
                                //updateInputValue(this.$select[0].id);
                         },*/

			            buttonText: function(options) {
			                if (options.length === 0) {
			                   return '请选择人员';
			                }
			                /*else if (options.length > 3) {
			                    return options.length + ' selected';
			                }*/
			                else {
			                    var selected = [];
//			                    var valSelected=[];
			                    var justSelectedText="";
//			                    var justSelectedVal="";
			                    options.each(function() {
			                        if ($(this).data('order')==undefined){ // buttonText先被执行，此时data(order)还未被保存到option中
			                        justSelectedText=$(this).text() ;
//			                        justSelectedVal=$(this).val().toString();
			                       }
			                        else {
			                        selected.push([$(this).text(), $(this).data('order')]);
//			                        valSelected.push([($(this).val()).toString(), $(this).data('order')]);
			                        }
			                    });

			                    selected.sort(function(a, b) {
			                        return a[1] - b[1];//按order的升序排列，这里有问题，最后一次点击的值到下次onchange才能赋序号，导致不能正常显示
			                    });



			                    var showText = '';
			                    for (var i = 0; i < selected.length; i++) {
			                        showText += selected[i][0] + ', ';
			                    }
			                    showText=showText+justSelectedText+ ', ';
                                showText=showText.substr(0, showText.length -2);


                               /* valSelected.sort(function(a, b) {
                                    return a[1] - b[1];
                                });*/

                                /* var text = '';
                                for (var i = 0; i < valSelected.length; i++) {
                                    text += valSelected[i][0] + ', ';
                                }
                                text=text+justSelectedVal;
                                text = text.substring(0, text.length - 2);
                                $('#id').next().val(text) ;*/      //当前元素之后第一个兄弟节点
                                //showText = "<div class='pull-left'>" +showText+"</div>";

			                    return showText;
;
			                   // <!--style='margin-right: 5px;max-width: 100px;overflow: hidden;'-->>"
;
			                }

			            }
                    });
	
  });
  /**by zhl,20150314
   * 增加了一个input来保存multi-select按顺序选择的值，本函数用于当multi-select变化后更新input的值，并触发blur事件，激发j.check进行检查
   * @param id
   * @returns {string}
   */
  function updateInputValue(id)
  {
       var selected = [];

        $('#'+id+' option:selected').each(function() {
            selected.push([($(this).val()).toString(), $(this).data('order')]);
        });
        selected.sort(function(a, b) {
            return a[1] - b[1];
        });

        var text = '';
        for (var i = 0; i < selected.length; i++) {
            text += selected[i][0] + ',';
        }
        text = text.substring(0, text.length - 1);//不包括最后一个“，”
        $('#'+id).parent().next().val(text).blur();//给input控件赋值的同时，触发input.blur事件，以利用J.check进行检查
        //return text ;
  }

  /**
   *在提交数据前进行数据的检查和处理
  *by zhl,20150303
  */
//function dataCheck(){
//在记录项目负责人的顺序;
/*$("#selected_project_manager").val(getMultiSelectValue('project_manager'));
$("#selected_project_dean").val(getMultiSelectValue('project_dean'));
$("#selected_project_chief_engineer").val(getMultiSelectValue('project_chief_engineer'));
$("#selected_project_Director").val(getMultiSelectValue('project_Director'));
$("#selected_project_Division_engineer").val(getMultiSelectValue('project_Division_engineer'));
$("#selected_project_member").val(getMultiSelectValue('project_member'));*/

/*alert($("#project_name").val());*/
//}


</script>



<form action="<?php echo $editFormAction; ?>" method="post" name="myform" id="form1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="25%" class="input_task_right_bg" valign="top"><table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td valign="top" class="gray2">
	 <h4 style="margin-top:40px" ><strong><?php echo $multilingual_project_view_nowbs; ?></strong></h4>
	 <p >
	 <?php echo $multilingual_project_add_text; ?></p>
              
              </td>
          </tr>
        </table></td>
      <td width="75%" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="5" align="center">
          <tr>
            <td><div class="col-xs-12 column">
                <h3><?php echo $multilingual_projectlist_new; ?></h3>



             <!--用两个panel页来获得项目信息-->

            <div class="row clearfix">
				<div class="col-xs-6 column">
					  <div class="panel panel-default">
	                     <div class="panel-heading">
		                    <label  >基本信息</label>
	                    </div>

	                    <div class="panel-body">
		                    <!--填写项目名称-->
		                    <!--label后面跟的span主要是未来利用lhgcheck插件检查后进行错误提示的-->
                              <div class="form-group col-xs-12">
                                <label for="project_name"><?php echo $multilingual_project_title; ?><span id="projecttitle"></span></label>
                                <div>
                                <input type="text" name="project_name" id="project_name" value="" class="form-control" placeholder="<?php echo $multilingual_project_title_tips; ?>" />
                                </div>
                              </div>

                              <!--zhl:填写项目类型：指令性、合同性、临时性-->
                               <div class="form-group  col-xs-12">
                                  <label for="project_type" ><?php echo $multilingual_project_type; ?></label>
                                  <div >
                                     <select id="project_type" name="project_type" onChange="option_gourl(this.value)"  class="form-control">
                                          <?php do { ?>
                                                <option value="<?php echo $row_Recordset_project_type['ptid']?>"><?php echo $row_Recordset_project_type['project_type_name']?></option>
                                            <?php
                                            } while ($row_Recordset_project_type = mysql_fetch_assoc($Recordset_project_type));
                                            $rows = mysql_num_rows($Recordset_project_type);
                                            if($rows > 0) {
                                                mysql_data_seek($Recordset_project_type, 0);
                                                $row_Recordset_project_type = mysql_fetch_assoc($Recordset_project_type);
                                            } ?>
                                            <?php if ($_SESSION['MM_rank'] > "4") { ?>
                                                <option value="-2" class="gray" >+<?php echo $multilingual_projecttype_new; ?></option>
                                            <?php } ?>
                                     </select>
                                      </div>
                                    </div>

                               <!--todo zhl:填写项目来源：甲方名称？-->
                               <div class="form-group  col-xs-12">
                                    <label for="project_source" ><?php echo $multilingual_project_source; ?></label><span id="projectSource"></span></label>
                                  <div >
                                     <input type="text" name="project_source" id="project_source" value="" class="form-control" placeholder="甲方" />
                                  </div>
                                </div>

                                  <!--zhl:填写项目估计人月-->
                               <div class="form-group  col-xs-12">
                                    <label for="project_month_eval" ><?php echo $multilingual_project_month_eval; ?></label>
                                 <!-- <div >
                                     <input type="text" name="project_month_eval" id="project_month_eval" value="" class="form-control" placeholder="项目估计工作量（人月）" />
                                  </div>-->
                                  <div >
                                      <select id="project_month_eval" name="project_month_eval" onChange="option_gourl(this.value)"  class="form-control">
                                            <?php for($i=1;$i<=24;$i++) {  ?>
											<option value='<?php echo $i?>'> <?php echo $i?></option>
										<?php } ?>
                                       </select>
                                  </div>
                                </div>




                            <!--  <div class="form-group  col-xs-12 hide">
                                <label for="project_code"><?php /*echo $multilingual_project_code; */?></label>
                                <div>
                                  <input name="project_code" id="project_code" type="text" value="" class="form-control" placeholder="<?php /*echo $multilingual_project_code;*/?>">
                                </div>
                                <span class="help-block"><?php /*echo $multilingual_project_code; */?></span>
                              </div>-->

                                <!--todo zhl:项目状态信息,需优化-->
                              <div class="form-group col-xs-12">
                                <label for="project_status"><?php echo $multilingual_project_status; ?></label>
                                <div>
                                    <select name="project_status" id="project_status" onChange="option_gourl(this.value)" class="form-control">
                                       <?php do { ?>
											<option value="<?php echo $row_Recordset3['psid']?>"><?php echo $row_Recordset3['task_status']?></option>
										<?php
										} while ($row_Recordset3 = mysql_fetch_assoc($Recordset3));
										$rows = mysql_num_rows($Recordset3);
										if($rows > 0) {
											mysql_data_seek($Recordset3, 0);
											$row_Recordset3 = mysql_fetch_assoc($Recordset3);
										} ?>
										<?php if ($_SESSION['MM_rank'] > "4") { ?>
											<option value="-2" class="gray" >+<?php echo $multilingual_projectstatus_new; ?></option>
										<?php } ?>
                                    </select>
                                </div>
                                <span class="help-block"><?php echo $multilingual_project_tips; ?></span>
                              </div>

                                <!--zhl:项目重要度-->
                              <div class="form-group col-xs-12">
                                <label for="project_importance">项目重要度</label>
                                <div>
                                    <select name="project_importance" id="project_importance" " class="form-control">
                                        <option value="重大">重大</option>
                                        <option value="重要">重要</option>
                                        <option value="一般" selected="selected">一般</option>
                                     </select>
                                </div>
                               </div>

                                 <!--选择项目开始时间-->
                                <div class="form-group col-xs-12">
                                <label for="datepicker"><?php echo $multilingual_project_start; ?><span id="datepicker_msg"></span></label>
                                <div>
                                  <input type="text" name="project_start" id="datepicker" value="<?php echo date('Y-m-d'); ?>" class="form-control"  />
                                </div>
                              </div>
                             <!--选择项目结束时间-->
                              <div class="form-group col-xs-12">
                                <label for="datepicker2"><?php echo $multilingual_project_end; ?><span id="datepicker2_msg"></span></label>
                                <div>
                                  <input type="text" name="project_end" id="datepicker2" value="<?php echo date("Y-m-d",strtotime("+7 day")); ?>" class="form-control" />
                                </div>
                              </div>

                              <!--zhl:项目描述-->
                              <div class="form-group col-xs-12">
                                <label for="project_text"><?php echo $multilingual_project_description; ?></label>
                                <div>
                                  <textarea name="project_text" id="project_text"></textarea>
                                </div>
                              </div>


		                  </div>
					  </div>
				</div>

				<div class="col-xs-6 column">
					 <div class="panel panel-default">
	                     <div class="panel-heading">
		                    <label  >人员信息</label>
	                    </div>
	                    <div class="panel-body">
		                     <!--填写项目负责人-->
                             <div class="form-group  col-xs-12" >
                              <label for="project_manager" ><?php echo $multilingual_project_touser; ?><span id="csa_to_user_msg" ></span></label>
                                 <div>
                                    <select id="project_manager"   name="project_manager" multiple="multiple"> <!--style="width:100%;overflow:hidden;"-->  //class="form-control">
	                                  <?php foreach($user_arr as $key => $val){ ?>
                                          <option value='<?php echo $val["uid"]?>'><?php $py = strtoupper(substr($val["pinyin"], 0, 1));echo $py."-".$val["name"]?></option>
                                      <?php } ?>
									<!--todo:如果是管理员？可以创建新的人员,需增加代码，新建用户-->
	                                       <!-- <?php /*if ($_SESSION['MM_rank'] > "4") { */?>
	                                            <option value="-1" class="gray" onchange="option_gourl(this.value)" >+<?php /*echo $multilingual_user_new; */?></option>
	                                        --><?php /*} */?>
	                                  </select>

                                  </div>
                                    <!-- 下面的input记录multi-select的值，应紧贴包含select的那个div下面 -->
                                  <input name="selected_project_manager" type="hidden" id="selected_project_manager" />
                                  <span class="help-block"><?php echo $multilingual_personSelect_tips;?></span>
                              </div>

                                 <!--填写项目主管院长-->
                             <div class="form-group  col-xs-12" >
                              <label for="project_dean" >项目主管院长<span id="project_dean_msg" ></span></label>
                                 <div>
                                    <select name="project_dean" id="project_dean" multiple="multiple"  >  //class="form-control">
	                                    <?php foreach($user_arr as $key => $val){ ?>
                                            <option value='<?php echo $val["uid"]?>'><?php $py = strtoupper(substr($val["pinyin"], 0, 1));echo $py."-".$val["name"]?></option>
                                        <?php } ?>
	                                 </select>
                                  </div>
                                  <input name="selected_project_dean" type="hidden" id="selected_project_dean" />
                                  <span class="help-block"><?php echo $multilingual_personSelect_tips;?></span>
                              </div>

                             <!--填写项目主管总工-->
                             <div class="form-group  col-xs-12" >
                              <label for="project_chief_engineer" >项目主管总工<span id="project_chief_engineer_msg" ></span></label>
                                 <div>
                                    <select name="project_chief_engineer" id="project_chief_engineer"  multiple="multiple">
	                                        <?php foreach($user_arr as $key => $val){ ?>
                                            <option value='<?php echo $val["uid"]?>'><?php $py = strtoupper(substr($val["pinyin"], 0, 1));echo $py."-".$val["name"]?></option>
                                            <?php } ?>
	                                  </select>
                                  </div>
                                  <input name="selected_project_chief_engineer" type="hidden" id="selected_project_chief_engineer" />
                                  <span class="help-block"><?php echo $multilingual_personSelect_tips;?></span>
                              </div>

                                    <!--填写项目主管所长-->
                             <div class="form-group  col-xs-12" >
                              <label for="project_Director" >项目主管所长<span id="project_Director_msg" ></span></label>
                                 <div>
                                    <select name="project_Director" id="project_Director"  multiple="multiple">  //class="form-control">
	                                    <?php foreach($user_arr as $key => $val){ ?>
                                        <option value='<?php echo $val["uid"]?>'><?php $py = strtoupper(substr($val["pinyin"], 0, 1));echo $py."-".$val["name"]?></option>
                                        <?php } ?>
	                                  </select>
                                  </div>
                                  <input name="selected_project_Director" type="hidden" id="selected_project_Director" />
                                  <span class="help-block"><?php echo $multilingual_personSelect_tips;?></span>
                              </div>

							      <!--填写项目主管主任工程师-->
                             <div class="form-group  col-xs-12" >
                              <label for="project_Division_engineer" >项目主管主任工程师<span id="project_Division_engineer_msg"  ></span></label>
                                 <div>
                                    <select name="project_Division_engineer"  id="project_Division_engineer"  multiple="multiple">  //class="form-control">
	                                        <?php foreach($user_arr as $key => $val){ ?>
                                        <option value='<?php echo $val["uid"]?>'><?php $py = strtoupper(substr($val["pinyin"], 0, 1));echo $py."-".$val["name"]?></option>
                                            <?php } ?>
	                                  </select>
                                  </div>
                                  <input name="selected_project_Division_engineer" type="hidden" id="selected_project_Division_engineer" />
                                  <span class="help-block"><?php echo $multilingual_personSelect_tips;?></span>
                              </div>


                            <!--zhl:填写项目成员-->
                            <div class="form-group  col-xs-12">
								<label for="project_member" >项目组成员<span id="project_member_msg"></span></label>
                                    <div >
                                      <select name="project_member" id="project_member" multiple="multiple" >
                                            <?php foreach ($user_arr as $key => $val) { ?>
                                        <option value='<?php echo $val["uid"]?>'><?php $py = strtoupper(substr($val["pinyin"], 0, 1));echo $py."-".$val["name"]?></option>
                                        <?php } ?>
                                        </select>
                                    </div>
                                     <input name="selected_project_member" type="hidden" id="selected_project_member" />
                                    <span class="help-block"><?php echo $multilingual_personSelect_tips;?></span>
	                        </div>

	                    </div>
					  </div>
				</div>
			</div>
		  </div>

				</td>
          </tr>
        </table></td>
    </tr>
    <tr class="input_task_bottom_bg" >
	<td></td>
      <td height="50px">
	  
	  <button type="submit" class="btn btn-primary btn-sm submitbutton" name="cont" >提交</button> <?php /*echo $multilingual_global_action_save; */?><!--</button>-->
      <button type="button" class="btn btn-default btn-sm" onClick="javascript:history.go(-1);"><?php echo $multilingual_global_action_cancel; ?></button>
          

        <input type="hidden" name="MM_insert" value="form1" /></td>
    </tr>
  </table>

</form>
<?php require('foot.php'); ?>
</body>
</html>
<?php
mysql_free_result($Recordset3);
mysql_free_result($Recordset_project_type);
?>
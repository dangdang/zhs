<?php require_once('config/tank_config.php'); ?><!--连接数据库、包含预定义函数、取相关配载参数-->
<?php require_once('session_unset.php'); ?><!--登陆前清空所有session信息-->
<?php require_once('session.php'); ?>
<?php
$url_this = $_SERVER["QUERY_STRING"] ;

$current_url = current(explode("&sort",$url_this));

//获取tk_project_type数据库设定好的值
mysql_select_db($database_tankdb, $tankdb);
$query_RS_projet_type = "SELECT * FROM tk_project_type ORDER BY project_type_backup1 ASC";
$Recordset_project_type = mysql_query($query_RS_projet_type, $tankdb) or die(mysql_error());
$row_Recordset_project_type = mysql_fetch_assoc($Recordset_project_type);
$totalRows_Recordset_project_type = mysql_num_rows($Recordset_project_type);

?>

<?php require('head.php'); ?>

<link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />

<script src='fullcalendar/lib/moment.min.js'></script>
<!-- <script src='fullcalendar/lib/jquery.min.js'></script> <!V1.11.3 ,统一放在head.php来引用jquery -->
<script src='fullcalendar/fullcalendar.min.js'></script>
<script src='fullcalendar/lang/zh-cn.js'></script>

<!-- <link rel="stylesheet" href="bootstrap/css/datepicker3.css" type="text/css"/>
<script type="text/javascript" src="bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="bootstrap/js/locales/bootstrap-datepicker.zh-CN.js"></script> -->

<link rel="stylesheet" href="bootstrap/css/bootstrap-datetimepicker.min.css" type="text/css"/>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<link rel="stylesheet" href="bootstrap/css/bootstrap-timepicker.min.css" type="text/css"/>
<script type="text/javascript" src="bootstrap/js/bootstrap-timepicker.min.js" charset="UTF-8"></script>
<!-- <script type="text/javascript" src="bootstrap/js/locales/bootstrap-timepicker.zh-CN.js" charset="UTF-8"></script> -->
<script>

 


</script>


             <div class="form-group ">
                <label for="datepicker">选择填写日期<span id="datepicker_msg"></span></label>
                
                <div>
                   <span style="position: relative; z-index: 999999999;"> 
                  <input type="text" name="log_date"  id="log_datetimepicker" value="<?php echo date('Y-m-d'); ?>" class="form-control"  />
                   </span>
                </div>
              
             </div>

              <div class="form-group">
                      <label for="dtp_input1" class="col-md-2 control-label">DateTime Picking</label>
                      <!-- <span style="position: relative; z-index: 9999;">   -->
                        <div class="input-group date form_datetime1 col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                            <input class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                      <!-- </span> -->
              <input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
             </div>


                  <div class="form-group">
                <label for="dtp_input2" class="col-md-2 control-label">Date Picking</label>
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
        <input type="hidden" id="dtp_input2" value="" /><br/>
            </div>

            <div class="input-group bootstrap-timepicker timepicker">
            <input id="timepicker1" type="text" class="form-control input-small">
            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
        </div>
 
        <script type="text/javascript">
            $('#timepicker1').timepicker();
            
        </script>

<script type="text/javascript">
      $('.form_date').datetimepicker({
        //language:  'fr',
  //       weekStart: 1,
  //       todayBtn:  1,
    // autoclose: 1,
    // todayHighlight: 1,
    // startView: 2,
    // forceParse: 0,
  //       showMeridian: 1
    });
      $('.form_datetime1').datetimepicker();

        $('#log_datetimepicker').datetimepicker({
    // format: "yyyy-mm-dd",
    // language: 'zh-CN' 
    });


      </script>     

  <?php require('foot.php'); ?>


</body>
</html>
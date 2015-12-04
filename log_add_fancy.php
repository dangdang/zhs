<?php require_once('config/tank_config.php'); ?><!--连接数据库、包含预定义函数、取相关配载参数-->
<?php require_once('session.php'); ?>
<?php
$url_this = $_SERVER["QUERY_STRING"] ;

$current_url = current(explode("&sort",$url_this));

//获取tk_project_type数据库设定好的值
// mysql_select_db($database_tankdb, $tankdb);
// $query_RS_projet_type = "SELECT * FROM tk_project_type ORDER BY project_type_backup1 ASC";
// $Recordset_project_type = mysql_query($query_RS_projet_type, $tankdb) or die(mysql_error());
// $row_Recordset_project_type = mysql_fetch_assoc($Recordset_project_type);
// $totalRows_Recordset_project_type = mysql_num_rows($Recordset_project_type);

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"> <!--bootstrap V3 ,201501 by superlin-->
  <link href="skin/themes/base/tk_style.css" rel="stylesheet" type="text/css" />

  <link href="skin/themes/base/zhs_zhl_style.css" rel="stylesheet" type="text/css" /> <!--综合所系统定制的css，by zhl -->

  <script type="text/javascript" src="srcipt/jquery.js"></script> <!--jQuery v2.1.0-->
  <script type="text/javascript" src="srcipt/js.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script> <!--bootstrap v3.3.4 ,201501 by superlin-->

  <link rel="stylesheet" href="bootstrap/css/bootstrap-datetimepicker.min.css" type="text/css"/>
  <script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

  <link rel="stylesheet" href="bootstrap/css/bootstrap-timepicker.min.css" type="text/css"/>
  <script type="text/javascript" src="bootstrap/js/bootstrap-timepicker.min.js" charset="UTF-8"></script>

</head>

<body>
    <form>    
      <div class="form-group col-md-6">
                <label for="datepicker">选择填写日期<span id="datepicker_msg"></span></label>
                
                <div>
                   <span style="position: relative; z-index: 999999999;"> 
                  <input type="text" name="log_date"  id="log_datetimepicker" value="<?php echo date('Y-m-d'); ?>" class="form-control"  />
                   </span>
                </div>
              
      </div>

            <label for="logStartTime">工作开始时刻<span id="datepicker_msg"></span></label> 
            <div class="form-group input-group bootstrap-timepicker timepicker col-md-6">
              <input id="logStartTime" type="text" class="form-control input-small">
              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
            </div>

              <div class="form-group">
                      <label for="dtp_input1" class="col-md-6 control-label">DateTime Picking</label>
                      <!-- <span style="position: relative; z-index: 9999;">   -->
                        <div class="input-group date form_datetime1 col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                            <input class="form-control"  type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                      <!-- </span> -->
              <input type="hidden" id="dtp_input1" value="" /><br/>
            </div>

            <div class="input-group bootstrap-timepicker timepicker">
            <input id="timepicker1" type="text" class="form-control input-small">
            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
            </div>

            <button type="button" class="btn btn-default" >取消</button>
            <button type="button" class="btn btn-primary">提交</button>

      </form>
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

  
</body>
</html>

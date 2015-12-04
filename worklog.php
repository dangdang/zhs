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
<script type="text/javascript" src="bootstrap/js/bootstrap-timepicker.min.js" ></script>

<link href="skin/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="srcipt/jquery-ui-1.10.4.min.js"></script>

<link href="skin/themes/base/lhgdialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="srcipt/lhgcore.js"></script>
<script type="text/javascript" src="srcipt/lhgdialog.js"></script>


<script>

  $(document).ready(function(){

    $('#startDatetimepicker')
      .datetimepicker({
          
          autoclose:true,
          // todayBtn:true,
          startView:'day',
          weekStart:1,
          startDate:'2010-01-01',
          endDate:'+1d',
          // todayHighlight:true,
          minuteStep:30,
          language:'zh-CN'
          // showMeridian:true, //加分割线
      })
      .on('changeDate', function(ev){
        // if (ev.date.valueOf() < date-start-display.valueOf()){  ....}
         // alert($(this).val());
         $('#endDatetimepicker').val($(this).val());
         $('#endDatetimepicker').datetimepicker('setStartDate',$(this).val());
       });
      
    $('#endDatetimepicker').datetimepicker({
              autoclose:true,
        // todayBtn:true,
        startView:'day',
        weekStart:1,
        startDate:'2010-01-01',
        endDate:'+1d',//比当前时间晚1天
        // todayHighlight:true,
        minuteStep:30,
        language:'zh-CN'
      });
        // showMeridian:true, //加分割线);
    // $('#logStartTime').timepicker();

    $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
//           defaultDate: '2015-02-12',
          editable: true,
          eventLimit: true, // allow "more" link when too many events
          dayClick: function(date, jsEvent, view) {
//              J.dialog.get({ id: 'test', title: '填写日志', page: 'log_add_J.php' });
//              alert('Clicked on: ' + date.format());
//             var selDate =$.fullCalendar.formatDate(date,'yyyy-MM-dd');//格式化日期
				var clickDate=date.format("YYYYMMDD");
          J.dialog.get({ id: 'log_add', title: '工作日志', page: 'log_add.php?date='+clickDate+'&taskid=0&userid=<?php echo $_SESSION['MM_uid'];?>&projectid=0&tasktype=0' });
            
//              $('#startDatetimepicker').val(clickDateTime);
//              $('#endDatetimepicker').val(clickDateTime);

//              $('#logAddModal').modal();
           },
          events: 'api/task.php',
          eventClick: function(event, element) {
        	  window.location="default_task_edit.php?editID="+event.id+"&pagetab=mtask"
//               J.dialog.get({ id: event.id, title: '工作日志', page: 'log_view.php?taskid=' });

          }
        });

});


</script>



<div class="subnav">
  <div id='calendar' style=" max-width: 900px;margin: 0 auto;font-size: 14px;"></div>

</div><!--subnav -->

<?php 
echo $_SESSION['MM_Displayname'].",";
echo $_SESSION['MM_uid'].",";
echo $_SESSION['MM_rank'];
?>

  <?php require('foot.php'); ?>


</body>
</html>
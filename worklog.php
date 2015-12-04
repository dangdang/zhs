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
<link rel="stylesheet" href="fullcalendar/fullcalendar.css"/>


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

<!-- 工时滑动条 -->
<!--  <script>
//  $(function() {
//    var select = $( "#csa_tb_manhour" );
//    var slider = $( "<div id='slider' class='pull-left' style='width:442px; margin:5px;'></div>" ).insertAfter( select ).slider({
//      min: 0,
//      max: 49,
//      range: "min",
//      value: select[ 0 ].selectedIndex + 0.5,
//      slide: function( event, ui ) {
//        select[ 0 ].selectedIndex = ui.value - 0.5;
//      }
//    });
//    $( "#csa_tb_manhour" ).change(function() {
//      slider.slider( "value", this.selectedIndex + 0.5 );
//    });
//  });
</script> -->


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
          defaultDate: '2015-02-12',
          editable: true,
          eventLimit: true, // allow "more" link when too many events
          dayClick: function(date, jsEvent, view) {
             // J.dialog.get({ id: 'test', title: '填写日志', page: 'log_add_J.php' });
             // alert('Clicked on: ' + date.format());
            // var selDate =$.fullCalendar.formatDate(date,'yyyy-MM-dd');//格式化日期
          
            var clickDateTime=date.format("YYYY-MM-DD H:ss");
             $('#startDatetimepicker').val(clickDateTime);
             $('#endDatetimepicker').val(clickDateTime);

             $('#logAddModal').modal();
            //调用fancybox弹出层
             // $.fancybox({
             //    type:'iframe',
             //    title:'填写日志',
             //    href:'log_add_fancy.php',
             //    modal:'true',//填写日志的窗口没关闭之前不能转换焦点
             //    scrolling : 'auto',
             //    preload   : true,
             //    maxWidth : 400,
             //    maxHeight : 300,
             //    width   : '40%',
             //    height    : '40%',
             //    autoSize  : false,
             //    closeClick  : false,
             //    autoResize:true,
             //    autoCenter:true
             // });
           },
          events: [
            {
              title: 'All Day Event',
              start: '2015-02-01'
            },
            {
              title: 'Long Event',
              start: '2015-02-07',
              end: '2015-02-10'
            },
            {
              id: 999,
              title: 'Repeating Event',
              start: '2015-02-09T16:00:00'
            },
            {
              id: 999,
              title: 'Repeating Event',
              start: '2015-02-16T16:00:00'
            },
            {
              title: 'Conference',
              start: '2015-02-11',
              end: '2015-02-13'
            },
            {
              title: 'Meeting',
              start: '2015-02-12T10:30:00',
              end: '2015-02-12T12:30:00'
            },
            {
              title: 'Lunch',
              start: '2015-02-12T12:00:00'
            },
            {
              title: 'Meeting',
              start: '2015-02-12T14:30:00'
            },
            {
              title: 'Happy Hour',
              start: '2015-02-12T17:30:00'
            },
            {
              title: 'Dinner',
              start: '2015-02-12T20:00:00'
            },
            {
              title: 'Birthday Party',
              start: '2015-02-13T07:00:00'
            },
            {
              title: 'Click for Google',
              url: 'http://google.com/',
              start: '2015-02-28'
            }
          ]
        });

});


</script>



<div class="subnav">
  <div id='calendar' style=" max-width: 900px;margin: 0 auto;font-size: 14px;"></div>

</div><!--subnav -->
<!-- <button type="button" class="btn btn-default" onclick="$('#logAddModal').modal();">button</button> -->

<!-- 弹出模式对话框内容（隐藏） -->
<div class="modal" id="logAddModal" tabindex="-1" role="dialog" aria-labelledby="logAddModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="logAddModalLabel"><strong>填写项目日志</strong></h4>
      </div>
      <div class="modal-body">
        <form>
          <!--选择日志填写时间-->
                 <!--用户当前选择的日期  -->
<!--             <div class="form-group ">
               <h3 class="text-center"><?php echo date('Y-m-d'); ?></h3>
             </div>  -->

          <!-- 开始时间 -->
              <div class="form-group ">
                <label for="startDatetimepicker">开始时间<!-- <span id="datepicker_msg"></span> --></label>
                <div>
                  <input type="text" name="start_datetime" id="startDatetimepicker" value="<?php echo date('Y-m-d'); ?>" class="form-control"  readonly>
                  </div>
             </div>
         
           <!--结束时间 -->
              <div class="form-group ">
                <label for="endDatetimepicker">结束时间<!-- <span id="datepicker_msg"></span> --></label>
                <div>
                  <input type="text" name="send_datetime" id="endDatetimepicker" value="<?php echo date('Y-m-d'); ?>" class="form-control"  readonly>
                  </div>
             </div>
          
 

            <!-- timepiciker控件，选择开始时间 -->
<!--             <label for="logStartTime">工作开始时刻<span id="datepicker_msg"></span></label> 
            <div class="form-group col-xs-5 input-group bootstrap-timepicker timepicker">
              <span style="position: relative; z-index: 9999;">
                <input id="logStartTime" type="text" class="form-control input-small" readonly></span>
              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span> -->

          <!-- 时间滑块，来自jquery ui的控件 -->
          <!-- <div class="form-group ">
              <label for="csa_tb_manhour" class="pull-left">所用工时</label>
              <div class="pull-right">    
                <select name="csa_tb_manhour" id="csa_tb_manhour">
                              <option value="0" selected="selected">0</option>
                              <option value="0.5">0.5</option>
                              <option value="1">1</option>
                              <option value="1.5">1.5</option>
                              <option value="2">2</option>
                              <option value="2.5">2.5</option>
                              <option value="3">3</option>
                              <option value="3.5">3.5</option>
                              <option value="4">4</option>
                              <option value="4.5">4.5</option>
                              <option value="5">5</option>
                              <option value="5.5">5.5</option>
                              <option value="6">6</option>
                              <option value="6.5">6.5</option>
                              <option value="7">7</option>
                              <option value="7.5">7.5</option>
                              <option value="8">8</option>
                              <option value="8.5">8.5</option>
                              <option value="9">9</option>
                              <option value="9.5">9.5</option>
                              <option value="10">10</option>
                              <option value="10.5">10.5</option>
                              <option value="11">11</option>
                              <option value="11.5">11.5</option>
                              <option value="12">12</option>
                              <option value="12.5">12.5</option>
                              <option value="13">13</option>
                              <option value="13.5">13.5</option>
                              <option value="14">14</option>
                              <option value="14.5">14.5</option>
                              <option value="15">15</option>
                              <option value="15.5">15.5</option>
                              <option value="16">16</option>
                              <option value="16.5">16.5</option>
                              <option value="17">17</option>
                              <option value="17.5">17.5</option>
                              <option value="18">18</option>
                              <option value="18.5">18.5</option>
                              <option value="19">19</option>
                              <option value="19.5">19.5</option>
                              <option value="20">20</option>
                              <option value="20.5">20.5</option>
                              <option value="21">21</option>
                              <option value="21.5">21.5</option>
                              <option value="22">22</option>
                              <option value="22.5">22.5</option>
                              <option value="23">23</option>
                              <option value="23.5">23.5</option>
                              <option value="24">24</option>
                    </select>
                 </div>
            </div> -->
            
            
     
          <!--zhl:该用户参与的项目（或分为两类：负责的、参与的），用下拉列表框实现-->
             <div class="form-group  ">
                <label for="project_type" >项目名称</label>
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

 

          <div class="form-group ">
            <label for="message-text" class="control-label">备注</label>
            <textarea class="form-control" id="message-text" placeholder="描述工作内容"></textarea>
          </div>
        </form>

      </div>
      <div class="modal-footer center ">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>



  <?php require('foot.php'); ?>


</body>
</html>
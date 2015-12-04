// JavaScript Document
$(function() {
		//$("#sdate").val(getMyDate("yyyy-mm-dd"));
		//$("#edate").val(getMyDate("yyyy-mm-dd",1,"d"));
		$("#loading").ajaxStart(function(){
		   $(this).html("Starting..");
		 }); 
		$("#loading").ajaxStop(function(){
			   $(this).html("Stop..");
			 }); 
		var dates = $( "#sdate, #edate" ).datepicker({
			dateFormat: 'yy-mm-dd',
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				var option = this.id == "sdate" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" );
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
		$(".department").live('click',function(){getDept(this.title,$(this).parent());return false;});
		$(".bureau").live('click',function(){getBureauUser(this,this.title);return false;});
		$(".user").live('click',function(){$("#consignee").val(this.title);$("#receiver").val($(this).attr("href"));$("#organize").dialog("close");return false;});
		$("#consignee").bind('click',function(){$("#organize").dialog({width:300,height:400,modal:true});getOrganize();});
		$("#create_consign").bind('click',function(){ createConsign();});
		$("input[name=getmodel]").bind('click',function(){jslog('getmodel switch');$("#model_list_"+this.id).toggle();});
		$("input:checkbox[name*=model_]").live('click',function(){jslog(this.id);$("#all_"+this.id).attr("checked","")});
		$("input:checkbox[name=all]").live('click',function(){$("input:checkbox[name=model_"+this.value+"]").attr("checked","true")});
		$("input[name=sysid]").bind('click',function(){sysid(this.value)});
		$("input").bind('focus',function(e){
			//jslog("target:"+event.target);
			$(this).removeClass("error");
			
		});
		getConsign();
});
function getOrganize(){

	if($("#alldep").length==0){
	$.getJSON("/wcwt/getOrganize",{ac:"department"},function(data){
		var html="<ul id='alldep'>"
		$.each( $(data), function(k, v){
			if(v!=null){
			html+="<li id='"+v+"00'> + <a href='#' title='"+v+"'  class='department'>"+v+"</a></li>";
			}
		});
		html+="</ul>";
		$("#organize").remove("#alldep");
		$("#organize").append(html);
		var ss=$("#user_dep").val();
		getDept(ss,$(".department[title="+ss+"]").parent());
	}); 
	}
}
function getDept(dept,obj){
	var ll=$(obj).children().length;
	jslog("getDept:"+dept+ll);
	
	if(ll==1){
		
	$.getJSON("/wcwt/getOrganize",{ac:"bureau",dep:dept},function(data){
		jslog(data);
		var html="<ul id='"+dept+"' >"
		$.each( $(data), function(k, v){
			if(v!=""&&v!=null){
				html+="<li id='"+v+"0'> |-+ <a href='#' title='"+v+"' class='bureau'>"+v+"</a></li>";
			}	
		});
		html+="</ul>";
		//$("#"+dept+"00").children(0).empty();
		$(obj).append(html);
		//jslog(obj);
		//jslog($(obj).children("ul"));
		

		getDeptUser(dept,$(obj).children("ul"));
			
	}); 
	}else{
		$(obj).children("ul").toggle();
	}
}
function getDeptUser(dept,obj){
	
	$.getJSON("/wcwt/getOrganize",{ac:"user",dep:dept,bureau:""},function(data){
		var html="";
		$.each( $(data), function(k, v){
			html+="<li> |-- <a href='"+v.userid+"' title='"+v.name+" ["+dept+"]' class='user'>"+v.name+"</a></li>";
		//	jslog(html);
		});
		$(obj).prepend(html);
	});
}
function getBureauUser(obj,bureau){
	var depname=$(obj).parent().parent().attr("id");//部门名称
	var bb=$(obj).parent();
	var ll=$(bb).children().length;
	jslog("getBureauUser:"+bureau+ll);
	
	if(ll==1){

	$.getJSON("/wcwt/getOrganize",{ac:"user",dep:depname,bureau:bureau},function(data){
		var html="<ul class='user'>";
		$.each( $(data), function(k, v){
			html+="<li> |---- <a href='"+v.userid+"' title='"+v.name+" ["+depname+" "+bureau+"]' class='user'>"+v.name+"</a></li>";
		//	jslog(html);
		});
		$(bb).append(html);
	});
	}else{
		$(bb).children("ul").toggle();
	}
}
function sysid(sysid){
	jslog("showext:"+sysid);
	$("#model_ext_"+sysid).toggle();
	if($("#all_"+sysid).attr("checked")==true){
		$("#model_list_"+sysid).hide();
		$("#all_"+sysid).attr("checked","");
	}else{
		if($("#model_list_"+sysid).children().length==0){
			jslog("getModels:");
			getModels(sysid);
		}
		//$("#model_list_"+sysid).show();
		
		$("#all_"+sysid).attr("checked","true");
	}
	
	
}
function getModels(sysid){
//	jslog(sysid);

	$.getJSON("/wcwt/ajax/getmodels/"+sysid,function(data){
		// jslog($(data).result);
		 //$("#model_list_"+sysid).empty();
		 //$("#model_list_"+sysid).append('');
		 var html='<table border="0" cellspacing="0" cellpadding="0" class="TableList"><tr>';
		 var c=0;
		 $.each( $(data), function(k, v){
			 jslog(k+"--"+v);
			// jslog(v.name);
			 c++;
			 html+="<td><label><input type='checkbox' checked='checked' id='"+sysid+"' name='model_"+sysid+"' value='"+v.id+"' />"+v.name+"</label></td>";
			 
			 if(c%5==0){
				 html+="</tr><tr>";
			 }
			
			}); 
		 html+="</tr></table>";
		 $("#model_list_"+sysid).append(html);
		}); 
	}
function createConsign(){
	var msg="";
	if($.trim($("#receiver").val())==""){
		$("#consignee").addClass("error");
		msg+="请选择受托人\r\n";
	}
	if($("#sdate").val()==""||$("#edate").val()==""){
		$("#sdate").addClass("error");
		$("#edate").addClass("error");
		msg+="请选择委托期限\r\n";
	}
	if(!$("#sysid_1").attr("checked")&&!$("#sysid_2").attr("checked")){
		$("#sysid_1").addClass("error");
		$("#sysid_2").addClass("error");
		msg+="请至少选择一个委托系统OA\r\n";
	}
	if($("#sysid_2").attr("checked")&&$("#emoney").val()==""){
		$("#smoney").addClass("error");
		$("#emoney").addClass("error");
		msg+="报销系统：请输入委托金额\r\n";
	}
	if(msg!=""){
	alert(msg);
	return false;
	}

	$.each($("input:checked[name='sysid']"),function(){
		var models=new Array();
		var sysid=this.value;
		var $checkedmodels=$("#model_list_"+sysid+" input:checked");
		//$checkedmodels=$("#models_"+sysid);	
		jslog($checkedmodels);
		//models=$checkedmodels.length;
			$.each($checkedmodels,function(){
				models.push(this.value);
				//jslog("K:"+k+"||v:"+this.value);
			});
			//jslog("models "+sysid+":"+models);
		
		$.get("/wcwt/createConsign",{ac:"createConsign",sysid:sysid,sender:$("#sender").val(),receiver:$("#receiver").val(),models:models.join(","),sdate:$("#sdate").val(),edate:$("#edate").val(),moneybot:$("#smoney").val(),moneytop:$("#emoney").val()},function(data){
			//data=eval("("+data+")"); 
			//jslog("create:");
			//jslog(data);
			if(data.id==0){
				jslog(data);
				alert("有错误发生");
				return;
			}
			
			}); 
	});
	//
	//jslog("ff");
	
	CommonTab(0,"menuAobj","a","menuTabobj",0);
	getConsign();
}
function getConsign(){
	$("#consign_list").empty();
	 $("#consign_list").append("<tr><td colspan=5>正在载入委托列表,请稍候......</td></tr>");
	$.getJSON("/wcwt/ajax/getConsign/0",function(data){
		// jslog($(data).length);
		jslog("载入委托列表");
		//jslog(data);
		 //jslog(data.rownums);
		 $("#consign_list").empty();
		 if($(data).length==0){
				$("#consign_list").append("<tr><td colspan=5>目前没有任何委托</td></tr>");
		 }else{
		 $.each( data, function(k, v){
			 jslog(" ... "+v.system.sysname);
			 $("#consign_list").append("<tr><td>"+v.system.sysname+"</td><td>"+getModelDetail(v.models)+"</td><td>"+v.sender.name+" > "+v.receiver.name+"</td><td>"+v.sdate.substr(0,10)+"至"+v.edate.substr(0,10)+"</td></tr>");
			 
			}); 
		 }
		});
	
}
function getModelDetail(obj){
	var r="";
	$.each(obj,function(k,v){
		r+=v.name+" ";
	});
	return r;
}
function jslog(msg){
	//if(console){
		//alert(typof(console));
	if(typeof(console)!="undefined" ){
		console.log(msg);
	}	
	
	//}
	}
function getMyDate(type,increment,ymd){
	if(type==""){
		type="yyyy-mm-dd";
		}
var myDate = new Date();
   // myDate.getYear();       //获取当前年份(2位)
    var y=myDate.getFullYear();   //获取完整的年份(4位,1970-????)
    var m=myDate.getMonth();      //获取当前月份(0-11,0代表1月)
    var d=myDate.getDate();       //获取当前日(1-31)
   // myDate.getDay();        //获取当前星期X(0-6,0代表星期天)
    //myDate.getTime();       //获取当前时间(从1970.1.1开始的毫秒数)
    //myDate.getHours();      //获取当前小时数(0-23)
    //myDate.getMinutes();    //获取当前分钟数(0-59)
    //myDate.getSeconds();    //获取当前秒数(0-59)
    //myDate.getMilliseconds();   //获取当前毫秒数(0-999)
    //myDate.toLocaleDateString();    //获取当前日期
   // var mytime=myDate.toLocaleTimeString();    //获取当前时间
    //myDate.toLocaleString( );       //获取日期与时间
	m=m+1;
	if(m<10){m="0"+m;}
	if(d<10){d="0"+d;}
	
		switch(ymd){
			case 'y':
			y+=increment;
			break;
			case 'm':
			m+=increment;
			break;
			case 'd':
			d+=increment;
			break;
			default:
			}
	
	var date=y+"-"+m+"-"+d;
	if(type=="yyyy-mm-dd"){
	return date;
	}
	if(type=="ymdhi"){
		var h=myDate.getHours();
		var i=myDate.getMinutes();
		if(h<10){h="0"+h;}
		if(i<10){i="0"+i;}
		return y+m+d+h+i;
	}
}
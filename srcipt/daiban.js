$(function() {
	if($("#gwmxtab").length==0&&$("#gwhztab").length==0){
		//jslog("not invoke daiban");
		return;
	}
	$("body").append('<OBJECT CLASSID="CLSID:F83A15A2-BAD8-465E-85C4-74ACB165924C" ID="SafeCtrl" width=0 height=0></OBJECT><input type="hidden" name="db_daiban_count" id="db_daiban_count" /><input type="hidden" name="db_daiban_process" id="db_daiban_process" /><input type="hidden" id="db_user_code" /><div class="ComSty" id="noteview">   <table width="100%" class="T" border="0" cellpadding="0" cellspacing="0">    <td class="T_L"></td>       <td class="T_C_L"> 待办提示 </td>       <td class="T_C_R"><a href="#" class="daibtsclose"> 关闭</a> </td>       <td class="T_R"></td>  </table>   <div class="G">     <div class="G_L">       <div class="G_R"> &nbsp;&nbsp;<font id="dbuserid"></font> ,您好!<br>         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您现有&nbsp;<font size=2 id="tscount"></font>&nbsp;条新公务需办理! <br>         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;含即将超时<font color="#0000FF" size=2>&nbsp;<font id="csgw"></font>&nbsp;</font>条，已超时<font color="#FF0000" size=2>&nbsp;<font id="ycsgw"></font>&nbsp;</font>条! </div>     </div>   </div></div>');
		var userid=$("#db_userid").val();
		//
		if(userid!="null"){
			jslog("dangan user code: "+getCertSN());
			$("#db_user_code").val(getCertSN());
			getConnectors();
		}
		
		$("#dbuserid").html($("#username").html());
		
	$("#gwmxtab").bind("click",function(){
		$("#gwhz").hide();
		$("#gwmx").show();	
		return false;
	});
	$("#gwhztab").bind("click",function(){
		$("#gwmx").hide();
		$("#gwhz").show();
		return false;
	});
	$(".daibtsclose").bind("click",function(){
		closeNotice();
	});
	$('#gwloading').flash({
		src : '/public/images/common/loading.swf',
		width : 15,
		height :15
	});
});

function closeNotice() {
	$('#noteview').slideUp();
	//dismiss();
}
function showNotice() {
	$("#noteview").slideDown();   //显示公告
	//showAlert(1);
    setTimeout(closeNotice, 10000);   //一分钟后隐藏公告
}
function getConnectors(){
	$("#gwloading").show();
	//jslog("getConnectors"+new Date());
	$("#db_daiban_process").val("0");
	//$("#gwmx").html('<tr><td class="dot"></td><td class="dotted" ><a href="#" onclick="getMingxi();return false;" title="如果在获取新的待办数据时等待时间过长，可点此取消！">正在为您查询新的待办信息(点击取消)</a>:<div id="daiban_msg"></div></div></td></tr>');
	var userid=$("#db_userid").val();
	$.getJSON("/Daiban/getDaibans",function(datass){
		var x=datass.length;
		$("#db_daiban_count").val(x);
		for(var i=0;i<x;i++){
			connect(datass[i].mcName,datass[i].identifying,userid,"","","","");
		}
	});
    setTimeout(getConnectors, 600000);//设置，600
}

function connect(mcName,identifying,userid,title,begin,end,creat){
	//$("#daiban_msg").append("<div id=_"+identifying+">&nbsp;&nbsp;&nbsp;&nbsp;"+mcName+"...");
	$.get("/Daiban/getList",{identifying:identifying,userid:userid,title:title,begin:begin,end:end,creat:creat,code:$("#db_user_code").val()},function(d){
		//$("#_"+identifying).append("已完成!");
		var x=$("#db_daiban_process").val();
		x++;
		if(x==$("#db_daiban_count").val()){
			getMingxi();
			$("#gwloading").hide();
		}
		$("#db_daiban_process").val(x);
	});
}
function getMingxi(){
	var userid=$("#db_userid").val();
	//jslog("get daiban Mingxi : "+userid);
	$.get("/Daiban/getMingxi",{userid:userid},function(datass){
		var html="";
		$.each($(datass),function(k,v){
			if(k<7){
				var url=v.readUrl;
				var x=url.substring(0,4);
				if(x!="http") url="http://"+url;
			html += '<tr><td class="dot"></td><td class="dotted"> <a href="'+url+'" target="_blank" ><font class="db_status_'+v.status+'">'+v.title+'</font></a></td></tr>';
			}
			});
		if(html==""){
			html='<tr><td class="dot"></td><td class="dotted" >暂时没有需要您办理的事务</td></tr>';
		}
		getHuizong(userid);
		$("#gwmx").html(html);
	});
	
}
function getHuizong(userid){

	$.get("/daiban/gethuizong",{userid:userid},function(d){
		var html="";
		
		var r=new Array(7);
		var all=0;
		var c=0;
		$.each($(d),function(k,v){
			var htmlext="";
			if(v.count.indexOf("*")!=-1){
				
				var x=v.count.substring(1);
				r=x.split(',');
				if(r[1]!=null&&r[1]!='0'){
					htmlext +=', '+r[1]+' 条为新到';
				}
				if(r[2]!=null&&r[2]!='0'){
					htmlext +=','+r[2]+' 条为预处理';
				}
				if(r[3]!=null&&r[3]!='0'){
					htmlext +=','+r[3]+' 条为领导未办';
				}
				if(r[4]!=null&&r[4]!='0'){
					htmlext +=','+r[4]+' 条为沟通任务';
				}
					$("#csgw").html(r[5]);
					
					$("#ycsgw").html(r[6]);
				c=r[0];
				
			}else{
				c=v.count;
			}
			all+=parseInt(c);
			html += '<tr><td class="dot"></td><td class="dotted" > <a href="'+v.moreUrl+'" target="_blank" class="adb"> ['+v.connector.mcName+'] 有'+c+'条待办'+htmlext+'</a></td></tr>';
			});
		
		$("#gwhz").html(html);
		$("#tscount").html(all);
		$("#countmx").html(all);
		if(all>0){showNotice();}
	});
}
function showAlert(tscount){
	
	if(tscount>0){
		alertWin = window.createPopup();
		jslog(alertWin);
		alertWin.document.createStyleSheet("http://stat.hq.ctc.com:8080/v5/Scripts/iframe_utf8.css");  
	alertBody = alertWin.document.body;
//	st = "" + "<table height='136' class='daibtsbg' cellpadding='0' cellspacing='0' align='center' width='295'>";
//	st = st + "	<tr>";
//	st = st + "<td width='11' height='24'>&nbsp;</td><td width='234' class='daibtstitle'>待办提示</td>";
//	st = st + "<td width='50' class='daibtsclose'>关闭</td></tr>";
//	
//    st = st + "	<tr><td>&nbsp;</td><td colspan='2' class='daibts'>&nbsp;&nbsp;岳梅" ;
//	st = st + ",您好!<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您现有&nbsp;<font size=2>"+tscount+"</font>&nbsp;条新公务需办理!";
//	//st = st + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;含即将超时<font color='#0000FF' size=2>&nbsp;0&nbsp;</font>条，已超时<font color='#FF0000' size=2>&nbsp;0&nbsp;</font>条!";
//	
//	st = st + "</td></tr></table>";
//	alertBody.innerHTML = st;
	alertBody.innerHTML = $("#noteview").html();
	alertWin.document.body.onclick = dismiss;
	popTime = 100;
	alertWin.show(0,0,295,136);
	window.setTimeout("dismiss()",2000000);  
	}
}
 function dismiss(){
	alertWin.hide();
  }

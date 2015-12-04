// JavaScript Document
window.onbeforeunload = function() {

}
$(function() {
	getLayout();
	if($('#model_clock').length>0){
		$('#model_clock').flash({
			src : $("#db_clock").val(),
			width : '100%',
			height : 150
		});
		$('#ClockID').flash({
			src : '/public/Wide_Themes/'+$("#db_inputStyle").val()+'/flash/clock.swf',
			width : 100,
			height :100
		});
	}
	if($('.setUserModel').length>0){
		$(".setUserModel").click(function(){
			openUserModel(this);
			return false;
		});
	}
	/**
	 * 设置字体
	 */
	//setFontsize($.cookie('fontsize'));	
	$("input[name='clock']").live("click",function(){
		
		$("#clock_demo").empty();
		$("#clock_demo").flash(
				{
					src : $(this).val(),
					width : '100%',
					height : 150
				});
	});
	$("#go_province").click(function(){
		jslog("go provincd");
		var x=$("#dialogModel");
		x.dialog({
			position: 'center',
			modal : true,
			title:$(this).attr("title"),
			width:700,
			height:550
			});
		x.html('<iframe name="umfrm" height="100%" width="100%"  marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" allowtransparency="true" scrolling="no"></iframe>');
		x.children(0).attr("src",$(this).attr("href"));
		return false;
	});
	//获取OA——json数据
	var userid=$("#db_userid").val();
	if(userid!=""){
		$("[id^='json_']").each(function(){
			//jslog(this.id);
			var url=$("#news_"+this.id).val();
			if(url!=null&&url!="undefined"){
				
				getOAinfo(userid,url,this);
			}
			
		});
	}
	loadContent("tongxunlu");
	
	$("#dxxxtab").click(function(){
		$("#json_jcck,#news_jcck,#json_dxxxjcck").hide();
		$("#json_dxxx,#news_dxxx").show();
		return false;
	});
	$("#jccktab").click(function(){
		$("#json_dxxx,#news_dxxx,#json_dxxxjcck").hide();
		$("#json_jcck,#news_jcck").show();
		return false;
	});
	$("a[href='#']").click(function(){
		return false;
	});
	setTimeout(function(){ heatbeat(); }, 300000);
	model_pllist();
	//设置时间
	var t=getDateArray();
	$(".Date_year").html(t[0]+"年"+t[1]+"月");
	$(".Date_ri").html(t[2]+"日");
	$(".Date_weeks").html(t[3]);
});
/*
 * 设置模块内部链接排序
 * */
function model_pllist(){
	$("input[id^='model_pllist_']").each(function(){
		model_plsort($(this).prev(),$(this).val());
	});
}
function model_plsort(obj,list){
	jslog("xxxxxx");
	var l=list.replace("[","").replace("]","");
	jslog(l);
	if(l==""||l.length<2) return;
	var a=l.split(",");
	obj.children().each(function(){
		$(this).hide();
	});
	for(var b in a){
		var x=$("#m_a_"+parseInt(a[b]));
		obj.append(x);
		x.show();
		
	}
}
function getOAinfo(userid,url,obj){
	//jslog("getoainfo"+url);
	//alert(url);
	$.getJSON(url,function(d){
		var html="";
		html+='<table class="itbl" cellpadding="0" cellspacing="0">';
		$.each(d,function(entryIndex,entry){   
			var newimg="";
			if(entry['isnew']=='true'){ newimg='<img src="/public/images/new.gif" border=0 />';}
			html += '<tr><td class="dot"></td><td class ="dotted"><a href="'+entry['url']+'" target="_blank">'+entry['title']+'</a>'+newimg+'</td></tr>';
        }); 
		
		html+='</table>';
		$(obj).html(html);
		//月度工作报告占电信信息最后一条
		if(obj.id=="json_dxxxjcck"){
			var x=$("#json_ydgzbg tr:first");
			if(x.length>0){
			$(obj).find("tr:last").replaceWith($("#json_ydgzbg tr:first"));
			}
		}
	});
	
}


function createMask() {
	
	jslog(this.id + ' start sortable, creat Mask');

	// 创建背景
	var rootEl = document.documentElement || document.body;
	var docHeight = ((rootEl.clientHeight > rootEl.scrollHeight) ? rootEl.clientHeight
			: rootEl.scrollHeight)
			+ "px";
	var docWidth = ((rootEl.clientWidth > rootEl.scrollWidth) ? rootEl.clientWidth
			: rootEl.scrollWidth)
			+ "px";
	var shieldStyle = "position:absolute;top:0px;left:0px;width:"
			+ docWidth
			+ ";height:"
			+ docHeight
			+ ";background:#000;z-index:10000;filter:alpha(opacity=0);opacity:0";
	$("<div id='shield' style=" + shieldStyle + "></div>").appendTo("body");
}
function removeMask() {
	$("#shield").remove();
}
function getLayout() {
	
	if($("#column1").length>0){
		appendLayout("column1");
	}
	if($("#column2").length>0){
		appendLayout("column2");
	}
	if($("#column2").length>0){
		appendLayout("column3");
	}
	
	// $().log('end getLayout');
}
function appendLayout(tmp) {
	jslog('start appendLayout ' + tmp);
	var s = $("#db_"+tmp).val();
	if (s == null || s == '' || s == 'undefined') {
		return false;
	}
	jslog(tmp + ' cookie:' + s);
	var dd = s.replace(/\[\]=/g, '_');
	var a = dd.split("&");
	$.each(a, function(k, v) {
		$("#" + tmp).append($("#" + v));
	});
	jslog('end appendLayout ' + tmp);
}

function sortable_save() {
	var s = $("#" + this.id).sortable('serialize');
	$("#db_"+this.id).val(s);
}
function sortable_start() {
	jslog(this.id + ' start sortable');
	/*
	 * if(this.id=='cl'||this.id=='cc'||this.id=='cr'){ return; }else{
	 * $(".column").sortable('disable'); jslog('column sortable disable'); }
	 */
}
function sortreset(name) {
	var s = $("#" + name).sortable('serialize');
	$.cookie(name, s, {
		expires : 9999
	});
	// $("#+name").log('布局'+name+'序列化COOKIE '+s);
}
function loadContent(i) {
	if (i == 'gongwen') {this.window.open('http://oa.hq.ctc.com/chtweboa/public/search.nsf/SearchForm?OpenForm','gonwen');}
	if (i == 'dangan') {$("#searchiframe").html('<form name="frmda" action="http://dxda.hq.ctc.com:8080/AMS7/QueryFromPortalLogin" target="_blank" method="post"><input style="display:none;" name="C_SERIALNUM"><input type="text" name="keyWords" class="Txt" onfocus="javascript:frmda.C_SERIALNUM.value=getCertSN();"> <input name="submit" type="submit" value="搜索" class="But"/></form>');}
	if (i == 'zonghe') {$("#searchiframe").html('<form target="_blank" action="http://search.hq.ctc.com/search" method="post"><input type="hidden" name="resultPath" value="result.jsp"><input type="text" name="wd" id="names"  class="Txt"/> <input name="submit" type="submit" value="搜索" class="But"/><div style="display:none"><label for="内网"><input type="checkbox" name="nd" id="内网" value="内网" checked/>内网</label><label for="外网"><input type="checkbox" name="nd" id="外网" value="外网" checked/>外网</label></div></form>');}
	if (i == 'tongxunlu') {$("#searchiframe").html('<form name="frmtxl" onsubmit=\'javascript:window.open("http://oa.hq.ctc.com/chtweboa/public/addressbook.nsf/Navigation?openpage&key="+escape(frmtxl.key.value),"_blank");return false;\'><input name="key" class="Txt"/> <input name="submit" type="submit" value="搜索" class="But"/></form>');}
}

// 关闭窗口
function exit() {
	window.open('', '_self', '');
	window.close();
}
function setFontsize(size) {
	if (size != "") {
		$("*").each(function() {
			var lll = this.id;
			if (lll != "")
				$("#" + lll).css("font-size", size);
		});
		$.cookie('fontsize', size);
	}
}
function effect(id, f) {
	if (f == 'slidedown') {
		$("#" + id).slideDown(500);
	}
	if (f == 'slideup') {
		var obj = event.toElement;
		if (obj == null)
			return;
		if (obj.id == "config_finish") {
			// jslog(obj.id);
			setTimeout('$("#config_effect").slideUp(1000)', 3000);
		}
	}
}
function openUserModel(obj){
	var pmid=$(obj).attr("href");
	if(pmid==7589){
		change189();
		return false;
	}
	var x=$("#dialogModel");
	x.dialog({
		position: 'center',
		modal : true,
		title:$(obj).attr("title"),
		width:550,
		buttons:{
			"保存":function(){
				if(pmid==7588){
					var flashurl="";
					$("input[name='clock']").each(function(i){
						if($(this).attr("checked")==true)
							flashurl=$(this).val();
						 }); 
					//jslog(flashurl);
					$.get("/portal/setClock",{flashurl:flashurl},function(d){
						//jslog("设置时钟"+flashurl);
						$('#model_clock').empty();
						$('#model_clock').flash(
								{
									src : flashurl,
									width : '100%',
									height : 150
								});
						x.dialog("close");
						
					});
				}else if(pmid==7589){
					$("#dialogModel").html("save");
					
				}else{
					var xx=$(window.frames["umfrm"].document).find("#right");
					var rl=xx.getAllIndex();
					if(rl.length>0){
						$.get("/portal/saveModel",{id:$(obj).attr("href"),links:rl},function(d){
							var mm=$(".model_pllist_"+$(obj).attr("href"));
							mm.val(d);
							model_plsort(mm.prev(),d);
							x.dialog("close");
						});
					}else{
						alert("自定义 列表不能为空");
					}
				}
			}
		}
	});
	
	if(pmid==7588){
		setClock();		
	}else{
		x.html('<iframe name="umfrm" height="380" width="100%"  marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" allowtransparency="true" scrolling="no"></iframe>');
		x.children(0).attr("src","/portal/usermodel?id="+pmid);
	}
	jslog("finished");
	return false;
}
function setClock(x){
	$.get("/portal/getclocks",function(d){
		var html="<form name='clockfrm'>";
		for(var c in d){
			html+='<label><input type="radio" name="clock" value="'+d[c].flashUrl+'">'+d[c].plName+'</label>';
		}
		html+='</form><div id="clock_demo"></div>';
		$("#dialogModel").html(html);
		$("input[value='"+$("#db_clock").val()+"']").attr("checked",true);
		$("#clock_demo").flash({
			src : $("#db_clock").val(),
			width : '100%',
			height : 150
		});
	});
}
function sortableModels(){
	jslog('.column sortable');
	$(".column").sortable({
		connectWith : '.column',
		appendTo : '.column',
		cursor : 'move',
		delay : 100,
		update : sortable_save,
		// scroll:true,
		start : createMask,
		stop : removeMask,
		placeholder : 'widget-placeholder',
		forcePlaceholderSize : true,
		// items:'li',
		//cancel : '#gzdh_ul,#cywz_ul,#gzwz_ul,#cwtjyb_ul,#dss_ul',
		revert : true,
		disabled :false
	});
	$(".column").disableSelection();
	
	jslog('sortable complete');
}
function heatbeat(){
	$.get("/application/heartbeat",function(d){});
	setTimeout(function(){ heatbeat(); }, 300000);
}
function sstyle(style,psID){
	//alert("iebrowser"+$.support.leadingWhitespace);
    if (style != "") {
    	
    	$("#db_inputStyle").val(psID);
    	$('#ClockID').empty();
    	$('#ClockID').flash({src:'/public/Wide_Themes/'+psID+'/flash/clock.swf',width:100,height:100});
        if (getBrowser()=="ie6"||$.support.leadingWhitespace) {
            //chrome firefox safari ie9
            $("#sstyle").attr("href",style);
        }else {
            //IE7,ie8
        	$("#sstyle").remove();
        	var x=document.styleSheets["iestyle"];
        	try{
        		x.removeImport(0);	
        	}catch(e){}
            x.addImport(style,0);
        }
        $.get("/Portal/setStyle",{psUrl:style},function(d){});
    }
}
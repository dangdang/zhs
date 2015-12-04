// JavaScript Document

//部门门户
function bumenmenhu(){

		document.write("<form name='bmfrm' action='http://bmportal.hq.ctc.com:8099/telecomportal/marketindex/market_index.shtml'><input type=hidden name='portal' value='yes'/><input type=hidden name='newportal' value='yes'/><input type=hidden name='j_username' value='"+readCookie('userid')+"'/><input type=hidden name='isManager' value='"+readCookie('isManager')+"'/><input type=hidden name='pgroups' value='"+readCookie('pgroups')+"'/></form>");
		document.bmfrm.submit();
	}
//WLAN访客管理
function wlanlink(){
	window.open('http://10.3.64.251/uac/policy/MyWlan.xhtm?method=login&username='+readCookie('userid')+'&frame=Guest.xhtm?method=toCreateGuest','_blank');
	}
//定义菜单
//1,2,3,4为权限代码
//1= "领导日程安排(领导版)";
//2 = "董办内部信息网";
//3 = "出入门卡管理";
//4 = "政企客户事业部OA";
//取URL字符串
function getQry(key){ 
var search=location.search.slice(1);//得到get方式提交的查询字符串 
var arr=search.split("&"); 
for(var i=0;i<arr.length;i++){ 
	var ar=arr[i].split("="); 
	if(ar[0]==key){ 
		return ar[1]; 
		} 
	} 
} 
//是否拥有指定用户组权限
//pgroups用户组集
//g指定用户组
//c显示内容
function inGroup(pgroups,g,c){
var a=pgroups.split("--");
for(i=0;i<a.length;i++){
	if(-1!=a[i].indexOf(g)){
		 document.write(c);
		return true;
	}
}
//document.write(c);
//return false;
}

//监事会，无财务报销
//c隐藏内容
//s替换内容
function isJianshihui(pgroups,c,s){
var a=pgroups.split("--");
for(i=0;i<a.length;i++){
	if(-1!=a[i].indexOf('ou+监事会,ou+中国电信集团,dc+hq,dc+ctc,dc+com')){
		 document.write(s);
		return true;
	}
}
document.write(c);
//return false;
}


//秘书，领导日程安排
//c隐藏内容
//s替换内容
//日程安排领导组
function isLingdaoricheng(pgroups,c,s,pic){
var a=pgroups.split("--");
for(i=0;i<a.length;i++){
	if(a[i]=='GRUP.PRIVATE_DATASOURCE.un:日程安排领导组'){
		if(pic==1){
			document.write('<li><a target="_blank" href="http://oa.hq.ctc.com/chtweboa/public/homepage.nsf/xPortal?openagent&type=leaderplan&t='+timestamp()+'">领导日程安排</a></li>');
		
		return true;
			}
		document.write('<div align="center"><a target="_blank" href="http://oa.hq.ctc.com/chtweboa/public/homepage.nsf/xPortal?openagent&type=leaderplan&t='+timestamp()+'"><img src="/public/images/jt_home21_44.gif" border="0" /></a></div>');
		
		return true;
		}
	if(a[i]=='GRUP.PRIVATE_DATASOURCE.un:领导日程安排'){
		 document.write(s);
		if(pic==0) return true;
		
	}
}
document.write(c);
//return false;
}
//卫星公司:直接链接到邮箱
//c隐藏内容
//s替换内容
function isWeixing(pgroups,url){
var a=pgroups.split("--");
for(i=0;i<a.length;i++){
		
	if(-1!=a[i].indexOf('卫星公司,ou+中国电信集团,dc+hq,dc+ctc,dc+com')){
	
		window.open(url,'_top');
		return true;
	}
}

}
//号码百事通
function isBesttone(userid,url){
	if(userid=="besttone"){
		 	window.open(url,'_top');
			return true;
		}
	}

// Example:

// writeCookie("myCookie", "my name", 24);

// Stores the string "my name" in the cookie "myCookie" which expires after 24 hours.

function writeCookie(name, value, hours)

{

  var expire = "";

  if(hours != null)

  {

    expire = new Date((new Date()).getTime() + hours * 3600000);

    expire = "; expires=" + expire.toGMTString();

  }

  document.cookie = name + "=" + escape(value) + expire;

}

// Example:

// alert( readCookie("myCookie") );

function readCookie(name)

{

  var cookieValue = "";

  var search = name + "=";

  if(document.cookie.length > 0)

  { 

    offset = document.cookie.indexOf(search);

    if (offset != -1)

    { 

      offset += search.length;

      end = document.cookie.indexOf(";", offset);

      if (end == -1) end = document.cookie.length;

      cookieValue = unescape(document.cookie.substring(offset, end))

    }

  }

  return cookieValue;

}

//检测智能卡
function getCertSN() {
		try {
			if(SafeCtrl.USB_OpenDevice(0)) {
				//alert("未检测到智能卡！");
				frmda.keyWords.value="未检测到智能卡！";
				return -1;
			}
			var certSN = SafeCtrl.USB_GetSerialNumberEx(3);
			if(certSN == "")
			{
				SafeCtrl.USB_CloseDevice();
				alert(SafeCtrl.GetLastErrorInfo());
				return -1;			
			}
			SafeCtrl.USB_CloseDevice();
			
			
			return certSN;
		} catch(e) {
			alert("客户端没有正确安装，请下载安装后再试！");
			return '-1';
		}
    }

function getMyDate(type){
	if(type==""){
		type="ymd";
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
	var date=y+"-"+m+"-"+d;
	if(type=="ymd"){
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
function timestamp(){
	 var d = new Date();
	 return d.getTime();
}
function loading(hidediv,showdiv){
		 document.getElementById(hidediv).style.display="none";
		document.getElementById(showdiv).style.display="block";
	}
function loadContent(i){

	if(i=='gwmx')
	{
		dbjc.innerHTML='<div id="loadgwmx" style=" margin-top:50px; margin-left:200px;"><img align="middle" src="/public/images/load.gif" width="31" height="31" alt="Loading..." /></div><div id="ifgwmx" style="display:none"><iframe width="100%" height="140" frameborder="0" onload=javascript:loading("loadgwmx","ifgwmx"); src="http://oc.hq.ctc.com:8089/portal_sys/telecomportal/transactwork/showTransactWorkNewMX.shtml?userName='+readCookie('userid')+'&num=6&substr=36&style=http://stat.hq.ctc.com:8080/v5/Scripts/iframe_utf8.css" scrolling="no"></iframe></a>';
		gwmx.style.color="#DA5636";
		gwhz.style.color="#AB7F75";
	}
	if(i=='gwhz')
	{
		dbjc.innerHTML='<div id="loadgwhz" style=" margin-top:50px; margin-left:200px;"><img align="middle" src="/public/images/load.gif" width="31" height="31" alt="Loading..." /></div><div id="ifgwhz" style="display:none"><iframe width="100%" height="140" frameborder="0" onload=javascript:loading("loadgwhz","ifgwhz");   src="http://oc.hq.ctc.com:8089/portal_sys/telecomportal/transactwork/showTransactWorkNewHZ.shtml?userName='+readCookie('userid')+'&num=6&substr=26&style=http://stat.hq.ctc.com:8080/v5/Scripts/iframe_utf8.css&" scrolling="no"></iframe>';
		gwhz.style.color="#DA5636";
		gwmx.style.color="#AB7F75";
	}
	if(i=='mailbox'){
		mailbox.innerHTML='<iframe width="100%" height="140" frameborder="0"  src="http://oa.hq.ctc.com/chtweboa/public/homepage.nsf/xPortal?openagent&t='+timestamp()+'&userid='+readCookie('userid')+'&num=5&substr=35&style=http://stat.hq.ctc.com:8080/v5/Scripts/iframe.css&type=mailbox" scrolling="no"></iframe>';
		}
	if(i=='gongwen'){
		this.window.open('http://oa.hq.ctc.com/chtweboa/public/search.nsf/SearchForm?OpenForm','gonwen');
		}
	if(i=='dangan'){
		searchiframe.innerHTML='<table><OBJECT CLASSID="CLSID:F83A15A2-BAD8-465E-85C4-74ACB165924C" ID="SafeCtrl" width=0 height=0></OBJECT><tr><form name="frmda" action="http://dxda.hq.ctc.com:8080/AMS7/QueryFromPortalLogin" target="_blank" method="post"><td><input type = "hidden" value="" name="C_SERIALNUM"><input type="text" name="keyWords" value="" size="15" onfocus="javascript:frmda.C_SERIALNUM.value=getCertSN();"><input name="submit" type="submit" / style="background:url(/public/images/but_search.gif);width:74px;height:22px; border:0px"  value=" 搜 索 " /></td>   </form>  </tr></table>';
		
	}
	if(i=='zonghe'){
		
		searchiframe.innerHTML='<table><tr><form target="_blank" action="http://search.hq.ctc.com/search" method="post"><td norap><input type="hidden" name="resultPath" value="result.jsp"><input type="text" name="wd" size="15" id="names"/><input name="submit" type="submit" / style="background:url(/public/images/but_search.gif);width:74px;height:22px; border:0px"  value=" 搜 索 " /><div style="display:none"><label for="内网"><input type="checkbox" name="nd" id="内网" value="内网" checked/>内网</label><label for="外网"><input type="checkbox" name="nd" id="外网" value="外网" checked/>外网</label></div></td></form></tr></table>';
		}
	if(i=='tongxunlu'){
		searchiframe.innerHTML='<table><tr><form name="frmtxl" onsubmit=\'javascript:window.open("http://oa.hq.ctc.com/chtweboa/public/addressbook.nsf/Navigation?openpage&key="+escape(frmtxl.key.value),"_blank");return false;\'><td><input name="key" value="" size=15><input name="submit" type="submit" / style="background:url(/public/images/but_search.gif);width:74px;height:22px; border:0px"  value=" 搜 索 " /></td></form></tr></table>';
	}
	if(i=='menu'){
		 searchiframe.innerHTML='<div>&nbsp;<input name="text" type="text" id="inputString" onblur="fill();" onkeyup="lookup(this.value);" value="" size="22" /></div><div class="suggestionsBox" id="suggestions" style="display: none;" onClick=""><div class="suggestionList" id="autoSuggestionsList" onClick=""></div></div>';
		}
		if(i=='bbs'){
		 document.write('<iframe src="http://bbs.hq.ctc.com/portallogin2.php?userid='+ readCookie('userid')+'&name='+readCookie('name')+'" width="0" height="0" scrolling="no" frameborder="0"></iframe>');
		}
		if(i=='stat'){
		 document.write('<iframe src="http://stat.hq.ctc.com:8080/setcookie.php?username='+getQry('userid')+'" width="0" height="0"></iframe>');
		}

}
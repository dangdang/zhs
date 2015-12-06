$(function() {
	// #json_mail189
	if ($("#json_mail189").length == 0) {
		return;
	}
	var mobile = $("#db_189").val();

	if (mobile != undefined && mobile.length == 11) {
		jslog(mobile);
		get189list(mobile);
	} else {
		reg189();
	}
});
function reg189() {
	var html = '<div id="no189">你还没有绑定189邮箱，<input type="button" onclick="javascript:bind1();" value="现在绑定"/>。</div>';
	html += '<div id="reg" style="display:none;">';
	html += '<input type="hidden" name="ac" value="validate" /> 	  请输入你要绑定的189邮箱手机号码:<br />    <input name="mobile" type="text" id="mobile" value="" size="11" maxlength="11" /> 	    <input type="button" name="sendSms" id="sendSms" onclick="send(this);" value="发送验证码" />     (只支持C网手机)';
	html += '<div id="smsStat"></div> <div id="receive" style="display:none;"> 接收到的短信验证码:<input name="v_code" type="text" id="v_code" size="6" maxlength="6" /><br /> 	  	    <input type="button" name="button" id="button" onclick="validate_mobile(this);" value="绑定189邮箱" /> 	</div>';
	html += '</div> <div id="success" style="display:none"> 您的189邮箱已经绑定成功！<b>正在载入...</b></a>。 </div>';
	$("#json_mail189").html(html);
}
function change189() {
	removeMask();
	var html = '<div id="change">你当前绑定的189邮箱手机号码为 ';
	html += $("#db_189").val();
	html += ' ,<br />点击下面的[确认更改]按纽,将删除你当前的邮箱绑定，删除后，你可以重新绑定一个手机号码。<br /><input type="button" value="确认更改" onclick="reg189();bind1();"/> <input type=button value="取消" onclick="change_cancel();" /></div>';
	$("#maillist189").hide();
	$("#json_mail189").append(html);
	$("#change").show();
}
function change_cancel() {
	$("#change").remove();
	$("#maillist189").show();
}
function get189list(mobile) {
	showLoading($("#json_mail189"));
	var rows = 6;
	jslog("start get 189 list");
	$
			.getJSON(
					"/cn189/maillist",
					{
						mobile : mobile
					},
					function(datass) {
						showLoading($("#json_mail189"));
						var html = "";
						if (datass.error == "NOTREG") {
							html = "手机号码已经改变，请重新登录！";
						} else if (datass.error == "GETLIST_ERROR") {
							html += "获取邮件列表发生错误,请稍候重试。";
						} else if (datass.error == "PARSE_ERROR") {
							html += "解析邮件列表发生错误，是否有非法格式邮件？";
						} else {
							html = '<table id="maillist189" class="itbl" width="100%" border="0" align="left" cellpadding="0" cellspacing="0">';
							for ( var x in datass) {
								var t = datass[x].title;
								if (x > 6 || t == null || t == 'undefined') {
									break;
								}
								html += "<tr><td class='dot'></td><td class='dotted' ><a target='_mail189' href='/cn189/sso?remoteurl="
										+ datass[x].url
										+ "'>"
										+ t
										+ "</a></td></tr>";
							}
							html += "</table>";
						}
						$("#json_mail189").html(html);
					});

}
function bind1() {
	$('#reg').show();
	$('#no189').hide();
	initmobile();
}
function validate_mobile(obj) {
	btnCheck(this);
	$("#smsStat").html("正在与服务器验证...");
	$.get("/cn189/bindMobile", {
		mobile : $('#mobile').val(),
		vcode : $('#v_code').val()
	}, function(data) {

		if (data == 'ERROR') {
			$("#smsStat").html("<font color=red>输入的短信验证码不正确，请重新输入</font>！");
		} else if (data == 'SUCCESS') {
			$("#smsStat").html('手机验证成功！');
			$("#receive").hide();
			$("#success").show();
			$("#db_189").val($('#mobile').val());
			if (getQry("remoteurl").length > 10) {
				window.location.reload();
			} else {
				get189list($('#mobile').val());
			}

		} else {
			$("#smsStat").html('发生意外错误：' + data);
		}
	});
}
function btnCheck(obj) {
	// alert(obj);
	$(obj).attr("disabled", "disabled");
	setTimeout(function() {
		$(obj).removeAttr("disabled");
	}, 5000);

}
function send(obj) {
	btnCheck(obj);
	$("#smsStat").html('正在发送验证短信，请稍候...');
	$.getJSON("/cn189/sendVcode", {
		mobile : $('#mobile').val()
	}, function(datass) {
		jslog(datass);
		$("#smsStat").html("验证短信" + datass[0].remark);
		$("#receive").show();
	});
}
function initmobile() {
	// $.getJSON("http://stat.hq.ctc.com:8080/portal/sprymenu.php?jsoncallback=?",function(datass){
	$.getJSON(
					"http://oa.hq.ctc.com/chtweboa/public/checkservertime.nsf/agtGetMobileEmail?openagent&jsoncallback=?",
					{
						userid : $("#userid").val()
					}, function(datass) {
						$("#mobile").val(datass.Mobile);

					});
}

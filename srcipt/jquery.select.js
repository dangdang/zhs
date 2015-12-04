/*
文件名:jquery.liu.select.js
功能说明:本js文件为jquery类库的一个插件,主要实现对select的操作.
作者:John Liu
编写日期:2008/03/12
*/
//得到select项的个数
jQuery.fn.size = function(){
    return jQuery(this).get(0).options.length;
}

//获得选中项的索引
jQuery.fn.getSelectedIndex = function(){
	var list=new Array();
	$.each(this.children(),function(k,v){
		//jslog(k+"=="+v+"--"+v.selected);
		if(v.selected){
			list.push(v.value);
		}
	});
	return list;
}
//获得全部项的索引
jQuery.fn.getAllIndex = function(){
	var list=new Array();
	$.each(this.children(),function(k,v){
			list.push(v.value);
	});
	return list;
}
//获得当前选中项的文本
jQuery.fn.getSelectedText = function(){
    if(this.size() == 0)  return "下拉框中无选项";
    else{
        var index = this.getSelectedIndex();      
        return jQuery(this).get(0).options[index].text;
    }
}

//获得当前选中项的值
jQuery.fn.getSelectedValue = function(){
    if(this.size() == 0) 
        return "下拉框中无选中值";
    
    else
        return jQuery(this).val();
}

//设置select中值为value的项为选中
jQuery.fn.setSelectedValue = function(value){
    jQuery(this).get(0).value = value;
}

//设置select中文本为text的被选中
jQuery.fn.setSelectedText = function(text,chked)
{
    var count = this.size();
    var textArray=text.split(";");
    var notExist=textArray;
    var s=jQuery(this).get(0);
    var tmp_option=null;
    var tt="";
    for(var i=0;i<count;i++)
    {
    	tmp=s.options[i];
    	tt=tmp.text;
        if(-1!=jQuery.inArray(tt,textArray))
        {
        	if(chked){
        		tmp.selected = true;	
        	}else{
        		tmp.selected = false;
        	}
        	
        	for(var i in notExist){
        		if(notExist[i]==tt) notExist.splice(i,1);
        	}
        }
    }
    if(notExist.length>0)
    {
        alert("下拉框中不存在以下项\r\n"+notExist);
    }
}
//设置选中指定索引项
jQuery.fn.setSelectedIndex = function(index)
{
    var count = this.size();    
    if(index >= count || index < 0)
    {
        alert("选中项索引超出范围");
    }
    else
    {
        jQuery(this).get(0).selectedIndex = index;
    }
}
//判断select项中是否存在值为value的项
jQuery.fn.isExistItem = function(value)
{
    var isExist = false;
    var count = this.size();
    for(var i=0;i<count;i++)
    {
        if(jQuery(this).get(0).options[i].value == value)
        {
            isExist = true;
            break;
        }
    }
    return isExist;
}
//向select中添加一项，显示内容为text，值为value,如果该项值已存在，则提示
jQuery.fn.addOption = function(text,value)
{
    if(this.isExistItem(value))
    {
        alert("待添加项的值"+value+"已存在");
    }
    else
    {
        jQuery(this).get(0).options.add(new Option(text,value));
    }
}
//删除select中值为value的项，如果该项不存在，则提示
jQuery.fn.removeItem = function(value)
{    
    if(this.isExistItem(value))
    {
        var count = this.size();        
        for(var i=0;i<count;i++)
        {
            if(jQuery(this).get(0).options[i].value == value)
            {
                jQuery(this).get(0).remove(i);
                break;
            }
        }        
    }
    else
    {
        alert("待删除的项不存在!");
    }
}
//删除select中指定索引的项
jQuery.fn.removeIndex = function(index)
{
    var count = this.size();
    if(index >= count || index < 0)
    {
        alert("待删除项索引超出范围");
    }
    else
    {
        jQuery(this).get(0).remove(index);
    }
}
//将选中项移到其它select列表中
jQuery.fn.moveTo = function(obj)
{
	//jslog(this.attr("id"));
	$.each(this.children(),function(k,v){
		//jslog(k+"=="+v+"--"+v.selected);
		if(v.selected){
			//list.push(v.value+"|"+v.text);
			obj.addOption(v.text,v.value);
			$(this).remove();
		}
	});
}
//删除select中选定的项
jQuery.fn.removeSelected = function()
{
    var index = this.getSelectedIndex();
    this.removeIndex(index);
}
//清除select中的所有项
jQuery.fn.clearAll = function()
{
    jQuery(this).get(0).options.length = 0;
}

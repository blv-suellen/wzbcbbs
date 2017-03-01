<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
(function($){
function getParent(obj,cnt){
for(var i=0;i<cnt;i++){
obj = obj.parent();
}
return obj;
}

$.fn.TDragDrop = function(set){
var defaults = {
parent:0, // 拖动对象，向上n父节点，parent为0时，拖动本身
opacity:0.3 // 拖动时节点透明度，默认为0.3
};
var setting = $.extend(defaults, set);

this.each(function(){
var ele = getParent($(this),setting.parent);
ele.css('position','absolute')
.css('top',ele.offset().top)
.css('left',ele.offset().left);
$(this).bind('mousedown',function(event){
event = event || window.event;
var self = getParent($(this),setting.parent);
self.attr('flag',true)
.attr('oldZIndex',self.css('z-index'))
.attr('startX',event.clientX - self.offset().left)
.attr('startY',event.clientY - self.offset().top);

self.css('cursor','move')
.css('z-index',99999)
.css('opacity',setting.opacity);
document.onselectstart=function(){return false};
}).bind('mouseup mouseout',function(){
var self = getParent($(this),setting.parent);
self.css('cursor','auto')
.css('z-index',self.attr('oldZIndex'))
.css('opacity','1');
self.attr('flag',false);
document.onselectstart=function(){return true};
}).bind('mousemove',function(event){
event = event || window.event;
var self = getParent($(this),setting.parent);
if(self.attr('flag') === 'true'){
self.offset({'left':event.clientX - self.attr('startX'),
'top':event.clientY - self.attr('startY')});
if(self.offset().left < 0){
self.offset({'left':0});
}else if(self.offset().left > $(window).width() - self.width() - 2){
self.offset({'left':$(window).width() - self.width() - 2});
}
if(self.offset().top < 0){
self.offset({'top':0});
}else if(self.offset().top > $(window).height() - self.height() - 2){
self.offset({'top':$(window).height() - self.height() - 2});
}

}
});

});
}
})(jQuery);

$(function(){
// 调用
var obj = $("#reply");
obj.TDragDrop({'parent':1});

$('.close,.cancel').click(function(){
$(this).parent().fadeOut('normal');
})

openDialog('reply');
});

function openDialog(id){
// 居中
var box = $("#"+id).parent();
box.fadeIn('normal');
box.offset({'top':($(window).height()-box.height())/2,
'left':($(window).width()-box.width())/2});
$("textarea").val('');
}

</script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RunJS</title>
<style>

*{
padding:0;
margin:0;
font-size:11pt;
font-family:Verdana,sans-serif,'宋体';
}
div{
border:1px solid #eee;
background-color:#fff;
width:410px;
border-radius:4px;
padding:8px;
padding-bottom:20px;
-webkit-box-shadow:0px 0px 15px 3px #515151;
-moz-box-shadow:0px 0px 15px 3px #515151;
}
textarea{
width:100%;
height:80px;
margin-bottom:20px;
background：none repeat scroll 0 0 #FFFFDD;
background-color:#FFFFDD;
border:1px solid #ccc;
resize:none;
}
button{
padding:2px;
font-size:10pt
}
a{
font-size:9pt;
color:#4466BB;
}
#reply{
background-color:#40AA53;
display:block;
font-size:13px;
height:18px;
line-height:18px;
padding:5px 15px;
color:#fff;
font-weight:bold;
}
.tip{
display:block;
margin-top:10px;
margin-bottom:5px;
font-size:10pt;
}
.close{
background:url("http://www.oschina.net/js/2011/fancybox/fancybox.png") repeat scroll -40px 0 transparent;
display:block;
width:30px;
height:30px;
position:absolute;
top:-17px;
right:-17px;
z-index:9999999;
}
</style>
<script id="jquery_172" type="text/javascript" class="library" src="css/jquery-1.7.2.min.js"></script>
</head>
<body>
<a style='font-size:15pt;' href='javascript:void(0)' onclick='openDialog("reply");'>评论</a>
<div style="display: none">
<span class="close"></span>
<span id="reply" >评论"某某"的答案</span>
<span class="tip">请输入内容：</span>
<textarea></textarea>
<button>发表评论</button>
<a href="javascript:void(0)" class='cancel'>取消</a>
</div>
</body>
</html>
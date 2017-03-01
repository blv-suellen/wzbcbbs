<%@ page language="java"
	import="java.util.*,com.wzbcbbs.servlet.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<link rel="stylesheet" href="css/bdwm.min.css">
<link rel="stylesheet" href="css/all.css">

<head>
<base href="<%=basePath%>">

<title>在温言商-商学院自己的BBS</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body id="page-login">

	<div class="main-container">
		<div class="loading" style="display:none;">
			<img src="images/welcome/loading.gif">
		</div>
		<a data-no-pjax><img id="bgimg" src="images/welcome/index.jpg"
			style="width: 1200px;"></a>
		<div class="panel">
			<form class="form" action="UserloginServlet?method=1" method="post">
				<input type="text" name="username" data-role="username"
					placeholder="用户名 / username"> <input type="password"
					name="password" data-role="password" placeholder="密码 / password">



				<!--<input type="checkbox" name="keepalive" data-role="keepalive" id="form-remember-checkbox">
          <label for="form-remember-checkbox">下次自动登录</label> -->
				<input value="登录" style="font-size:13px; " type="submit"
					class="button red" name="login"></a> <a class="button"
					href="register.jsp" data-no-pjax target="_blank">注册</a> <span
					class="separator"></span> <a class="small-link" href="content.jsp"
					data-no-pjax>游客</a> <a class="small-link" href="admin.jsp"
					data-no-pjax>管理员登陆</a>
			</form>
		</div>
		<div class="footer">
			<p>
				<a data-no-pjax href="http://www.wzbc.edu.cn/" target="_blank">商学院官网</a>
				<a data-no-pjax href="http://moodle.wzbc.edu.cn:7007/"
					target="_blank">Moodle平台</a> <a data-no-pjax
					href="http://jw1.wucc.cn" target="_blank">商学院教务体统</a> <a
					data-no-pjax
					href="http://tieba.baidu.com/f?kw=%E6%B8%A9%E5%B7%9E%E5%95%86%E5%AD%A6%E9%99%A2&fr=index&fp=0&ie=utf-8"
					target="_blank">官方贴吧</a>
				<!--  <a data-no-pjax>官方微信<span class="login-wechat-qrcode"></span></a> -->
			</p>
			<p>© 2016-2999 在温言商BBS</p>
		</div>
	</div>

	<script type="text/javascript">
		var bgimg = document.getElementById('bgimg');
		var setMiddle = function() {
			var huge = document.getElementsByClassName('huge');
			if (huge.length) {
				var windoww = Math.max(document.body.clientWidth, document.documentElement.clientWidth),
					windowh = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
				if (windowh / windoww <= 9 / 16) {
					bgimg.style.width = '100%';
					bgimg.style.height = '';
				} else {
					bgimg.style.height = '100%';
					bgimg.style.width = '';
				}
			}
		};
		setMiddle();
		window.onresize = setMiddle;
		$(function() {
			var img = $('#bgimg');
			if (img.eq(0).get(0).readyState == 'complete' || img.eq(0).get(0).complete) {
				img.css({
					visibility : '',
					display : 'none'
				});
				img.fadeIn('normal', function() {
					$('.loading').hide();
				});
			}
			else
				img.load(function() {
					img.css({
						visibility : '',
						display : 'none'
					});
					img.fadeIn('normal', function() {
						$('.loading').hide();
					});
					setMiddle();
				});
		});
	</script>

</body>
</html>

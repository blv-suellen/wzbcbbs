<%@ page language="java"
	import="java.util.*,com.wzbcbbs.db.*,java.sql.*,com.wzbcbbs.servlet.*"
	pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("isLogin") == null) {
		out.write("<script>alert(\"请先登陆后查看！\");window.location.href=\"index.jsp\";</script>");
		return;
	}

	String userId = request.getParameter("userid");
	if (userId == null || userId.trim().equals("")) {
		out.println("Error ID!");
		return;
	}

	List<User> userinfolist = new ArrayList<User>();
	Connection conn = DataBase.getConn();
	Statement stmt = DataBase.createStmt(conn);
	String sql = "select * from user where user_id = " + userId;
	System.out.println(sql);
	ResultSet rsu = DataBase.executeQuery(stmt, sql);
	while (rsu.next()) {
		User u = new User();
		u.initUser(rsu);
		userinfolist.add(u);
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<script type="text/javascript">

</script>

<title>我-在温言商-商学院自己的BBS</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<link type="image/png" rel="shortcut icon"
	href="assets/images/favicon.png">
<!-- <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
<link type="text/css" rel="stylesheet"
	href="assets/plugins/awesome/css/font-awesome.min.css" />
<!--Import styles-->
<link type="text/css" rel="stylesheet"
	href="assets/plugins/materialize/css/materialize.min.css" />
<link type="text/css" rel="stylesheet"
	href="assets/plugins/prism/prism.css" />
<link type="text/css" rel="stylesheet" href="assets/css/screen.css" />

<body>

	<!-- 头部导航区 -->
	<header class="navbar-fixed"> <nav id="headNav"
		class="bf-color none-shadow">
	<div id="navContainer" class="container">
		<div class="nav-wrapper hide-on-med-and-down">
			<div class="brand-logo">
				<a href="index.jsp" class="waves-effect waves-light"> <img
					src="assets/images/logo.png" class="logo-img hide-on-small-only">
					<span class="logo-span">在温言商</span>
				</a>
			</div>
			<a href="#" data-activates="mobile-nav" class="button-collapse"><i
				class="fa fa-navicon"></i></a>
			<ul class="right">
				<li class="hide-on-med-and-down"><a href="content.jsp"
					class="waves-effect waves-light">首页</a></li>
			</ul>
			<div class="side-nav" id="mobile-nav">
				<ul class="menu-list">
					<li><a href="index.jsp" class="waves-effect waves-light">
							<i class="fa fa-home fa-lg fa-fw"></i>首 页
					</a></li>
				</ul>
				<div class="social-link">
					<a href="https://github.com/blinkfox" class="tooltipped"
						target="_blank" data-tooltip="访问我的GitHub" data-position="top"
						data-delay="50"> <i class="fa fa-github fa-lg"></i>
					</a> <a href="mailto:chenjiayin1990@163.com" class="tooltipped"
						target="_blank" data-tooltip="邮件联系我" data-position="top"
						data-delay="50"> <i class="fa fa-envelope fa-lg"></i>
					</a> <a href="#!" class="tooltipped" data-tooltip="QQ号：1181062873"
						data-position="top" data-delay="50"> <i class="fa fa-qq fa-lg"></i>
					</a> <a href="#!" class="tooltipped" data-tooltip="RSS" target="_blank"
						data-position="top" data-delay="50"> <i
						class="fa fa-rss fa-lg"></i>
					</a>
				</div>
			</div>
		</div>

	</div>
	</nav> </header>


	<!-- 主要内容 -->
	<main class="content"> <!-- 头部融合背景标题 -->
	<div class="content-heading bf-color">
		<center>
			<div class="container">
				<div class="row">
					<div class="col s12 m12 l12">
						<h2 class="heading">我</h2>
					</div>
				</div>
			</div>
	</div>
	</center>

	<!-- 文章内容详情 -->
	<div id="artDetail" class="container ">
		<div class="card">
			<div class="article-card-content">

				<%
					User user = userinfolist.get(0);
					session.setAttribute("changePic_userId", user.getUser_id());
				%>
				<!-- 上传图片 -->
				<form
					action="UserloginServlet?method=9&userid=<%=user.getUser_id()%>"
					method="post" enctype="multipart/form-data">
					<div class="headimagediv" id="headimagediv">
						<div class="change">
							<img class="headimage" src="<%=user.getUserpicture_url()%>">
							<div class="rsp"></div>
						</div>
					</div>
					<div id="upheadimg"
						style="display: none;margin:0 auto;margin-top: 20px;">
						<input type="file" class="label" name="upfile" size="50"
							style="margin-left: 550px;">
						<div style="width:300px; margin:auto;">
							<button type="submit" class="btn btn-primary"
								style="width:300px;margin-top: 10px;">确认选择</button>
						</div>
					</div>
				</form>



				<div class="row1">
					<span class="label">用户名&nbsp;&nbsp;&nbsp;&nbsp;</span> <span
						class="user-info" style="color:#000000"><%=user.getUser_name()%></span>
					<!-- <span class="warning-info" style="color:#9e9e9e">*请填写仅包含英文字母的用户名</span> -->
				</div>

				<div class="row1">

					<span class="label">个性签名</span> <span class="user-info"
						style="color:#000000;"><%=user.getSlogan()%></span> <input
						type="button" style="margin-left: 80px;" id="cslogan" value="更改">
				</div>
				<div class="row1" id="newslogan" style="display: none">
					<form action="DomeServlet?method=2&userid=<%=user.getUser_id()%>"
						method="post">
						<span class="label">输入新签名</span> <input class="medium"
							name="changeslogan"> <input type="submit" value="确认">
						</form>
				</div>



				<div class="row1">
					<span class="label">更改密码</span> <input type="button"
						style="margin-left: 80px;" id="show" value="点击更改密码">
				</div>
				<div id="changepw" style="display: none">
					<form action="DomeServlet?method=1&userid=<%=user.getUser_id()%>"
						method="post">
						<div class="row1">
							<span class="label">输入初始密码</span> <input type="password"
								class="medium" name="password" data-role="password"
								placeholder="不少于6位">
						</div>
						<div class="row1">
							<span class="label">输入新密码</span> <input type="password"
								class="medium" name="newpassword" data-role="password"
								placeholder="不少于6位">
						</div>
						<div class="row1">
							<span class="label">重复新密码</span> <input type="password"
								class="medium" name="newpassword_repeat"
								data-role="password_repeat">
						</div>
						<input type="submit" style="margin-left: 500px;" value="确认">
					</form>
				</div>

				<div class="row1">
					<span class="label">院系年级</span> <span class="user-info"
						style="color:#000000"><%=user.getUser_faculty()%></span>
				</div>

				<div class="row1">
					<span class="label">电子邮箱</span> <span class="user-info"
						style="color:#000000"><%=user.getUser_email()%></span>
				</div>
				<div class="row1">
					<span class="label">性别&nbsp;&nbsp;</span> <span
						class="user-infosex" style="color:#000000;margin-left: 100px;">&nbsp;&nbsp;<%=user.getSex()%></span>

				</div>
				<div class="row1">
					<br>

				</div>




			</div>

			<hr />
			<br />
		</div>
	</div>
	</main>

	<%
		DataBase.close(rsu);
		DataBase.close(stmt);
		DataBase.close(conn);
	%>


	<footer class="page-footer bf-color">
	<div class="container row center-align">
		<div class="col s12 m12 l8 copy-right">
			本站由&copy;<a target="_blank">VEBLEN</a>基于 <a target="_blank">JSP</a>
			搭建.
		</div>
		<div class="col s12 m12 l4 social-link hide-on-med-and-down">
			<a href="https://github.com/blv-suellen" class="tooltipped"
				target="_blank" data-tooltip="访问我的GitHub" data-position="top"
				data-delay="50"> <i class="fa fa-github fa-lg"></i>
			</a> <a href="mailto:400823823@qq.com" class="tooltipped" target="_blank"
				data-tooltip="邮件联系我" data-position="top" data-delay="50"> <i
				class="fa fa-envelope fa-lg"></i>
			</a> <a href="#!" class="tooltipped" data-tooltip="QQ号：400823823"
				data-position="top" data-delay="50"> <i class="fa fa-qq fa-lg"></i>
			</a> <a href="http://www.wzbc.edu.cn/" class="tooltipped"
				data-tooltip="温州商学院" target="_blank" data-position="top"
				data-delay="50"> <i class="fa fa-rss fa-lg"></i>
			</a>
		</div>
	</div>
	</footer>

	<!-- 搜索遮罩框 -->
	<div id="search-mask" style="display: none;">
		<form class="search-form" action="#!" autocomplete="off">
			<a href="#!" onclick="return false;" class="search-close"> <i
				class="mdi-navigation-close"></i>
			</a>
			<div class="container row search-container">
				<div class="col offset-s1 s10 offset-m3 m8 offset-l4 l8">
					<div class="search-label center-align">
						<label for="s">输入关键字后‘回车’即可</label>
					</div>
					<div>
						<input type="search" id="searchKey" name="s" class="search-input"
							autofocus="">
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- 主题颜色设置 -->
	<div id="theme-change" left="-200" class="hide-on-med-and-down">
		<div class="theme-change-handle">
			<i class="fa fa-gear fa-lg fa-spin bf-text-color"></i>
		</div>
		<div class="theme-change-container">
			<h6>主题颜色面板</h6>
			<div id="theme-panel">
				<ul>
					<li class="bf-blue" data-colors="blue"></li>
					<li class="bf-pink" data-colors="pink"></li>
					<li class="bf-orange" data-colors="orange"></li>
					<li class="bf-green" data-colors="green"></li>
					<li class="bf-red" data-colors="red"></li>
					<li class="bf-purple" data-colors="purple"></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 移动端分享模态框 -->
	<div id="shareModal" class="modal bottom-sheet">
		<div class="modal-content">
			<h4>分 享</h4>
			<!-- JiaThis Button BEGIN -->
			<div class="jiathis_style_m"></div>
			<script type="text/javascript"
				src="http://v3.jiathis.com/code/jiathis_m.js" charset="utf-8"></script>
			<!-- JiaThis Button END -->
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">关
				闭</a>
		</div>
	</div>

	<!-- 回到顶部按钮 -->
	<div id="backTop" class="top-scroll">
		<a
			class="btn-floating btn-large waves-effect waves-light red accent-3"
			href="#!"> <i class="fa fa-angle-double-up"></i>
		</a>
	</div>

	<!--Import jQuery before materialize.js-->
	<!--<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.2.0/jquery.js"></script> -->
	<script>
		window.jQuery || document.write('<script src="assets/plugins/jquery/jquery-2.2.0.min.js"><\/script>')
	</script>
	<script type="text/javascript"
		src="assets/plugins/materialize/js/materialize.js"></script>
	<script type="text/javascript"
		src="assets/plugins/masonry/masonry.pkgd.js"></script>
	<!-- <script type="text/javascript" src="http://cdn.bootcss.com/masonry/4.0.0/masonry.pkgd.min.js"></script> -->
	<script type="text/javascript" src="assets/plugins/prism/prism.js"></script>
	<script type="text/javascript" src="assets/js/index.js"></script>

	<script src="assets/js/jquery.min.js"></script>
	<script>
		$(function() {
			$(".change .rsp").hide();
			$(".change ").hover(function() {
				$(this).find(".rsp").stop().fadeTo(100, 0.5)
				$(this).find(".changeimgtext").stop().animate({
					left : '0'
				}, {
					duration : 100
				})
			},
				function() {
					$(this).find(".rsp").stop().fadeTo(100, 0)
					$(this).find(".changeimgtext").stop().animate({
						left : '100'
					}, {
						duration : "fast"
					})
					$(this).find(".changeimgtext").animate({
						left : '-100'
					}, {
						duration : 0
					})
				});
		});
	</script>
	<script type="text/javascript">
		document.getElementById("show").onclick = function() {
			document.getElementById("changepw").style.display = "block";
		}
	</script>
	<script type="text/javascript">
		document.getElementById("cslogan").onclick = function() {
			document.getElementById("newslogan").style.display = "block";
		}
	</script>
	<script type="text/javascript">
		document.getElementById("headimagediv").onclick = function() {
			document.getElementById("upheadimg").style.display = "block";
		}
	</script>
</body>

</html>

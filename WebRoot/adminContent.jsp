<%@page import="com.wzbcbbs.Dao.PlateDao"%>
<%@ page language="java" import="java.util.*,com.wzbcbbs.db.*,java.sql.*" pageEncoding="UTF-8"%>
<%-- <%
		
	List<Plate> plates = new ArrayList<Plate>();
	Connection conn = DataBase.getConn();

	Statement stmt = DataBase.createStmt(conn);
	
	String sql = "select * from plate " ;
	ResultSet rplate = DataBase.executeQuery(stmt, sql);
	while(rplate.next()) {
		Plate p = new Plate();
		p.setPlate(rplate);
		plates.add(p);
	}

	
	DataBase.close(rplate);
	DataBase.close(stmt);
	DataBase.close(conn);
%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>在温言商-商学院自己的BBS</title>
    <meta name="description" content="html5 materialize template">
    <meta name="keywords" content="html5, materialize, material, material design">
    <meta name="HandheldFriendly" content="True" />
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link type="image/png" rel="shortcut icon" href="assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
    <link type="text/css" rel="stylesheet" href="assets/plugins/awesome/css/font-awesome.min.css" />
    <!--Import styles-->
    <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css" />
    <link type="text/css" rel="stylesheet" href="assets/plugins/prism/prism.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/screen.css" />
    
	<jsp:useBean id="userDao" class="com.wzbcbbs.Dao.UserDao" scope="page"></jsp:useBean>
	<jsp:useBean id="plateDao" class="com.wzbcbbs.Dao.PlateDao" scope="page"></jsp:useBean>
</head>

<body>

    <!-- 头部导航区 -->
    <header class="navbar-fixed">
        <nav id="headNav" class="bf-color none-shadow">
            <div id="navContainer" class="container">
                <div class="nav-wrapper">
                    <div class="brand-logo">
                        <a href="#!" class="waves-effect waves-light">
                            <!-- <img src="assets/images/logo.png" class="logo-img hide-on-small-only"> -->
                            <img src="assets/images/logo.png" class="logo-img hide-on-small-only">
                            <span class="logo-span">在温言商</span>
                        </a>
                    </div>

                    <ul class="right">
                 
                       <%--  <li class="hide-on-med-and-down">
                            <a href="me.jsp?userid=${id} " class="waves-effect waves-light">我</a>
                        </li> --%>
                       
                        <li class="hide-on-med-and-down">
                            <a href="content.jsp" class="waves-effect waves-light">在温言商首页</a>
                        </li>
                         <%
                    	if(session.getAttribute("isLogin") != null){
                         %>
                    	<li class="hide-on-med-and-down">
                            	欢迎,&nbsp<span><%=session.getAttribute("admin_name") %></span>
                        </li>
                        <li class="hide-on-med-and-down">
                            <a href="UserloginServlet?method=4" class="waves-effect waves-light">注销</a>
                        </li>
                       <%
                       }else{ %>
                        <li class="hide-on-med-and-down">
                            <a href="index.jsp" class="waves-effect waves-light">登录</a>
                        </li>
                        <%
                        } %>
                        <li>
                            <a href="#!" id="toggle-search" class="waves-effect waves-light">
                                <i id="searchIcon" class="mdi-action-search"></i>
                            </a>
                        </li>
                    </ul>
                    <div class="side-nav" id="mobile-nav">
                        <div class="mobile-head bf-color">
                            <img src="assets/images/head_pic.jpg" class="logo-img circle responsive-img">
                            <div class="logo-name">Blinkfox</div>
                            <div class="logo-desc">从来没有真正的绝境，只有心灵的迷途</div>
                        </div>
                        <ul class="menu-list">
                            <li>
                                <a href="blog.html" class="waves-effect waves-light">
                                    <i class="fa fa-home fa-lg fa-fw"></i>首 页
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="waves-effect waves-light">
                                    <i class="fa fa-book fa-lg fa-fw"></i>关 于
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="waves-effect waves-light">
                                    <i class="fa fa-comment fa-lg fa-fw"></i>联系我们
                                </a>
                            </li>
                            <hr>
                            <li>
                                <a id="themeHandle" class="waves-effect waves-light">
                                    <i class="fa fa-gear fa-lg fa-fw"></i>主题设置
                                </a>
                            </li>
                        </ul>
                        <div class="social-link">
                            <a href="https://github.com/blinkfox" class="tooltipped" target="_blank" data-tooltip="访问我的GitHub" data-position="top" data-delay="50">
                                <i class="fa fa-github fa-lg"></i>
                            </a>
                            <a href="mailto:chenjiayin1990@163.com" class="tooltipped" target="_blank" data-tooltip="邮件联系我" data-position="top" data-delay="50">
                                <i class="fa fa-envelope fa-lg"></i>
                            </a>
                            <a href="#!" class="tooltipped" data-tooltip="QQ号：1181062873" data-position="top" data-delay="50">
                                <i class="fa fa-qq fa-lg"></i>
                            </a>
                            <a href="#!" class="tooltipped" data-tooltip="RSS" target="_blank" data-position="top" data-delay="50">
                                <i class="fa fa-rss fa-lg"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <!-- 主要内容 -->
    <main class="content">
        <!-- 头部融合背景标题 -->
        <div class="content-heading bf-color">
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <h1 class="heading">温州商学院BBS</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- 头部提醒文字 -->
        <div class="container notice">
            <div class="card">
                <div class="card-content">
                    <i class="fa fa-volume-up fa-lg fa-fw bf-text-color"></i> 梦想面前做好自信的自己，自信可以改变未来。
                    每一朵花都有开放的理由，你要始终坚信， 你就是你，一个独一无二的你，任何人都无法替代，不要因为别人的否定就轻易放弃，
                    活在别人的世界里是一种悲哀，你要活出自己的本色。只要心在，梦就在，成功之前总是会遭受很多的磨砺， 但是只要坚持做好手边的事，
                    自然会有意外不到的收获。
                </div>
            </div>
        </div>

        <!-- 精选文章的slider效果 -->
        <div class="container feature-slider">
            <div class="card">
                <div class="slider">
                    <ul class="slides">
                        <li>
                            <img src="assets/images/banner_one.jpg" alt="默认图片1">
                            <div class="caption center-align" >
                                <h3 style="color: blue;">在温言商BBS正式上线!</h3>
                            </div>
                        </li>
                        <li>
                            <img src="assets/images/banner_two.jpg" alt="默认图片2">
                            <div class="caption left-align">
                                <h3>更多惊喜</h3>
                            </div>
                        </li>
                        <li>
                            <img src="assets/images/banner_three.jpg" alt="默认图片3">
                            <div class="caption right-align">
                                <h3>更多温暖</h3>
                            </div>
                        </li>
                        <li>
                            <img src="assets/images/banner_four.jpg" alt="默认图片4">
                            <div class="caption right-align">
                                <h3>为你而来</h3>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

	<div id="artDetail" class="container ">
            <div class="card">
                <div class="article-card-content">
                <div class="admin-user">
		 <fieldset> 
		<legend style="color:red">以下是用户查询结果，如果需要查询某条数据，请点击右上角搜索</legend> 
        <table style="width:600px;margin:auto;">
        
        	<tr>
        		<td>姓名</td>
        		<td>性别</td>
        		<td>邮箱</td>
        		<td>学院</td>
        		<td>发帖数</td>
        		<td>操作</td>
        	</tr>
        <%
        	List<User> list = new ArrayList<User>();
        	list = userDao.selectUserList();
        	int num = list.size();
        	for(int i = 0; i < num; i++){
        	
        %>
        	<tr>
        		<td><%=list.get(i).getUser_name() %></td>
        		<td><%=list.get(i).getSex() %></td>
        		<td><%=list.get(i).getUser_email() %></td>
        		<td><%=list.get(i).getUser_faculty() %></td>
        		<td><%=list.get(i).getUser_posts() %></td>
        		<td><a href="changeUser.jsp?userid=<%=list.get(i).getUser_id() %>">修改</a>&nbsp;<a href="UserloginServlet?method=3&userid=<%=list.get(i).getUser_id() %>">删除</a></td>
        	</tr>
        <%
        	}
        %>
        </table>
        </fieldset>
        </div>
        
        <div class="admin_plate">
        
         <fieldset> 
		<legend style="color:red">以下是板块查询结果</legend> 
        <table style="width:1200px;margin:auto;">
        
        	<tr>
        		<td>板块名id</td>
        		<td>板块名</td>
        		<td>关键词1</td>
        		<td>关键词1</td>
        		<td>关键词2</td>
        		<td>板块图片</td>
        		<td>简介</td>
        		<td>操作</td>
        	</tr>
        <%
        	List<Plate> listp = new ArrayList<Plate>();
        	listp = plateDao.selectPlateList();
        	int num2 = listp.size();
        	for(int i = 0; i < num2; i++){
        	
        %>
        	<tr>
        		<td><%=listp.get(i).getPlate_id() %></td>
        		<td><%=listp.get(i).getPlate_name() %></td>
        		<td><%=listp.get(i).getMotto_one() %></td>
        		<td><%=listp.get(i).getMotto_two() %></td>
        		<td><%=listp.get(i).getMotto_three() %></td>
        		<td><img style="width: 50px;" src="<%=listp.get(i).getPlate_picture() %>"></td>
        		<td><%=listp.get(i).getPlate_cont() %></td>
        		<td><a href="changePlate.jsp?plateid=<%=listp.get(i).getPlate_id() %>">修改</a>&nbsp;<a href="UserloginServlet?method=6&plateid=<%=listp.get(i).getPlate_id() %>">删除</a></td>
        	</tr>
        <%
        	}
        %>
        </table>
        <input type="button" style="margin-left: 80px;" id="add" value="添加新版块" class="btn btn-primary">
         <div class="row1" id="newplate" style="display: none">
         需要先添加相关内容后才能添加图片，平添这种烦恼实在是抱歉了。
         
				       <!-- add列表 -->
				       
		<form class="form" action = "UserloginServlet?method=10" method = "post" >
        <table style="width:1000px;">
        
        	<tr>
        		<!-- <td>板块名id</td> -->
        		<td>板块名</td>
        		<td>关键词1</td>
        		<td>关键词2</td>
        		<td>关键词3</td>
        		<td>简介</td>
        	</tr>
        	
        	<tr>
        		<!-- <td><input type="text" name="plate_id" ></td> -->
        		<td><input type="text" name="plate_name" ></td>
        		<td><input type="text" name="motto_one" ></td>
        		<td><input type="text" name="motto_two" ></td>
        		<td><input type="text" name="motto_three"></td>
        		<td><input type="text" name="plate_cont"></td>
        		<td><button type="submit" class="btn btn-primary">保存</button></td>
        	</tr>
        </table>
    </form>
    
				       <!-- end -->
				  </div>
        </fieldset>
        </div>
        
        
        
        </div>
        </div>
        </div>
        
		
    <!-- 尾部内容 -->
     <footer class="page-footer bf-color">
        <div class="container row center-align">
            <div class="col s12 m12 l8 copy-right">
                本站由&copy;<a  target="_blank">VEBLEN</a>基于
                <a target="_blank">JSP</a> 搭建. 
            </div>
            <div class="col s12 m12 l4 social-link hide-on-med-and-down">
                <a href="https://github.com/blv-suellen" class="tooltipped" target="_blank" data-tooltip="访问我的GitHub" data-position="top" data-delay="50">
                    <i class="fa fa-github fa-lg"></i>
                </a>
                <a href="mailto:400823823@qq.com" class="tooltipped" target="_blank" data-tooltip="邮件联系我" data-position="top" data-delay="50">
                    <i class="fa fa-envelope fa-lg"></i>
                </a>
                <a href="#!" class="tooltipped" data-tooltip="QQ号：400823823" data-position="top" data-delay="50">
                    <i class="fa fa-qq fa-lg"></i>
                </a>
                <a href="http://www.wzbc.edu.cn/" class="tooltipped" data-tooltip="温州商学院" target="_blank" data-position="top" data-delay="50">
                    <i class="fa fa-rss fa-lg"></i>
                </a>
            </div>
        </div>
    </footer>

    <!-- 搜索遮罩框 -->
    <div id="search-mask" style="display: none;">
        <form class="search-form" action="search.jsp" method="get" autocomplete="off">
            <a href="#!" onclick="return false;" class="search-close">
                <i class="mdi-navigation-close"></i>
            </a>
            <div class="container row search-container">
                <div class="col offset-s1 s10 offset-m3 m8 offset-l4 l8">
                    <div class="search-label center-align">
                        <label for="searchKey">输入关键字后‘回车’即可</label>
                    </div>
                    <div>
                        <input type="search" id="searchKey" name="searchkey" class="search-input" autofocus="">
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

    <!-- 又一个移动端的主题设置 -->
    <div id="themeModal" class="modal bottom-sheet hide-on-large-only">
        <div class="modal-content">
            <h4>设置主题</h4>
            <div class="container row theme-settings">
                <div class="col bf-blue waves-effect waves-light" data-colors="blue"></div>
                <div class="col bf-pink waves-effect waves-light" data-colors="pink"></div>
                <div class="col bf-orange waves-effect waves-light" data-colors="orange"></div>
                <div class="col bf-green waves-effect waves-light" data-colors="green"></div>
                <div class="col bf-red waves-effect waves-light" data-colors="red"></div>
                <div class="col bf-purple waves-effect waves-light" data-colors="purple"></div>
            </div>
        </div>
    </div>

    <!-- 回到顶部按钮 -->
    <div id="backTop" class="top-scroll">
        <a class="btn-floating btn-large waves-effect waves-light red accent-3" href="#!">
            <i class="fa fa-angle-double-up"></i>
        </a>
    </div>

    <!--Import jQuery before materialize.js-->
    <!--<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.2.0/jquery.js"></script> -->
    <script>
        window.jQuery || document.write('<script src="assets/plugins/jquery/jquery-2.2.0.min.js"><\/script>')
    </script>
    <script type="text/javascript" src="assets/plugins/materialize/js/materialize.js"></script>
    <script type="text/javascript" src="assets/plugins/masonry/masonry.pkgd.js"></script>
    <!-- <script type="text/javascript" src="http://cdn.bootcss.com/masonry/4.0.0/masonry.pkgd.min.js"></script> -->
    <script type="text/javascript" src="assets/plugins/prism/prism.js"></script>
    <script type="text/javascript" src="assets/js/index.js"></script>
    <script type="text/javascript">
	document.getElementById("add").onclick=function(){
	document.getElementById("newplate").style.display="block";
	}
	</script>
</body>
</html>

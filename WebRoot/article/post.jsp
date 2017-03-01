<%@page import="java.util.prefs.BackingStoreException"%>
<%@ page language="java" import="java.util.*,java.sql.*,com.wzbcbbs.db.*" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String posturl = request.getParameter("postfrom");
	int plateid = Integer.parseInt(request.getParameter("plateid"));
	System.out.println("plateid ====== " + plateid);
	String action = request.getParameter("action");
	
	if(session.getAttribute("isLogin") == null){
		out.write("<script>alert(\"请先登陆后发帖！\");window.location.href=\"../index.jsp\";</script>");
		return;
	}
	
	if(action != null && action.trim().equals("post")){
		
		String title = request.getParameter("title");
		System.out.println(title);
		String cont = request.getParameter("cont");
		System.out.println(cont);
		Connection conn = DataBase.getConn();
		
		boolean autoCommit = conn.getAutoCommit();
		conn.setAutoCommit(false);
		
		int rootId = -1;
		
		//Integer.valueOf(session.getAttribute("id").toString())
		String sql = "insert into article values (null,?,?,?,?,now(),?,?,?)";
		PreparedStatement pstmt = DataBase.prepareStmt(conn,sql,Statement.RETURN_GENERATED_KEYS);
		pstmt.setInt(1, 0);
		pstmt.setInt(2, rootId);
		pstmt.setString(3, title);
		pstmt.setString(4, cont);
		pstmt.setInt(5, 0);
		pstmt.setInt(6, Integer.valueOf(session.getAttribute("id").toString()));
		pstmt.setInt(7, plateid);
		pstmt.executeUpdate();
		
		ResultSet rsKey = pstmt.getGeneratedKeys();
		rsKey.next();
		rootId  = rsKey.getInt(1);
		
		Statement stmt = DataBase.createStmt(conn);
		stmt.executeUpdate("update article set rootId = " + rootId + " where id = " + rootId);
		stmt.executeUpdate("update user set user_posts = user_posts+" + 1 + " where user_id = " + Integer.valueOf(session.getAttribute("id").toString()));
		conn.commit();
		conn.setAutoCommit(autoCommit);
		
		/* Statement stmt2 = DataBase.createStmt(conn);
		stmt2.executeUpdate("update article set rootId = " + rootId + " where id = " + rootId);
		conn.commit();
		conn.setAutoCommit(autoCommit); */
		
		DataBase.close(pstmt);
		DataBase.close(stmt);
		DataBase.close(conn);
		response.sendRedirect(posturl);
	}
%>


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

    <link type="image/png" rel="shortcut icon" href="../assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
    <link type="text/css" rel="stylesheet" href="../assets/plugins/awesome/css/font-awesome.min.css" />
    <!--Import styles-->
    <link type="text/css" rel="stylesheet" href="../assets/plugins/materialize/css/materialize.min.css" />
    <link type="text/css" rel="stylesheet" href="../assets/plugins/prism/prism.css" />
    <link type="text/css" rel="stylesheet" href="../assets/css/screen.css" />
</head>
  
  <body>
  
   <!-- 头部导航区 -->
    <header class="navbar-fixed">
        <nav id="headNav" class="bf-color none-shadow">
            <div id="navContainer" class="container">
                <div class="nav-wrapper hide-on-med-and-down" >
                    <div class="brand-logo">
                        <a href="index.jsp" class="waves-effect waves-light">
                            <img src="../assets/images/logo.png" class="logo-img hide-on-small-only">
                            <span class="logo-span">在温言商</span>
                        </a>
                    </div>
                    <a href="#" data-activates="mobile-nav" class="button-collapse"><i class="fa fa-navicon"></i></a>
                    <ul class="right">
                        <li class="hide-on-med-and-down">
                            <a href="index.jsp" class="waves-effect waves-light">首页</a>
                        </li>
                    </ul>
                    <div class="side-nav" id="mobile-nav">
                        <ul class="menu-list">
                            <li>
                                <a href="index.jsp" class="waves-effect waves-light">
                                    <i class="fa fa-home fa-lg fa-fw"></i>首 页
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
        <center>
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <h2 class="heading">发帖</h2>
                    </div>
                </div>
            </div>
        </div>
        </center>

        <!-- 发帖内容详情 -->
        <div id="artDetail" class="container ">
            <div class="card">
                <div class="article-card-content">
  
  	<form action = "post.jsp?plateid=<%=plateid %>&postfrom=<%=posturl %>" method = "post">
  		<input type = "hidden" name="action" value="post"/>
  		标题：<input type="text" name="title"><br>
  		内容： <textarea name="cont" id="cont" cols="20" rows="2" class="ueditor" style="height: 280px;"></textarea> 
  		   <script type="text/javascript" src="../UEditor/ueditor.config.js"></script>
		    <!-- 编辑器源码文件 -->
		    <script type="text/javascript" src="../UEditor/ueditor.all.js"></script>
		    <!-- 实例化编辑器 -->
		    <script type="text/javascript">
		        var ue = UE.getEditor('cont');
		    </script>
		    <br>
  		 <input type="submit" class="btn btn-primary" value = "发帖" /> 
  		
  		
  	</form>
  	
  	</div>
                
                    <hr />
                    <br />
                    
        </div>
    </main>

    
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
        <form class="search-form" action="#!" autocomplete="off">
            <a href="#!" onclick="return false;" class="search-close">
                <i class="mdi-navigation-close"></i>
            </a>
            <div class="container row search-container">
                <div class="col offset-s1 s10 offset-m3 m8 offset-l4 l8">
                    <div class="search-label center-align">
                        <label for="s">输入关键字后‘回车’即可</label>
                    </div>
                    <div>
                        <input type="search" id="searchKey" name="s" class="search-input" autofocus="">
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
            <script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_m.js" charset="utf-8"></script>
            <!-- JiaThis Button END -->
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">关 闭</a>
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
    <script type="text/javascript" src="../assets/plugins/materialize/js/materialize.js"></script>
    <script type="text/javascript" src="../assets/plugins/masonry/masonry.pkgd.js"></script>
    <!-- <script type="text/javascript" src="http://cdn.bootcss.com/masonry/4.0.0/masonry.pkgd.min.js"></script> -->
    <script type="text/javascript" src="../assets/plugins/prism/prism.js"></script>
    <script type="text/javascript" src="../assets/js/index.js"></script>
    
    <script src="../assets/js/jquery.min.js"></script>
  	
  </body>
</html>

<%@ page language="java" import="java.util.*,com.wzbcbbs.db.*,java.sql.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    
    <title>注册-在温言商-商学院自己的BBS</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">   
  
		function $(id)  
		{  
		    return document.getElementById(id);  
		}  
		  
		function clearDiv()   
		{   
		    var nodes = $('artDetail').childNodes;  
		  
		    for(var i = 0 ; i < nodes.length ; i++)  
		    {  
		        if(nodes[i].type == 'text'||nodes[i].type == 'password')  
		        {  
		            nodes[i].value = '';  
		        }  
		    }  
		}   
		
		</script>   
	
  </head>

<link type="image/png" rel="shortcut icon" href="assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
    <link type="text/css" rel="stylesheet" href="assets/plugins/awesome/css/font-awesome.min.css" />
    <!--Import styles-->
    <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css" />
    <link type="text/css" rel="stylesheet" href="assets/plugins/prism/prism.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/screen.css" />

<body >
<s:actionmessagecssStyle="list-style-type:none;" escape="false"/>

    <!-- 头部导航区 -->
    <header class="navbar-fixed">
        <nav id="headNav" class="bf-color none-shadow">
            <div id="navContainer" class="container">
                <div class="nav-wrapper hide-on-med-and-down" >
                    <div class="brand-logo">
                        <a href="index.jsp" class="waves-effect waves-light">
                            <img src="assets/images/logo.png" class="logo-img hide-on-small-only">
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
                        <h2 class="heading">注册</h2>
                    </div>
                </div>
            </div>
        </div>
        </center>

        <!-- 文章内容详情 -->
        <div id="artDetail" class="container ">
            <div class="card">
                <div class="article-card-content">
                	<form class="form" action="doregister.jsp" method="post"> 
                	
                		<div class="row1">
				        <span class="label">用户名&nbsp;&nbsp;&nbsp;&nbsp;</span>
				        <input type="text" class="medium" name="username" data-role="username" placeholder="例如：翔爷无敌">
				        &nbsp;&nbsp;&nbsp;<span class="warning-info" style="color:#9e9e9e">*&nbsp;一经注册，不可更改，且长度不能超过10位</span> 
				      </div>
				      <div class="row1">
				      <span class="label">输入密码</span>
				      <input type="password" class="medium" name="password" data-role="password" placeholder="不少于6位">
				      &nbsp;&nbsp;&nbsp;<span class="warning-info" style="color:#9e9e9e">*&nbsp;请输入不少于6位的密码</span></div>
				      <div class="row1">
				      <span class="label">重复密码</span>
				      <input type="password" class="medium" name="password_repeat" data-role="password_repeat">
				      </div>
				      <div class="row1">
				        <span class="label">院系年级</span>
				        <input type="text" class="max-medium" name="faculty" data-role="faculty" placeholder="例：信息工程学院13级本科生、老师   *一经注册不可更改">
				      </div>
				     
				      <div class="row1">
				      <span class="label">电子邮箱</span>
				      <input type="text" class="max-medium" name="email" data-role="email" placeholder="例如：400823823@qq.com" >
				      </div>
				      <!-- <div class="row1">
				      <span class="label">联系电话</span>
				      <input type="text" class="max-medium" name="phone" data-role="phone" placeholder="电话或手机，固定电话请注明区号">
				      </div> -->
				      <!-- <div class="row1">
				        <span class="label">生日</span>
				        <input type="number" class="tiny" data-role="birthyear"><span class="tiny-inline-label">年</span>
				        <input type="number" class="ex-tiny" data-role="birthmonth"><span class="tiny-inline-label">月</span>
				        <input type="number" class="ex-tiny" data-role="birthday"><span class="tiny-inline-label">日</span>
				        <input type="checkbox" class="styledbox" id="form-2-checkbox-birthday" data-role="hide_horoscope" name="hide_horoscope" style="margin-left:25px;">
				        <label class="styledbox" for="form-2-checkbox-birthday">不展示我的星座</label>
				        <span class="warning-info">输入的日期不存在</span>
				      </div> -->
				      <div class="row1"><span class="label">性别</span>
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        <input type="radio" class="styledbox" id="form-2-radio-gender-1" data-role="gender" name="sex" value="男" checked>
				        <label class="styledbox" for="form-2-radio-gender-1" style="color:#000000" >男</label>
				        <input type="radio" class="styledbox" id="form-2-radio-gender-2" data-role="gender" name="sex" value="女">
				        <label class="styledbox" for="form-2-radio-gender-2" style="color:#000000" >女</label>
				        &nbsp;&nbsp;&nbsp;
				        <span class="warning-info" style="color:#9e9e9e">*&nbsp;一经注册，不可更改</span>
				      </div>
				      <div class="row1">
				      <br>
				      <!-- onclick="ale()" --> 
				      <input type="submit"  value="提交" />
				      &nbsp;&nbsp;&nbsp;
				      <input type="reset" name="clear" value="清除" onclick="clearDiv()" />
				      </div>
				      
                	</form>
                
                    <hr />
                    <br />
                    <p>点击注册，即表示你阅读并同意遵守<a href="regulation.jsp" class="b-link-green">温州商学院BBS总纲，以及站规细则。
                    </p>
        </div>
    </main>


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
    <script type="text/javascript" src="assets/plugins/materialize/js/materialize.js"></script>
    <script type="text/javascript" src="assets/plugins/masonry/masonry.pkgd.js"></script>
    <!-- <script type="text/javascript" src="http://cdn.bootcss.com/masonry/4.0.0/masonry.pkgd.min.js"></script> -->
    <script type="text/javascript" src="assets/plugins/prism/prism.js"></script>
    <script type="text/javascript" src="assets/js/index.js"></script>
</body>

</html>

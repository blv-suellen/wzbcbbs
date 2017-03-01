<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@ page language="java" import="java.util.*,java.sql.*,com.wzbcbbs.db.*" pageEncoding="UTF-8"%>
<%
	//获取内容
	String strId = request.getParameter("id");
	String plateid = request.getParameter("plateid");
	if(strId == null || strId.trim().equals("")) {
		out.println("Error ID!");
		return;
	}
	int id = 0;
	try {
		id = Integer.parseInt(strId);
	} catch (NumberFormatException e) {
		out.println("Error ID Again!");
		return;
	} 
	
	//分页操作
	final int PAGE_SIZE = 4;
	int pageNo = 1;
	String strPageNo = request.getParameter("pageNo");
	
	if(strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		} 
	}
	
	if(pageNo <= 0) pageNo = 1;
	
	int totalPages = 0;
	
	List<Article> articles = new ArrayList<Article>();
	List<Article> articlery = new ArrayList<Article>();
	List<User> userinfolist = new ArrayList<User>();
	List<Plate> plateinfo = new ArrayList<Plate>();
	Connection conn = DataBase.getConn();
	Statement stmt = DataBase.createStmt(conn);
	
	//分页操作
	Statement stmtCount = DataBase.createStmt(conn);
	ResultSet rsCount = DataBase.executeQuery(stmtCount, "select count(*) from article where pid = "+ id +" or id ="+id);
	rsCount.next();
	int totalRecords = rsCount.getInt(1);
	
	totalPages = (totalRecords + PAGE_SIZE -1)/PAGE_SIZE;
	
	if(pageNo > totalPages) pageNo = totalPages;
	
	 int startPos = (pageNo-1) * PAGE_SIZE; 

	
	String sql = "select * from article where ( pid = 0 and rootid =" + id +") or pid = " + id  + " order by pdate asc limit " + startPos + "," + PAGE_SIZE ;
	System.out.println(sql);
	ResultSet rs = DataBase.executeQuery(stmt, sql);
	while(rs.next()) {
		Article a = new Article();
		a.initFromRs(rs);
		articles.add(a);
	}
	
	 //DataBase.close(stmttopic); 
	DataBase.close(rsCount);
	DataBase.close(stmtCount);
	
	DataBase.close(rs);
	DataBase.close(stmt);
	DataBase.close(conn);

	Connection connp = DataBase.getConn();
	Statement stmtp = DataBase.createStmt(connp);
	String platestring = "select * from plate where plate_id = " + plateid ;
	ResultSet rplate = DataBase.executeQuery(stmtp, platestring);
	if(rplate != null && rplate.next()) {
		Plate p = new Plate();
		p.setPlate(rplate);
		plateinfo.add(p);
		}
	DataBase.close(rplate);
	DataBase.close(stmtp);
	DataBase.close(connp);
	
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title> 在温言商-商学院自己的BBS</title>
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

  </head>
  
  <body>
    <!-- 头部导航区 -->
    <header class="navbar-fixed">
        <nav id="headNav" class="bf-color none-shadow">
            <div id="navContainer" class="container">
                <div class="nav-wrapper hide-on-med-and-down">
                    <div class="brand-logo">
                        <a href="content.jsp" class="waves-effect waves-light">
                            <img src="assets/images/logo.png" class="logo-img hide-on-small-only">
                            <span class="logo-span">在温言商</span>
                        </a>
                        
                    </div>
                    <a href="#" data-activates="mobile-nav" class="button-collapse"><i class="fa fa-navicon"></i></a>
                    <ul class="right">
                        <li class="hide-on-med-and-down">
                            <a href="content.jsp" class="waves-effect waves-light">首页</a>
                        </li>
                        <li class="hide-on-med-and-down">
                         <%
                    	String posturl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
                    	posturl += request.getContextPath() ;
                    	posturl += request.getServletPath();
                    	posturl += request.getQueryString()== null ? "" : ("?" + request.getQueryString()) ;
                    	//System.out.println(posturl);
                     %>
                            <a href="article/post.jsp?plateid=<%=plateid %>&postfrom=<%=posturl %>" class="waves-effect waves-light">发帖</a>
                        </li>
                        <li>
                            <a href="#!" id="toggle-search" class="waves-effect waves-light">
                                <i id="searchIcon" class="mdi-action-search"></i>
                            </a>
                        </li>
                    </ul>
                    <div class="side-nav" id="mobile-nav">
                        <div class="mobile-head bf-color">
                            <img src="assets/images/head_pic.jpg" class="logo-img circle responsive-img">
                            <div class="logo-name">在温言商</div>
                            <div class="logo-desc">温州商学院BBS</div>
                        </div>
                        <ul class="menu-list">
                            <li>
                                <a href="content.jsp" class="waves-effect waves-light">
                                    <i class="fa fa-home fa-lg fa-fw"></i>首 页
                                </a>
                            </li>
                            <li>
                                <a href="post.jsp" class="waves-effect waves-light">
                                    <i class="fa fa-book fa-lg fa-fw"></i>发 帖
                                </a>
                            </li>
                            <hr>
                            <li>
                                <a href="settings.html" class="waves-effect waves-light">
                                    <i class="fa fa-gear fa-lg fa-fw"></i>设 置
                                </a>
                            </li>
                        </ul>
                        <div class="social-link">
                            <a href="https://github.com/blv-suellen" class="tooltipped" target="_blank" data-tooltip="访问我的GitHub" data-position="top" data-delay="50">
                                <i class="fa fa-github fa-lg"></i>
                            </a>
                            <a href="mailto:1553856390@163.com" class="tooltipped" target="_blank" data-tooltip="邮件联系我" data-position="top" data-delay="50">
                                <i class="fa fa-envelope fa-lg"></i>
                            </a>
                            <a href="#!" class="tooltipped" data-tooltip="QQ号：400823823" data-position="top" data-delay="50">
                                <i class="fa fa-qq fa-lg"></i>
                            </a>
                            <a href="#!" class="tooltipped" data-tooltip="商学院我最叼" target="_blank" data-position="top" data-delay="50">
                                <i class="fa fa-rss fa-lg"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="nav-wrapper hide-on-large-only">
                    <a href="blog.html" class="left hide-on-large-only go-back waves-effect waves-light">
                        <i class="fa fa-arrow-left fa-lg"></i>
                    </a>
                    <div class="brand-logo">
                        <span class="logo-span">博文详情</span>
                    </div>
                    <a href="#shareModal" class="right hide-on-large-only go-back modal-trigger waves-effect waves-light">
                        <i class="fa fa-share-alt fa-lg"></i>
                    </a>
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
                        <h2 class="heading"><%=plateinfo.get(0).getPlate_name()%></h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- 文章内容详情 -->
       
        <div id="artDetail" class="container notice" >
            <div class="card">
                <div class="card-content">
                    <div class="article-tag">
                        <h2><% //articles.get(0).getTitle();
                        String theme = new String() ;
                        	if(pageNo==1){
                        		theme = articles.get(0).getTitle();
                        	}
                        
                         %><%=theme %></h2>
                    </div>
                </div>
                <hr style=" height:1px;border:none;border-top:1px solid #555555;"/>
                <div class="card-content article-card-content" >
                <!-- 内容 -->
                    
  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
    <tbody>
      <tr valign="top">
        <td width="99%"><div id="jive-message-holder">
            <div class="jive-message-list">
              <div class="jive-table">
                <div class="jive-messagebox">
				
				<!-- start -->
				
				 <%
				 
				for(int i=0; i<articles.size(); i++) {
					Article a = articles.get(i);
					
					Connection conn2 = DataBase.getConn();
					Statement stmt2 = DataBase.createStmt(conn2);
					
					int userid = a.getUser_id();
					String userinfo = "select * from user where user_id = " + userid ;
					ResultSet rs2 = DataBase.executeQuery(stmt2, userinfo);
					User user = new User();
					if(rs2 != null && rs2.next()) {
						user.setUser_id(rs2.getInt("user_id"));
						user.setUser_name(rs2.getString("user_name"));
						user.setUserpicture_url(rs2.getString("userpicture_url"));
						user.setUser_posts(rs2.getInt("user_posts"));
						user.setSlogan(rs2.getString("slogan"));
					}
					DataBase.close(rs2);
					DataBase.close(stmt2);
					DataBase.close(conn2);
					
					
					
					String floor = null;
					if(pageNo==1){
					 floor = i == 0 ? "楼主" : "第" + i + "楼";
					}else{
						  floor =  "第" + (i + PAGE_SIZE*(pageNo-1)) + "楼";
					}
					articlery = new ArrayList<Article>();
				 %>
                  <table summary="Message" cellpadding="0" cellspacing="0" width="100%" style="border-top: 1px solid rgb(204, 204, 204);">
                    <tbody>
                      <tr id="jive-message-780144" class="jive-odd" valign="top" >
                        <td class="jive-first" width="1%" style="border-right: 1px solid rgb(204, 204, 204);" bgcolor="#f5f7fa" >
                        
						<!-- 个人信息的table -->
						<table border="0" cellpadding="0" cellspacing="0" width="250" >
                            <tbody>
                              <tr> 
                                <td>
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                      <tr valign="top">
                                      <td style="padding: 0px;" ><img class="showheadimage" src=<%=user.getUserpicture_url() %> ></td><br>
                                        
                                        </td>
                                      </tr>
                                   </tbody>
                                  </table>
                                  <br>
                                  <div class="showtabel" > 
                                  	<%=user.getUser_name() %><br>
                                  	 发表贴数:<%=user.getUser_posts() %> <br>
					               <!--                  
					                                  点数: 100<br>
					                                  注册:07-5-10 <br> -->
					               </div>
					               </td>
					               </tr>
                            </tbody>
                          </table>
 						  <!--个人信息table结束-->
						  
						  
                        <td class="jive-last" width="99%"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                              <tr valign="top">
                    
                              </tr>
                              <tr>
                                <td colspan="4" ><br>
                                 <%=a.getCont() %> <br>
                                  <br>
                                  	<div class="jive-buttons">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                      <tbody>
                                        <tr>
                                        <td width="99%" > ·<font color="#666666"><%=floor %></font></a> </td>
                                          <td width="1%" class="jive-icon-label">
                                           <%
						                    	String replyurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
						                    	replyurl += request.getContextPath() ;
						                    	replyurl += request.getServletPath();
						                    	replyurl += request.getQueryString()== null ? "" : ("?" + request.getQueryString()) ;
						                    	//System.out.println("adf-->" + replyurl);
						                     	String url = replyurl;
						                     %>
						                     <%
						                     //session.getAttribute("isLogin").equals("1") &&session.getAttribute("isAdmin").equals("0")&&
						                     	if(session.getAttribute("isLogin")!=null&&session.getAttribute("isAdmin").equals("0")&&user.getUser_id()== Integer.valueOf(session.getAttribute("id").toString())){
						                      %>
						                     <a style="width: 50%" href="delete.jsp?plateid=<%=plateid %>&id=<%=a.getId() %>&isLeaf=<%=a.isLeaf()%>&pid=<%=a.getPid()%>&from=<%=url%>" title="删除此回复">删除  </a>
                                         		<%
                                         		} 
                                         		session.setAttribute("replyfrom", replyurl);
                                         		%>
                                          <a style="width: 50%" href="reply.jsp?plateid=<%=plateid %>&id=<%=a.getId()%>&rootId=<%=a.getRootid()%>" title="回复本主题">回复</a>
                                          
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="4" colspan="4" style="border-top: 1px solid rgb(204, 204, 204); font-size: 9pt; table-layout: fixed;"><br>
                                  <font color="#568ac2"><%=user.getSlogan()%></font> <br>
                                </td>
                              </tr>
                              
                              <!-- 回复界面 -->
                                 
                                 	<%
                                 	if(a.getId()>a.getRootid()){
                                 	Connection connrep = DataBase.getConn();
									Statement stmtrep = DataBase.createStmt(connrep);
									System.out.println("a.getid-->"+a.getId());
									String repa = "select * from article where pid = " + a.getId();
									if(repa!=null){ 
									ResultSet rsrep = DataBase.executeQuery(stmtrep, repa);
									while(rsrep.next()) {
										Article rsr = new Article();
										rsr.initFromRs(rsrep);
										articlery.add(rsr);
									} 
									DataBase.close(rsrep);
									DataBase.close(stmtrep);
									DataBase.close(connrep);
									
                                 	for(int j=0;j<articlery.size();j++){
                                 		Article rsr = articlery.get(j);
										System.out.println("articlery.size()-->"+articlery.size());
										Connection conn3 = DataBase.getConn();
										Statement stmt3 = DataBase.createStmt(conn3);
										int reuserid = rsr.getUser_id();
										String reuserinfo = "select * from user where user_id = " + userid ;
										ResultSet rs3 = DataBase.executeQuery(stmt3, reuserinfo);
										User user2 = new User();
										if(rs3 != null && rs3.next()) {
											user2.setUser_name(rs3.getString("user_name"));
											user2.setUserpicture_url(rs3.getString("userpicture_url"));
										}
										DataBase.close(rs3);
										DataBase.close(stmt3);
										DataBase.close(conn3);
                                 	 %>
                                 	<!--  <tr>
                                 	 <td  style="font-size: 8pt;table-layout: fixed;" ><br> -->
                                 	 <div class="replybtn" >
                                 	 <tr style="background-color:#f5f7fa;" height="40px;">
                                 	 <td class="1" width="5%"><img src="<%=user2.getUserpicture_url() %>" width="100%"  style="-moz-border-radius: 50%;-webkit-border-radius: 50%;transition: linear 0.25s;"/></td>
                                 	<td class="2" width="8%"><%=user2.getUser_name() %>:</td>  
                                 	<td class="3" width="87%"><%=rsr.getCont() %></td>
                                 	</tr>
                                 	</div>
                                 	<!-- </td>
                                 	</tr> -->
                                 	<%
                                 	} 
                                 	 }else{
                                 	DataBase.close(stmtrep);
									DataBase.close(connrep);
									}}
                                 	%>
                                  
                                
                              <!-- 回复界面结束 -->
                            </tbody>
                          </table>
                          </td>
                      </tr>
                    </tbody>
                  </table>
				  
				  <!-- end -->
				  <%
				  }
				   %>
				   </div>
                </div>
              </div>
            </div>
            </td>
            </tr>
            </tbody>
            </table>
 
                    <hr />
                    <br />
                    <div class="article-share">
                        <div>分享到：</div>
                        <!-- JiaThis Button BEGIN -->
                        <div class="jiathis_style_24x24 jt-share">
                            <a class="jiathis_button_qzone"></a>
                            <a class="jiathis_button_tsina"></a>
                            <a class="jiathis_button_tqq"></a>
                            <a class="jiathis_button_weixin"></a>
                            <a class="jiathis_button_renren"></a>
                            <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                        </div>
                        <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                        <!-- JiaThis Button END -->
                    </div>
                    </div>
                </div>
                </div>
                   
            
            <!-- 上一篇和下一篇功能 -->
           	<div class="container paging">
            <div class="row">
                <div class="col s6 m4 l4">
                    <a href="articleDetailFlat.jsp?plateid=<%=plateid %>&id=<%=id %>&pageNo=<%=pageNo - 1 %>" class="left btn-floating btn-large waves-effect waves-light bf-color">
                        <i class="fa fa-angle-left"></i>
                    </a>
                </div>
                <div class="page-info col m4 l4 hide-on-small-only">
                    <div class="center-align b-text-gray">
                    <a href="articleDetailFlat.jsp?plateid=<%=plateid %>&id=<%=id %>&pageNo=1">首页</a>
                    /第 <%=pageNo %> 页 / 共 <%=totalPages %> 页/
                   <a href="articleDetailFlat.jsp?plateid=<%=plateid %>&id=<%=id %>&pageNo=<%=totalPages %>">尾页</a>
                 	</div>
                </div>
                <div class="col s6 m4 l4">
                    <a href="articleDetailFlat.jsp?plateid=<%=plateid %>&id=<%=id %>&pageNo=<%=pageNo + 1 %>" class="right btn-floating btn-large waves-effect waves-light bf-color">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>
                
            </div>
        </div>
    </main>
    
 

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
            <i  class="fa fa-angle-double-up"></i>
        </a>
        <p>
        <p>
      <%--  	<a class="btn-floating btn-large waves-effect waves-light red accent-2" 
       	href="reply.jsp?plateid=<%=articles.get(0).getPlate_id()%>&id=<%=articles.get(0).getId()%>&rootId=<%=articles.get(0).getRootid() %>" >
            <i class="2">回帖 </i>
        </a> --%>
       
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


<%@ page language="java" import="java.util.*,com.wzbcbbs.db.*,java.sql.*,com.wzbcbbs.servlet.*" pageEncoding="UTF-8"%>

<%
	
	String searchkey = request.getParameter("searchkey");
	System.out.println("searchkey--->" + searchkey);
	if(searchkey == null || searchkey.trim().equals("")) {
	out.println("Error searchkey!");
	return;
	}
	
	
	final int PAGE_SIZE = 40;
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
	
	List<User> usersearch = new ArrayList<User>();
	List<Article> articlesearch = new ArrayList<Article>();
	
	
	Connection conn = DataBase.getConn();
	Statement stmt = DataBase.createStmt(conn);
	
	//分页操作
	Statement stmtCount = DataBase.createStmt(conn);
	ResultSet rsCount = DataBase.executeQuery(stmtCount, "select count(*) from user where user_name like '" + "%" + searchkey + "%" + "' or slogan like '" + "%" + searchkey + "%" +"'");
	
	if(rsCount!=null){
		rsCount.next();
	}
	Statement stmtCount2 = DataBase.createStmt(conn);
	ResultSet rsCount2 = DataBase.executeQuery(stmtCount2, "select count(*) from article where title like '" + "%" + searchkey + "%" + "' or cont like '" + "%" + searchkey + "%" +"'");
	if(rsCount2!=null){
		rsCount2.next();
	}else{
		 rsCount2 = null;
	}
	
	/* if(rsCount ==null&&rsCount2 ==null){
		out1.print("<script>alert(\"未找到指定结果，返回上一页！\");window.location.href=\"content.jsp\";</script>");
		return;
	} */
	
	int totalRecords = 0;
	if(rsCount!=null&&rsCount2!=null){
		totalRecords = rsCount.getInt(1) + rsCount2.getInt(1);
	}else if(rsCount!=null&&rsCount2==null){
		 totalRecords = rsCount.getInt(1);
	}else if(rsCount==null&&rsCount2!=null){
		 totalRecords = rsCount2.getInt(1);
	}else if(rsCount==null&&rsCount2==null){
		 totalRecords = 0;
		 out.print("<script>alert(\"未找到指定结果，返回上一页！\");window.location.href=\"content.jsp\";</script>");
		return;
	}
	
	
	totalPages = (totalRecords + PAGE_SIZE - 1)/PAGE_SIZE;
	
	if(pageNo > totalPages) pageNo = totalPages;
	
	int startPos = (pageNo-1) * PAGE_SIZE; 
	
	String articlesql = "select * from article where title like '" + "%" + searchkey + "%" + "' or cont like '" + "%" + searchkey + "%" + "' order by pdate asc limit " + startPos + "," + PAGE_SIZE ;
	ResultSet rs = DataBase.executeQuery(stmt, articlesql);
	while(rs.next()) {
		Article a = new Article();
		a.initFromRs(rs);
		articlesearch.add(a);
	}
	
	String usersql = "select * from user where user_name like '" + "%" + searchkey + "%" + "' or slogan like '" + "%" + searchkey + "%" + "' order by user_id asc limit " + startPos + "," + PAGE_SIZE ;
	System.out.println(usersql);
	ResultSet rsu = DataBase.executeQuery(stmt, usersql);
	while(rsu.next()) {
		User u = new User();
		u.initUser(rsu);
		usersearch.add(u);
	}
	
	DataBase.close(rsCount2);
	DataBase.close(stmtCount2);
	DataBase.close(rsCount);
	DataBase.close(stmtCount);
	
	DataBase.close(rsu);
	DataBase.close(rs);
	DataBase.close(stmt);
	DataBase.close(conn);
	

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    
    <title>搜索-在温言商-商学院自己的BBS</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

<link type="image/png" rel="shortcut icon" href="assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
    <link type="text/css" rel="stylesheet" href="assets/plugins/awesome/css/font-awesome.min.css" />
    <!--Import styles-->
    <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css" />
    <link type="text/css" rel="stylesheet" href="assets/plugins/prism/prism.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/screen.css" />

<body >


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
        
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <h2 class="heading">搜索</h2>
                    </div>
                </div>
            </div>
        </div>
        

        <!-- 文章内容详情 -->
        <div id="artDetail" class="container ">
            <div class="card">
                <div class="article-card-content">
                         <!-- 人 -->
                    <div class = "search-human">
                    <fieldset> 
					<legend style="color:red">以下是搜索用户结果</legend>      
                <table summary="List of threads" cellpadding="0" cellspacing="0" width="100%">
                <thead>
                  <tr>
                  <th class ="usernumber" width="5%" >序号</th>
                    <th class="username" width="10%"> 名字 </th>
                    <th class="userslogan" width="55%"> 个签 </th>
                    <% if(session.getAttribute("isAdmin")!=null&&session.getAttribute("isAdmin").toString().equals("1")){%>
                    <th class="userodify" width ="30%">操作</th>
                    <%
                    } %>
                  </tr>
                </thead>
                <tbody>
               <%
               		int lineNo = 0;
               		String classStr = lineNo%2 == 0 ? "line-even" : "line-odd";
               		
               		if(usersearch.size()!=0){
               		for(int i=0;i<usersearch.size();i++ ) {           
                	User u = usersearch.get(i);
                %>
                  <tr class="<%=classStr %>">
                    <td class="usernumber" nowrap="nowrap" width="5%" style="color:#9e9e9e"><%=i + 1 %>
                      </div></td>
                      
                    <td nowrap="username" width="10%">
                    <a href = "me.jsp?id=<%=u.getUser_id()%>"><%=u.getUser_name() %></a>
                    </td>
                    <td class="userslogan" nowrap="nowrap" width="55%"><span class=""><%=u.getSlogan() %></a> </span></td>
                  </tr>
                  <% if(session.getAttribute("isAdmin")!=null&&session.getAttribute("isAdmin").toString().equals("1")){%>
                    <td class="userodify" width ="30%"><a href="changeUser.jsp?userid=<%=u.getUser_id() %>">修改</a>&nbsp;<a href="UserloginServlet?method=3&userid=<%=u.getUser_id() %>">删除</a></td>
                    <%
                    } %>
                  <%
                  	lineNo++;
                  }}else{
                  %>
                  <tr class="notfound" width="80%">
			                  <div class = "notdiv" style="height: 80px;">未找到指定的结果！</div>
			                  </tr>
			                  <%
			      } %>
                 </fieldset>
                </tbody>
              </table>
                         </div>
                         <br>
                         <!-- END -->
                         
                         <!-- 帖子 -->
                         <div class = "search-article">
                          <fieldset> 
							<legend style="color:red">以下是搜索帖子结果</legend>  
                         
                          <table summary="List of threads" cellpadding="0" cellspacing="0" width="100%">
			                <thead>
			                  <tr>
			                  <th class ="articlesnumber" width="5%" >序号</th>
			                  <th class="articlestitle" width="10%"> 标题 </th>
			                  <th class="articlescont" width="85%"> 内容 </th>
			                  </tr>
			                </thead>
			                <tbody>
			               <%
			               		int lineN2o = 0;
			               		String classStr2 = lineN2o%2 == 0 ? "line-even" : "line-odd";
			               		if(articlesearch.size()!= 0){
			               		for(int j = 0;j<articlesearch.size();j++ ) {           
			                	Article a = articlesearch.get(j);
			                %>
			                  <tr class="<%=classStr2 %>">
			                    <td class="articlesnumber" nowrap="nowrap" width="5%" style="color:#9e9e9e"><%=j + 1%>
			                      </div></td>
			                      
			                    <td nowrap="articlestitle" width="10%">
			                    <a href = "articleDetailFlat.jsp?id=<%=a.getUser_id()%>&plateid=<%=a.getPlate_id()%>"><%=a.getTitle()%></a>
			                    </td>
			                    
			                    <td class="articlescont" width="85%"><a id="jive-thread-1" href="article/articleDetailFlat.jsp?id=<%=a.getUser_id()%>&plateid=<%=a.getPlate_id()%>"><%=a.getCont() %></a></td>
			                  </tr>
			                 <%
			                 	lineN2o++;
			                 	}}else{
			                  %>
			                  <tr class="notfound" width="80%">
			                  <div class = "notdiv" style="height: 400px;">未找到指定的结果！</div>
			                  </tr>
			                  <%
			                  } %>
			                 </fieldset>
			                </tbody>
			              </table>
                         
                         
                         
						<!-- END -->
                </div>
                	</div>
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
    <script type="text/javascript" src="assets/plugins/materialize/js/materialize.js"></script>
    <script type="text/javascript" src="assets/plugins/masonry/masonry.pkgd.js"></script>
    <!-- <script type="text/javascript" src="http://cdn.bootcss.com/masonry/4.0.0/masonry.pkgd.min.js"></script> -->
    <script type="text/javascript" src="assets/plugins/prism/prism.js"></script>
    <script type="text/javascript" src="assets/js/index.js"></script>
</body>

</html>

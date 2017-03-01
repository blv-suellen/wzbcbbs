<%@ page language="java" import="java.util.*,java.sql.*,com.wzbcbbs.db.*" pageEncoding="UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	String replyurl = session.getAttribute("replyfrom").toString();
	//java.net.URLEncoder.encode(replyurl, "UTF-8");
	//int id = Integer.parseInt(request.getParameter("pid"));
	int pid = Integer.parseInt(request.getParameter("pid"));
	int rootId = Integer.parseInt(request.getParameter("rootId"));
	int plateid = Integer.parseInt(request.getParameter("plateid"));
	System.out.println("rep-replyurl--->" + replyurl);
	
	String title = request.getParameter("title");
	System.out.println(title);
	String cont = request.getParameter("cont");
	System.out.println(cont);
	Connection conn = DataBase.getConn();
	
	boolean autoCommit = conn.getAutoCommit();
	conn.setAutoCommit(false);
	
	String sql = "insert into article values (null,?,?,?,?,now(),?,?,?)";
	PreparedStatement pstmt = DataBase.prepareStmt(conn, sql);
	pstmt.setInt(1, pid);
	pstmt.setInt(2, rootId);
	pstmt.setString(3, title);
	pstmt.setString(4, cont);
	pstmt.setInt(5, 0);
	pstmt.setInt(6, Integer.valueOf(session.getAttribute("id").toString()));
	pstmt.setInt(7, plateid);
	pstmt.executeUpdate();
	
	Statement stmt = DataBase.createStmt(conn);
	stmt.executeUpdate("update article set isleaf = 1 where id = " + pid);
	conn.commit();
	conn.setAutoCommit(autoCommit);
	DataBase.close(pstmt);
	DataBase.close(stmt);
	DataBase.close(conn);
%>


<h2>该版面诚招广告商，价格面议。</h2><br> 
<span id="time" style="color:red">5</span>


<script language="JavaScript1.2" type="text/javascript">
<!--
//  Place this in the 'head' section of your page.  

function delayURL(url) {
    var delay = document.getElementById("time").innerHTML;
    if(delay>0){
    	delay--;
    	document.getElementById("time").innerHTML = delay;
    }else{
    	window.top.location.href = url;
    }
    setTimeout("delayURL('" + url + "')", 1000);
}

//-->

</script>

<a href="<%=replyurl%>">秒钟后自动跳转，没有跳转请点击这里。</a>
<script type="text/javascript">
delayURL("<%=replyurl%>");
</script>


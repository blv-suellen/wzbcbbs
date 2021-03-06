<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,com.wzbcbbs.db.*"  %>
<%//@include file="_SessionCheck.jsp" %>

<%!
private void delete(Connection conn, int id, boolean isLeaf) {
	//delete all the children
	//delete(conn, chids's id)
	
	if(!isLeaf) { 
		String sql = "select * from article where pid = " + id;
		Statement stmt = DataBase.createStmt(conn);
		ResultSet rs = DataBase.executeQuery(stmt, sql); 
		try {
			while(rs.next()) {
				delete(conn, rs.getInt("id"), rs.getInt("isleaf") == 0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
		}
	}
	
	
	//delete self
	DataBase.executeUpdate(conn, "delete from article where id = " + id);
	
	
}
%>

<%
int id = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));
boolean isLeaf = Boolean.parseBoolean(request.getParameter("isLeaf"));
String url = request.getParameter("from");
System.out.println("url = " + url);
Connection conn = null;
boolean autoCommit = true;
Statement stmt = null;
ResultSet rs = null;

try {
	conn = DataBase.getConn();
	autoCommit = conn.getAutoCommit();
	conn.setAutoCommit(false);
	
	delete(conn, id, isLeaf);
	
	stmt = DataBase.createStmt(conn);
	rs = DataBase.executeQuery(stmt, "select count(*) from article where pid = " + pid);
	rs.next();
	int count = rs.getInt(1);
	
	if(count <= 0) {
		DataBase.executeUpdate(conn, "update article set isleaf = 0 where id = " + pid);
	}
	
	conn.commit();
} finally {
	conn.setAutoCommit(autoCommit);
	DataBase.close(rs);
	DataBase.close(stmt);
	DataBase.close(conn);
}
response.sendRedirect(url);
%>
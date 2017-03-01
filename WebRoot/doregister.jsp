<%@ page language="java" import="java.util.*,com.wzbcbbs.db.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	//System.out.println(username);
	String password = request.getParameter("password");
	//System.out.println(password);
	String password_repeat = request.getParameter("password_repeat");
	//System.out.println(password_repeat);
	String faculty = request.getParameter("faculty");
	//System.out.println(faculty);
	String email = request.getParameter("email");
	//System.out.println(email);
	String sex = request.getParameter("sex");
	//System.out.println(sex);
	
	boolean isValid = false;
	Connection conn = DataBase.getConn();
	conn.setAutoCommit(false);
	Statement stmt1 = conn.createStatement();
	
	try{

	ResultSet rs = stmt1.executeQuery("select user_name from user where user_name = '"+ username + "'");
	//System.out.println(username+"略略略");
	
	if(username==null||"".equals(username.trim())||password==null||"".equals(password.trim())||password_repeat==null||"".equals(password_repeat.trim())
		){ 
	  out.print("<script>alert(\"用户名或密码不能为空！\");window.location.href=\"register.jsp\";</script>");
	  return; 
	 }else if(username.length()>10){
	 	 out.print("<script>alert(\"用户名长度不能超过10位！\");window.location.href=\"register.jsp\";</script>");
	 	 return;
	 }else if(password.length()<6){
	 	 out.print("<script>alert(\"请输入不少于6位的密码！\");window.location.href=\"register.jsp\";</script>");
	 	 return;
	 }else if(!password.equals(password_repeat)){
	 	 out.print("<script>alert(\"两次密码不一样！\");window.location.href=\"register.jsp\";</script>");
	 	 return;
	 }else if(password.length()<6){
	 	 out.print("<script>alert(\"请输入不少于6位的密码！\");window.location.href=\"register.jsp\";</script>");
	 	 return;
	 }else if(email.indexOf("@")== -1||email.indexOf(".")== -1){
	 	 out.print("<script>alert(\"请填写正确的邮箱地址！\");window.location.href=\"register.jsp\";</script>");
	 	 return;
	 }else if(faculty==null){
	 	 out.print("<script>alert(\"请填写院系年级！\");window.location.href=\"register.jsp\";</script>");
	 	 return;
	 }else if(rs != null && rs.next()){
		 out.print("<script>alert(\"该用户已存在！\");window.location.href=\"register.jsp\";</script>");
		return;
	 }else{
	 	
	 	
	 	
	 	String sql = "insert into user values (null,?,?,?,'这个人很懒，什么都没留下。',?,?,'http://127.0.0.1:8080/wzbcbbs/images/headimage/demo.jpg',0,0,0,1)";
		PreparedStatement pstmt = DataBase.prepareStmt(conn,sql,Statement.RETURN_GENERATED_KEYS);
		
		
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		pstmt.setString(3, sex);
		pstmt.setString(4, email);
		pstmt.setString(5, faculty);
		pstmt.executeUpdate();
	 	
	 	Statement stmt = DataBase.createStmt(conn);
		conn.commit();
		conn.setAutoCommit(isValid);
		DataBase.close(pstmt);
		DataBase.close(stmt);
		DataBase.close(conn);
		out.print("<script>alert(\"注册成功，点击跳转到登录界面！\");window.location.href=\"index.jsp\";</script>");
	 	
	 } 
	 }catch(SQLException e){
	 	e.printStackTrace();
	 }
 	
 	
 %>


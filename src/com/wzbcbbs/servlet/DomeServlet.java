package com.wzbcbbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wzbcbbs.Dao.ChangeUserInfoDao;
import com.wzbcbbs.db.User;

public class DomeServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		/*String userid = request.getParameter("userId");
		String changeslogan = request.getParameter("changeslogan");
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		String newpassword_repeat = request.getParameter("newpassword_repeat");
		System.out.println("aaa "+newpassword_repeat);*/
		
		String method = request.getParameter("method");
		HttpSession session = request.getSession();
		try {
			System.out.println("method --> "+method);
			if (method.equals("1")) {
				System.out.println("method1");
				String userid = request.getParameter("userid");
				String oldpwd = request.getParameter("password");
				String newpwd = request.getParameter("newpassword");
				String againpwd = request.getParameter("newpassword_repeat");
				ChangeUserInfoDao cuiDao = new ChangeUserInfoDao();
				String sqlPwd = cuiDao.getOldPwd(userid);
				System.out.println(userid + " - " + oldpwd + " - " + newpwd + " - " + againpwd + " - " + sqlPwd);
				if(newpwd.equals(againpwd)){
					if(newpwd.length() > 5){
						if(oldpwd.equals(sqlPwd)){
							if(cuiDao.changePwd(userid, newpwd)){
								out.write("<script>alert(\"修改用户密码成功！\");window.location.href=\"dome.jsp?userid="+userid +"\";</script>");
							}else{
								out.write("<script>alert(\"修改用户密码失败！\");window.location.href=\"dome.jsp?userid="+userid +"\";</script>");
							}
						} else{
							out.write("<script>alert(\"旧密码错误！\");window.location.href=\"dome.jsp?userid="+userid +"\";</script>");
						}
					} else{
						out.write("<script>alert(\"密码需要大于六位！\");window.location.href=\"dome.jsp?userid="+userid +"\";</script>");
					}
				} else{
					out.write("<script>alert(\"两次密码不一致！\");window.location.href=\"dome.jsp?userid="+userid +"\";</script>");
				}
			}else if(method.equals("2")){
				String userid = request.getParameter("userid");
				String newslogan = request.getParameter("changeslogan");
				User user = new User();
				user.setUser_id(Integer.parseInt(userid));
				user.setSlogan(newslogan);
				ChangeUserInfoDao userDao = new ChangeUserInfoDao();
				if(userDao.changeusersl(user)){
				out.write("<script>alert(\"修改用户签名成功！\");window.location.href=\"me.jsp?userid="+userid +"\";</script>");
				}else{
					out.write("<script>alert(\"修改用户签名失败！\");window.location.href=\"me.jsp?userid="+userid +"\";</script>");
				}
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			out.print("<script>alert(\"页面错误\");window.location.href=\"index.jsp\";</script>");
		}
	
		
		
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}

package com.wzbcbbs.servlet;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.Request;
import com.wzbcbbs.Dao.AdminDao;
import com.wzbcbbs.Dao.PlateDao;
import com.wzbcbbs.Dao.UserDao;
import com.wzbcbbs.db.Admin;
import com.wzbcbbs.db.Plate;
import com.wzbcbbs.db.User;

public class UserloginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6248921505944275832L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		int method = Integer.parseInt(request.getParameter("method"));
		HttpSession session = request.getSession();
		try {
			if (method == 1) {
				this.login(request, response);
			} else if (method == 4) {
				this.quit(request, response);
			} else if (method == 2) {
				String admin_name = request.getParameter("username");
				String admin_pw = request.getParameter("password");
				System.out.println(admin_name + " - " + admin_pw);
				Admin admin = new Admin();
				admin.setAdmin_name(admin_name);
				AdminDao adminDao = new AdminDao();
				String sql_pw = adminDao.adminLogin(admin).getAdmin_pw();
				if (sql_pw.equals(admin_pw)) {
					out.print("<script>window.location.href=\"adminContent.jsp\";</script>");
					session.setAttribute("isLogin", 1);
					session.setAttribute("isAdmin", 1);
					session.setAttribute("admin_id", adminDao.adminLogin(admin).getAdmin_id());
					session.setAttribute("admin_name", admin_name);
				} else {
					out.print("<script>alert(\"密码错误\");window.location.href=\"admin.jsp\";</script>");
				}
			} else if (method == 3) {
				String userid = request.getParameter("userid");
				UserDao userDao = new UserDao();
				if (userDao.deleteUser(userid)) {
					out.print("<script>alert(\"删除成功\");window.location.href=\"adminContent.jsp\";</script>");
				} else {
					out.print("<script>alert(\"删除错误\");window.location.href=\"adminContent.jsp\";</script>");
				}

			} else if (method == 5) {
				String userid = request.getParameter("userid");
				String username = request.getParameter("username");
				String useremail = request.getParameter("useremail");
				String userfaculty = request.getParameter("userfaculty");
				User user = new User();
				user.setUser_id(Integer.parseInt(userid));
				user.setUser_name(username);
				user.setUser_email(useremail);
				user.setUser_faculty(userfaculty);
				UserDao userDao = new UserDao();
				if (userDao.changeUser(user)) {
					out.print("<script>alert(\"修改成功\");window.location.href=\"adminContent.jsp\";</script>");
				} else {
					out.print("<script>alert(\"修改错误\");window.location.href=\"changeUser.jsp?userid=" + userid
							+ ".jsp\";</script>");
				}

			} else if (method == 6) {
				String plateid = request.getParameter("plateid");
				PlateDao plateDao = new PlateDao();
				if (plateDao.deletePlate(plateid)) {
					out.print("<script>alert(\"删除成功\");window.location.href=\"adminContent.jsp\";</script>");
				} else {
					out.print("<script>alert(\"删除错误\");window.location.href=\"adminContent.jsp\";</script>");
				}
			} else if (method == 7) {
				String plateid = request.getParameter("plate_id");
				String platename = request.getParameter("plate_name");
				String mottoone = request.getParameter("motto_one");
				String mottotwo = request.getParameter("motto_two");
				String mottothree = request.getParameter("motto_three");
				String platecont = request.getParameter("plate_cont");
				Plate plate = new Plate();
				plate.setPlate_id(Integer.parseInt(plateid));
				plate.setPlate_name(platename);
				plate.setMotto_one(mottoone);
				plate.setMotto_two(mottotwo);
				plate.setMotto_three(mottothree);
				plate.setPlate_cont(platecont);
				PlateDao plateDao = new PlateDao();
				if (plateDao.changePlate(plate)) {
					out.print("<script>alert(\"修改成功\");window.location.href=\"adminContent.jsp\";</script>");
				} else {
					out.print("<script>alert(\"修改错误\");window.location.href=\"changeUser.jsp?plateid=" + plateid
							+ ".jsp\";</script>");
				}
			} else if (method == 8) {
				try{
					String plateid = session.getAttribute("changePic_Id").toString();
					System.out.println("plateid --> "+plateid);
					String platePic = doUpload(request, out);
					System.out.println("platePic --> "+platePic);
					platePic = platePic.substring(50, platePic.length());
					platePic = "http://10.145.45.110:8080/wzbcbbs/upload/" + platePic;
					System.out.println("platePic --> "+platePic);
					Plate plate = new Plate();
					plate.setPlate_id(Integer.parseInt(plateid));
					plate.setPlate_picture(platePic);
					PlateDao plateDao = new PlateDao();
					if (plateDao.changePic(plate)) {
						out.print("<script>alert(\"修改成功\");window.location.href=\"adminContent.jsp\";</script>");
					} else {
						out.print("<script>alert(\"修改错误\");window.location.href=\"changeUser.jsp?plateid=" + plateid
								+ ".jsp\";</script>");
					}
				} catch(Exception e ){
					e.printStackTrace();
					out.print("<script>alert(\"上传失败\");window.location.href=\"adminContent.jsp\";</script>");
				}
			}else if (method == 9) {
				try{
					String userid = session.getAttribute("changePic_userId").toString();
					String userPic = douserUpload(request, out);
					System.out.println("userPic--"+userPic);
					userPic = userPic.substring(55, userPic.length());
					userPic = "http://10.145.45.110:8080/wzbcbbs/userHeadimg/" + userPic;
					System.out.println("platePic --> "+userPic);
					User user = new User();
					user.setUser_id(Integer.parseInt(userid));
					user.setUserpicture_url(userPic);
					UserDao userDao = new UserDao();
					if (userDao.changeuserPic(user)) {
						out.print("<script>alert(\"修改成功\");window.location.href=\"dome.jsp?userid="+userid+"\";</script>");
					} else {
						out.print("<script>alert(\"修改错误\");window.location.href=\"changeUser.jsp?plateid=" + userid
								+ ".jsp\";</script>");
					}
				} catch(Exception e ){
					e.printStackTrace();
					out.print("<script>alert(\"上传失败\");window.location.href=\"adminContent.jsp\";</script>");
				}
			}else if (method == 10) {
				//String plateid = request.getParameter("plate_id");
				String platename = request.getParameter("plate_name");
				String mottoone = request.getParameter("motto_one");
				String mottotwo = request.getParameter("motto_two");
				String mottothree = request.getParameter("motto_three");
				String platecont = request.getParameter("plate_cont");
				Plate plate = new Plate();
				//plate.setPlate_id(Integer.parseInt(plateid));
				plate.setPlate_name(platename);
				plate.setMotto_one(mottoone);
				plate.setMotto_two(mottotwo);
				plate.setMotto_three(mottothree);
				plate.setPlate_cont(platecont);
				PlateDao plateDao = new PlateDao();
				if (plateDao.addPlate(plate)) {
					out.print("<script>alert(\"修改成功\");window.location.href=\"adminContent.jsp\";</script>");
				} else {
					out.print("<script>alert(\"修改错误\");window.location.href=\"adminContent.jsp\";</script>");
				}
			}
			
			
			
			

		} catch (Exception e) {
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

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username -->　" + username);
		System.out.println("password -->　" + password);

		UserDao userDao = new UserDao();
		User user = userDao.judgeUserPassword(username, password);

		System.out.println("out");
		if (user == null) {
			System.out.println("out");
			out.write("<script>alert(\"请输入正确的用户名或密码！\");window.location.href=\"index.jsp\";</script>");

			out.flush();
			out.close();
			// return;
			// request.getRequestDispatcher("index.jsp").forward(request,
			// response);

		} else {
			HttpSession session = request.getSession();
			session.setAttribute("isLogin", 1);
			session.setAttribute("isAdmin", 0);
			session.setAttribute("id", user.getUser_id());
			session.setAttribute("name", user.getUser_name());

			// session.setAttribute("imgUrl", user.getUserpicture_url());
			request.getRequestDispatcher("content.jsp").forward(request, response);
		}
	}

	private void quit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		session.invalidate();
		out.write("<script>alert(\"注销成功！即将跳转回登陆界面……\");window.location.href=\"index.jsp\";</script>");
	}

	public String doUpload(HttpServletRequest request, PrintWriter out) {
		String str_url = "";
		// 定义上载文件的最大字节
		int MAX_SIZE = 102400 * 102400;
		// 创建根路径的保存变量
		String rootPath;
		// 声明文件读入类
		DataInputStream in = null;
		FileOutputStream fileOut = null;
		// 取得客户端的网络地址
		String remoteAddr = request.getRemoteAddr();
		// 获得服务器的名字
		String serverName = request.getServerName();

		// 取得互联网程序的绝对地址
		String realPath = request.getRealPath(serverName);
		realPath = realPath.substring(0, realPath.lastIndexOf("\\"));
		// 创建文件的保存目录
		rootPath = realPath + "\\upload\\";
		//rootPath = "http://10.145.45.110:8080/wzbcbbs/assets/images/";
		// 取得客户端上传的数据类型
		String contentType = request.getContentType();
		try {
			if (contentType.indexOf("multipart/form-data") >= 0) {
				// 读入上传的数据
				in = new DataInputStream(request.getInputStream());
				int formDataLength = request.getContentLength();
				if (formDataLength > MAX_SIZE) {
					out.write("<script>alert(\"上传的文件字节数不可以超过" + MAX_SIZE + "\");</script>");			
				}
				// 保存上传文件的数据
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;
				// 上传的数据保存在byte数组
				while (totalBytesRead < formDataLength) {
					byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
					totalBytesRead += byteRead;
				}
				// 根据byte数组创建字符串
				String file = new String(dataBytes);
				// out.println(file);
				// 取得上传的数据的文件名
				String saveFile = file.substring(file.indexOf("filename=\"") + 10);
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
				int lastIndex = 0;
				String boundary = null;
				String fileName = null;
//					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//					Date curDate = new Date(System.currentTimeMillis());
//					String str = formatter.format(curDate);
//					saveFile = str;
					lastIndex = contentType.lastIndexOf("=");
					// 取得数据的分隔字符串
					boundary = contentType.substring(lastIndex + 1, contentType.length());
					// 创建保存路径的文件名
					fileName = rootPath + saveFile;
				int pos;
				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				int boundaryLocation = file.indexOf(boundary, pos) - 4;
				// out.println(boundaryLocation);
				// 取得文件数据的开始的位置
				int startPos = ((file.substring(0, pos)).getBytes()).length;
				// out.println(startPos);
				// 取得文件数据的结束的位置
				int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
				// out.println(endPos);
				// 检查上载文件是否存在
				File checkFile = new File(fileName);
				if (checkFile.exists()) {
					return fileName;
				}
				// 检查上载文件的目录是否存在
				File fileDir = new File(rootPath);
				if (!fileDir.exists()) {
					fileDir.mkdirs();
				}
				// 创建文件的写出类
				fileOut = new FileOutputStream(fileName);
				// 保存文件的数据
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.close();
				str_url = fileName;
			} else {
				String content = request.getContentType();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return str_url;
	}

	public String douserUpload(HttpServletRequest request, PrintWriter out) {
		String str_url = "";
		// 定义上载文件的最大字节
		int MAX_SIZE = 102400 * 102400;
		// 创建根路径的保存变量
		String rootPath;
		// 声明文件读入类
		DataInputStream in = null;
		FileOutputStream fileOut = null;
		// 取得客户端的网络地址
		String remoteAddr = request.getRemoteAddr();
		// 获得服务器的名字
		String serverName = request.getServerName();

		// 取得互联网程序的绝对地址
		String realPath = request.getRealPath(serverName);
		realPath = realPath.substring(0, realPath.lastIndexOf("\\"));
		// 创建文件的保存目录
		rootPath = realPath + "\\userHeadimg\\";
		//rootPath = "http://10.145.45.110:8080/wzbcbbs/assets/images/";
		// 取得客户端上传的数据类型
		String contentType = request.getContentType();
		try {
			if (contentType.indexOf("multipart/form-data") >= 0) {
				// 读入上传的数据
				in = new DataInputStream(request.getInputStream());
				int formDataLength = request.getContentLength();
				if (formDataLength > MAX_SIZE) {
					out.write("<script>alert(\"上传的文件字节数不可以超过" + MAX_SIZE + "\");</script>");			
				}
				// 保存上传文件的数据
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;
				// 上传的数据保存在byte数组
				while (totalBytesRead < formDataLength) {
					byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
					totalBytesRead += byteRead;
				}
				// 根据byte数组创建字符串
				String file = new String(dataBytes);
				// out.println(file);
				// 取得上传的数据的文件名
				String saveFile = file.substring(file.indexOf("filename=\"") + 10);
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
				int lastIndex = 0;
				String boundary = null;
				String fileName = null;
//					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//					Date curDate = new Date(System.currentTimeMillis());
//					String str = formatter.format(curDate);
//					saveFile = str;
					lastIndex = contentType.lastIndexOf("=");
					// 取得数据的分隔字符串
					boundary = contentType.substring(lastIndex + 1, contentType.length());
					// 创建保存路径的文件名
					fileName = rootPath + saveFile;
				int pos;
				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				int boundaryLocation = file.indexOf(boundary, pos) - 4;
				// out.println(boundaryLocation);
				// 取得文件数据的开始的位置
				int startPos = ((file.substring(0, pos)).getBytes()).length;
				// out.println(startPos);
				// 取得文件数据的结束的位置
				int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
				// out.println(endPos);
				// 检查上载文件是否存在
				File checkFile = new File(fileName);
				if (checkFile.exists()) {
					return fileName;
				}
				// 检查上载文件的目录是否存在
				File fileDir = new File(rootPath);
				if (!fileDir.exists()) {
					fileDir.mkdirs();
				}
				// 创建文件的写出类
				fileOut = new FileOutputStream(fileName);
				// 保存文件的数据
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.close();
				str_url = fileName;
			} else {
				String content = request.getContentType();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return str_url;
	}
}

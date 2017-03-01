package com.wzbcbbs.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.wzbcbbs.db.DataBase;
import com.wzbcbbs.db.Plate;
import com.wzbcbbs.db.User;

public class UserDao {
	public User judgeUserPassword(String username, String password) {
		// 用户登录验证
		DataBase dbmanage = new DataBase();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		User user = null;
		try {
			conn = dbmanage.getConn();
			stmt = conn.createStatement();
			System.out.println(username);
			System.out.println(password);
			String sql = "SELECT * FROM user WHERE user_name = '" + username + "' AND user_pw= '" + password + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pw(rs.getString("user_pw"));
				user.setUser_id(rs.getInt("user_id"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			// 执行完关闭数据库
			dbmanage.close(conn);
			dbmanage.close(rs);
			dbmanage.close(stmt);
		}
		// 返回查询结果
		return user;
	}

	public List<User> selectUserList() {
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		List<User> listUser = new ArrayList<User>();
		String sql = "select * from user";
		User user = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUser_id(Integer.parseInt(rs.getString("user_id")));
				user.setUser_name(rs.getString("user_name"));
				user.setSex(rs.getString("sex"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_faculty(rs.getString("user_faculty"));
				user.setUser_posts(Integer.parseInt(rs.getString("user_posts")));
				listUser.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(rs);
		DataBase.close(ps);
		return listUser;
	}

	public User selectUser(String id) {
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		List<User> listUser = new ArrayList<User>();
		String sql = "select * from user where user_id = " + id;
		User user = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUser_id(Integer.parseInt(rs.getString("user_id")));
				user.setUser_name(rs.getString("user_name"));
				user.setSex(rs.getString("sex"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_faculty(rs.getString("user_faculty"));
				user.setUser_posts(Integer.parseInt(rs.getString("user_posts")));
				listUser.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(rs);
		DataBase.close(ps);
		return user;
	}

	public boolean changeUser(User user) {
		boolean suc = false;
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		String sql = null;
		sql = "update user set user_name = ?, user_email = ?, user_faculty = ? where user_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUser_name());
			ps.setString(2, user.getUser_email());
			ps.setString(3, user.getUser_faculty());
			ps.setInt(4, user.getUser_id());
			if (ps.executeUpdate() > 0) {
				suc = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(ps);
		return suc;
	}
	
	public boolean changeuserPic(User user) {
		boolean suc = false;
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		String sql = null;
		sql = "update user set userpicture_url = ? where user_id = ?";
		//System.out.println("plate_picture --> " + plate.getPlate_picture());
		//System.out.println("plate_id --> " + plate.getPlate_id());
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserpicture_url());
			ps.setInt(2, user.getUser_id());
			if (ps.executeUpdate() > 0) {
				suc = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(ps);
		return suc;
	}

	public boolean deleteUser(String id) {
		boolean suc = false;
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		String sql = null;
		sql = "delete from user where user_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			if (ps.executeUpdate() > 0)
				suc = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(ps);
		return suc;
	}
}

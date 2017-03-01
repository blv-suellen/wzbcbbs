package com.wzbcbbs.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.wzbcbbs.db.Admin;
import com.wzbcbbs.db.DataBase;
import com.wzbcbbs.db.User;

public class AdminDao {

	Connection conn = null;

	public Admin adminLogin(Admin admin) {
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Admin return_admin = new Admin();
		String sql = "SELECT * FROM admin WHERE admin_name = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, admin.getAdmin_name());
			rs = ps.executeQuery();
			if (rs.next()) {
				return_admin.setAdmin_name(rs.getString("admin_name"));
				return_admin.setAdmin_pw(rs.getString("admin_pw"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// 执行完关闭数据库
			DataBase.close(conn);
			DataBase.close(rs);
			DataBase.close(ps);
		}
		return return_admin;
	}
	
	
}

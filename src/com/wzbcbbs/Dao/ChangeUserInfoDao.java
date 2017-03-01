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

public class ChangeUserInfoDao {
		public boolean changeusersl(User user){
			boolean up = false;
			Connection conn = null;
			conn = DataBase.getConn();
			PreparedStatement rs = null;
	        String sql = null;
	        sql = "update user set slogan = ? where user_id = ?";
			try {
				rs = conn.prepareStatement(sql);
				rs.setString(1,user.getSlogan());
				rs.setInt(2, user.getUser_id());
				if (rs.executeUpdate() > 0) {
					up = true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DataBase.close(conn);
			DataBase.close(rs);
			return up;
	      }

		public String getOldPwd(String id){
			String oldpwd = "";
			Connection conn = null;
			conn = DataBase.getConn();
			PreparedStatement ps = null;
			String sql = "select * from user where user_id = " + id;
			ResultSet rs = null;
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				if (rs.next()) {
					oldpwd = rs.getString("user_pw");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DataBase.close(conn);
			DataBase.close(rs);
			DataBase.close(ps);
			return oldpwd;
		}

		public boolean changePwd(String id, String pwd){
			boolean suc = false;
			Connection conn = null;
			conn = DataBase.getConn();
			PreparedStatement ps = null;
			String sql = null;
			sql = "update user set user_pw = ? where user_id = ?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, pwd);
				ps.setString(2, id);
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
}
		

